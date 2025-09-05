#!/usr/bin/env python3
"""
CSVファイルからSupabaseシードデータを生成するスクリプト

使用方法:
    python scripts/generate_seed_data.py

このスクリプトは以下のファイルを読み込みます:
- スポンサー掲載情報 - スポンサー情報.csv
- スポンサー掲載情報 - 企業情報.csv

そして以下のシードファイルを生成します:
- supabase/seeds/001_companies.sql
- supabase/seeds/003_company_drafts.sql
- supabase/seeds/003_sponsors.sql
"""

import csv
import os
from datetime import datetime
from typing import Dict, List, Optional, Tuple


def read_csv_file(file_path: str) -> List[Dict[str, str]]:
    """CSVファイルを読み込んで辞書のリストとして返す"""
    data = []
    with open(file_path, 'r', encoding='utf-8') as f:
        reader = csv.DictReader(f)
        for row in reader:
            data.append(row)
    return data


def escape_sql_string(value: str) -> str:
    """SQL文字列をエスケープする"""
    if not value or value == '-':
        return 'NULL'
    # シングルクォートをエスケープ
    escaped = value.replace("'", "''")
    return f"'{escaped}'"


def escape_company_name(name: str) -> str:
    """企業名をSQL用にエスケープする"""
    return name.replace("'", "''")


def generate_companies_sql(sponsor_data: List[Dict], company_data: List[Dict]) -> str:
    """companiesテーブルのシードSQLを生成"""
    sql_parts = [
        "WITH",
        "    timestamp AS (",
        "        SELECT",
        "            '2025-06-01 00:00:00'::timestamp AS ts",
        "    )",
        "INSERT INTO",
        "    public.companies (name, logo_name, created_at, updated_at)",
        "SELECT",
        "    name,",
        "    logo_name,",
        "    ts,",
        "    ts",
        "FROM",
        "    (",
        "        VALUES"
    ]
    
    # 企業情報から会社名とロゴ名を取得
    company_info_map = {row['申し込み名']: row for row in company_data}
    
    values = []
    processed_companies = set()  # 重複を避けるため
    
    for row in sponsor_data:
        company_name = row['申し込み名']
        if company_name in company_info_map:
            company_info = company_info_map[company_name]
            # 表示会社名を使用（申し込み名ではなく）
            display_name = company_info['表示会社名']
            logo_name = company_info['ロゴ名']
            
            # 重複チェック
            if display_name not in processed_companies and logo_name and logo_name != '-':
                escaped_display_name = escape_company_name(display_name)
                values.append(f"            ('{escaped_display_name}', '{logo_name}')")
                processed_companies.add(display_name)
    
    sql_parts.append(",\n".join(values))
    sql_parts.extend([
        "    ) AS companies (name, logo_name)",
        "    CROSS JOIN timestamp;",
        ""
    ])
    
    return "\n".join(sql_parts)


def generate_company_drafts_sql(sponsor_data: List[Dict], company_data: List[Dict]) -> str:
    """company_draftsテーブルのシードSQLを生成"""
    sql_parts = [
        "WITH",
        "    timestamp AS (",
        "        SELECT",
        "            '2025-06-01 00:00:00'::timestamp AS ts",
        "    )",
        "INSERT INTO",
        "    public.company_drafts (company_id, slug, pr_text, website_url, x_account, created_at, updated_at)",
        "SELECT",
        "    c.id,",
        "    slug,",
        "    pr_text,",
        "    website_url,",
        "    x_account,",
        "    ts,",
        "    ts",
        "FROM",
        "    (",
        "        VALUES"
    ]
    
    # 企業情報から詳細情報を取得
    company_info_map = {row['申し込み名']: row for row in company_data}
    
    values = []
    
    for row in sponsor_data:
        company_name = row['申し込み名']
        if company_name in company_info_map:
            company_info = company_info_map[company_name]
            
            # 表示会社名を使用
            display_name = company_info['表示会社名']
            slug = company_info.get('スラッグ', '')
            pr_text = company_info.get('PR文章', '')
            website_url = company_info.get('サイトURL ', '')
            x_account = company_info.get('Xアカウント', '')
            
            # 必須フィールドのチェックとデフォルト値の設定
            if not slug or slug == '-':
                print(f"警告: {company_name} のスラッグが不足しているためスキップします")
                continue
            
            if not pr_text or pr_text == '-':
                pr_text = f"{display_name}の企業情報"
                print(f"警告: {company_name} のPR文章が不足しているためデフォルト値を設定します")
            
            if not website_url or website_url == '-':
                website_url = 'https://example.com'  # デフォルトURL
                print(f"警告: {company_name} のサイトURLが不足しているためデフォルト値を設定します")
            
            # 空の値をNULLに変換
            escaped_display_name = escape_company_name(display_name)
            slug = escape_sql_string(slug)
            pr_text = escape_sql_string(pr_text)
            website_url = escape_sql_string(website_url)
            x_account = escape_sql_string(x_account) if x_account and x_account != '-' else 'NULL'
            
            values.append(f"            ('{escaped_display_name}', {slug}, {pr_text}, {website_url}, {x_account})")
    
    sql_parts.append(",\n".join(values))
    sql_parts.extend([
        "    ) AS drafts (company_name, slug, pr_text, website_url, x_account)",
        "    JOIN public.companies c ON c.name = drafts.company_name",
        "    CROSS JOIN timestamp;",
        "",
        "-- company_drafts の全てのレコードを承認ユーザーで承認する",
        "WITH",
        "    draft_ids AS (",
        "        SELECT",
        "            id",
        "        FROM",
        "            public.company_drafts",
        "    ),",
        "    timestamp AS (",
        "        SELECT",
        "            '2025-06-01 00:00:00'::timestamp AS ts",
        "    )",
        "INSERT INTO",
        "    public.company_draft_approvals (company_draft_id, approved_by, created_at)",
        "SELECT",
        "    id,",
        "    '123e4567-e89b-12d3-a456-426614174000',",
        "    ts",
        "FROM",
        "    draft_ids",
        "    CROSS JOIN timestamp;",
        ""
    ])
    
    return "\n".join(sql_parts)


def generate_sponsors_sql(sponsor_data: List[Dict], company_data: List[Dict]) -> str:
    """sponsorsテーブルのシードSQLを生成"""
    sql_parts = []
    
    # 企業情報マップを作成（表示会社名でマッピング）
    company_info_map = {row['申し込み名']: row for row in company_data}
    
    # ベーシックスポンサーとツールスポンサーを分離し、ID順でソート
    basic_sponsors = []
    tool_sponsors = []
    
    for row in sponsor_data:
        sponsor_type = row['種別']
        company_name = row['申し込み名']
        
        if sponsor_type == 'ベーシック':
            basic_sponsors.append(row)
        elif sponsor_type == 'ツール':
            tool_sponsors.append(row)
    
    # ID順でソート（完全なID文字列でソート）
    def extract_id_for_sort(row):
        id_str = row['ID']
        # IDをそのまま使用（例: "01_01", "01_02", "02_01"）
        return id_str
    
    basic_sponsors.sort(key=extract_id_for_sort)
    tool_sponsors.sort(key=extract_id_for_sort)
    
    # ベーシックスポンサーの登録
    if basic_sponsors:
        sql_parts.extend([
            "-- スポンサー企業を登録",
            "WITH",
            "    timestamp AS (",
            "        SELECT",
            "            '2025-06-01 00:00:00'::timestamp AS ts",
            "    )",
            "INSERT INTO",
            "    public.sponsor_companies (company_id, sponsor_type, display_order, created_at)",
            "SELECT",
            "    c.id,",
            "    'basic'::public.company_sponsor_type,",
            "    CASE"
        ])
        
        # 表示会社名とIDを使用してCASE文を生成
        case_statements = []
        for i, row in enumerate(basic_sponsors, 1):
            company_name = row['申し込み名']
            if company_name in company_info_map:
                display_name = company_info_map[company_name]['表示会社名']
                escaped_display_name = escape_company_name(display_name)
                # IDをそのままdisplay_orderとして使用
                id_str = row['ID']
                case_statements.append(f"        WHEN c.name = '{escaped_display_name}' THEN '{id_str}'")
        
        sql_parts.append("\n".join(case_statements))
        sql_parts.extend([
            "    END,",
            "    ts",
            "FROM",
            "    public.companies c",
            "    CROSS JOIN timestamp",
            "WHERE",
            "    c.name IN ("
        ])
        
        # 表示会社名を使用
        company_names = []
        for row in basic_sponsors:
            company_name = row['申し込み名']
            if company_name in company_info_map:
                display_name = company_info_map[company_name]['表示会社名']
                escaped_display_name = escape_company_name(display_name)
                company_names.append(f"'{escaped_display_name}'")
        
        sql_parts.append("        " + ",\n        ".join(company_names))
        sql_parts.extend([
            "    );",
            ""
        ])
    
    # ツールスポンサーの登録
    if tool_sponsors:
        sql_parts.extend([
            "-- ツールスポンサーのプランを設定",
            "WITH",
            "    timestamp AS (",
            "        SELECT",
            "            '2025-06-01 00:00:00'::timestamp AS ts",
            "    )",
            "INSERT INTO",
            "    public.sponsor_companies (company_id, sponsor_type, display_order, created_at)",
            "SELECT",
            "    c.id,",
            "    'tool'::public.company_sponsor_type,",
            "    CASE"
        ])
        
        # 表示会社名とIDを使用してCASE文を生成
        case_statements = []
        for row in tool_sponsors:
            company_name = row['申し込み名']
            if company_name in company_info_map:
                display_name = company_info_map[company_name]['表示会社名']
                escaped_display_name = escape_company_name(display_name)
                # IDをそのままdisplay_orderとして使用
                id_str = row['ID']
                case_statements.append(f"        WHEN c.name = '{escaped_display_name}' THEN '{id_str}'")
        
        sql_parts.append("\n".join(case_statements))
        sql_parts.extend([
            "    END,",
            "    ts",
            "FROM",
            "    public.companies c",
            "    CROSS JOIN timestamp",
            "WHERE",
            "    c.name IN ("
        ])
        
        # 表示会社名を使用
        company_names = []
        for row in tool_sponsors:
            company_name = row['申し込み名']
            if company_name in company_info_map:
                display_name = company_info_map[company_name]['表示会社名']
                escaped_display_name = escape_company_name(display_name)
                company_names.append(f"'{escaped_display_name}'")
        
        sql_parts.append("        " + ",\n        ".join(company_names))
        sql_parts.extend([
            "    );",
            ""
        ])
    
    # ベーシックスポンサーのプラン設定
    if basic_sponsors:
        sql_parts.extend([
            "-- ベーシックスポンサーのプランを設定",
            "WITH",
            "    timestamp AS (",
            "        SELECT",
            "            '2025-06-01 00:00:00'::timestamp AS ts",
            "    )",
            "INSERT INTO",
            "    public.basic_sponsor_companies (sponsor_company_id, basic_plan_type, created_at)",
            "SELECT",
            "    sc.id,",
            "    CASE"
        ])
        
        # プランタイプのマッピング
        plan_mapping = {
            'プラチナ': 'platinum',
            'ゴールド': 'gold', 
            'シルバー': 'silver',
            'ブロンズ': 'bronze'
        }
        
        case_statements = []
        for row in basic_sponsors:
            company_name = row['申し込み名']
            if company_name in company_info_map:
                display_name = company_info_map[company_name]['表示会社名']
                escaped_display_name = escape_company_name(display_name)
                plan_type = row['ベーシックプラン']
                if plan_type in plan_mapping:
                    case_statements.append(f"        WHEN c.name = '{escaped_display_name}' THEN '{plan_mapping[plan_type]}'::public.basic_plan_type")
        
        sql_parts.append("\n".join(case_statements))
        sql_parts.extend([
            "    END,",
            "    ts",
            "FROM",
            "    public.sponsor_companies sc",
            "    JOIN public.companies c ON sc.company_id = c.id",
            "    CROSS JOIN timestamp",
            "WHERE",
            "    sc.sponsor_type = 'basic'",
            "    AND c.name IN ("
        ])
        
        # 表示会社名を使用
        company_names = []
        for row in basic_sponsors:
            company_name = row['申し込み名']
            if company_name in company_info_map:
                display_name = company_info_map[company_name]['表示会社名']
                escaped_display_name = escape_company_name(display_name)
                company_names.append(f"'{escaped_display_name}'")
        
        sql_parts.append("        " + ",\n        ".join(company_names))
        sql_parts.extend([
            "    );",
            ""
        ])
    
    # オプションプランの設定
    sql_parts.extend([
        "-- オプションプランの設定",
        "-- ネーミングライツ・ホール",
        "WITH",
        "    timestamp AS (",
        "        SELECT",
        "            '2025-06-01 00:00:00'::timestamp AS ts",
        "    )",
        "INSERT INTO",
        "    public.sponsor_company_options (sponsor_company_id, option_plan_type, created_at)",
        "SELECT",
        "    sc.id,",
        "    'naming_rights_hall'::public.option_plan_type,",
        "    ts",
        "FROM",
        "    public.sponsor_companies sc",
        "    JOIN public.companies c ON sc.company_id = c.id",
        "    CROSS JOIN timestamp",
        "WHERE",
        "    sc.sponsor_type = 'basic'",
        "    AND c.name IN ("
    ])
    
    # ネーミングライツ・ホールの企業を取得
    naming_rights_companies = []
    for row in basic_sponsors:
        company_name = row['申し込み名']
        if company_name in company_info_map and row['ネーミングライツ'] == 'ホール':
            display_name = company_info_map[company_name]['表示会社名']
            escaped_display_name = escape_company_name(display_name)
            naming_rights_companies.append(f"'{escaped_display_name}'")
    
    if naming_rights_companies:
        sql_parts.append("        " + ",\n        ".join(naming_rights_companies))
    else:
        sql_parts.append("        -- 該当企業なし")
    
    sql_parts.extend([
        "    );",
        "",
        "-- ネームプレート",
        "WITH",
        "    timestamp AS (",
        "        SELECT",
        "            '2025-06-01 00:00:00'::timestamp AS ts",
        "    )",
        "INSERT INTO",
        "    public.sponsor_company_options (sponsor_company_id, option_plan_type, created_at)",
        "SELECT",
        "    sc.id,",
        "    'nameplate'::public.option_plan_type,",
        "    ts",
        "FROM",
        "    public.sponsor_companies sc",
        "    JOIN public.companies c ON sc.company_id = c.id",
        "    CROSS JOIN timestamp",
        "WHERE",
        "    sc.sponsor_type = 'basic'",
        "    AND c.name IN ("
    ])
    
    # ネームプレートの企業を取得
    nameplate_companies = []
    for row in basic_sponsors:
        company_name = row['申し込み名']
        if company_name in company_info_map and row['ネームプレート'] == '有り':
            display_name = company_info_map[company_name]['表示会社名']
            escaped_display_name = escape_company_name(display_name)
            nameplate_companies.append(f"'{escaped_display_name}'")
    
    if nameplate_companies:
        sql_parts.append("        " + ",\n        ".join(nameplate_companies))
    else:
        sql_parts.append("        -- 該当企業なし")
    
    sql_parts.extend([
        "    );",
        "",
        "-- 弁当",
        "-- WITH",
        "--     timestamp AS (",
        "--         SELECT",
        "--             '2025-06-01 00:00:00'::timestamp AS ts",
        "--     )",
        "-- INSERT INTO",
        "--     public.sponsor_company_options (sponsor_company_id, option_plan_type, created_at)",
        "-- SELECT",
        "--     sc.id,",
        "--     'lunch'::public.option_plan_type,",
        "--     ts",
        "-- FROM",
        "--     public.sponsor_companies sc",
        "--     JOIN public.companies c ON sc.company_id = c.id",
        "--     CROSS JOIN timestamp",
        "-- WHERE",
        "--     sc.sponsor_type = 'basic'",
        "--     AND c.name IN ();",
        "-- スカラシップ",
        "WITH",
        "    timestamp AS (",
        "        SELECT",
        "            '2025-06-01 00:00:00'::timestamp AS ts",
        "    )",
        "INSERT INTO",
        "    public.sponsor_company_options (sponsor_company_id, option_plan_type, created_at)",
        "SELECT",
        "    sc.id,",
        "    'scholarship'::public.option_plan_type,",
        "    ts",
        "FROM",
        "    public.sponsor_companies sc",
        "    JOIN public.companies c ON sc.company_id = c.id",
        "    CROSS JOIN timestamp",
        "WHERE",
        "    sc.sponsor_type = 'basic'",
        "    AND c.name IN ("
    ])
    
    # スカラシップの企業を取得
    scholarship_companies = []
    for row in basic_sponsors:
        company_name = row['申し込み名']
        if company_name in company_info_map and row['スカラシップ'] == '有り':
            display_name = company_info_map[company_name]['表示会社名']
            escaped_display_name = escape_company_name(display_name)
            scholarship_companies.append(f"'{escaped_display_name}'")
    
    if scholarship_companies:
        sql_parts.append("        " + ",\n        ".join(scholarship_companies))
    else:
        sql_parts.append("        -- 該当企業なし")
    
    sql_parts.extend([
        "    );",
        ""
    ])
    
    return "\n".join(sql_parts)


def main():
    """メイン処理"""
    # CSVファイルのパス
    sponsor_csv_path = "スポンサー掲載情報 - スポンサー情報.csv"
    company_csv_path = "スポンサー掲載情報 - 企業情報.csv"
    
    # シードファイルの出力パス
    companies_sql_path = "supabase/seeds/001_companies.sql"
    company_drafts_sql_path = "supabase/seeds/003_company_drafts.sql"
    sponsors_sql_path = "supabase/seeds/003_sponsors.sql"
    
    print("CSVファイルを読み込み中...")
    
    # CSVファイルを読み込み
    try:
        sponsor_data = read_csv_file(sponsor_csv_path)
        company_data = read_csv_file(company_csv_path)
        print(f"スポンサー情報: {len(sponsor_data)}件")
        print(f"企業情報: {len(company_data)}件")
    except FileNotFoundError as e:
        print(f"エラー: CSVファイルが見つかりません - {e}")
        return
    
    # SQLファイルを生成
    print("SQLファイルを生成中...")
    
    companies_sql = generate_companies_sql(sponsor_data, company_data)
    company_drafts_sql = generate_company_drafts_sql(sponsor_data, company_data)
    sponsors_sql = generate_sponsors_sql(sponsor_data, company_data)
    
    # ファイルに書き込み
    try:
        with open(companies_sql_path, 'w', encoding='utf-8') as f:
            f.write(companies_sql)
        print(f"✓ {companies_sql_path} を生成しました")
        
        with open(company_drafts_sql_path, 'w', encoding='utf-8') as f:
            f.write(company_drafts_sql)
        print(f"✓ {company_drafts_sql_path} を生成しました")
        
        with open(sponsors_sql_path, 'w', encoding='utf-8') as f:
            f.write(sponsors_sql)
        print(f"✓ {sponsors_sql_path} を生成しました")
        
        print("\nシードデータの生成が完了しました！")
        
    except Exception as e:
        print(f"エラー: ファイルの書き込みに失敗しました - {e}")


if __name__ == "__main__":
    main()
