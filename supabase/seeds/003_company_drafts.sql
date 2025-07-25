WITH
    timestamp AS (
        SELECT
            '2025-06-01 00:00:00'::timestamp AS ts
    )
INSERT INTO
    public.company_drafts (company_id, slug, description, website_url, created_at, updated_at)
SELECT
    company_id,
    slug,
    description,
    website_url,
    ts,
    ts
FROM
    (
        VALUES
            (
                1,
                'cyberagent',
                'サイバーエージェントはインターネットを軸に、メディア&IP事業、インターネット広告事業、ゲーム事業と主に3つの事業を展開しています。その他にもIP・コンテンツ、AI、DXを強化分野として事業創出に取り組んでおり、様々な事業でFlutterの活用事例があります。社内発の社外向けの勉強会である「CA.flutter」も定期的に開催しています。',
                'https://www.cyberagent.co.jp/'
            ),
            (
                2,
                'hamee',
                '私たちHameeのPurposeは「クリエイティブ魂に火をつける」です。\nクリエイティブ魂は、自分らしさを最大限に発揮し、挑戦し、成し遂げる時に燃え盛ります。\nこの炎を広げ、世界中を熱くすることが私たちの使命です。',
                'https://hamee.co.jp/recruit/love-odawara'
            ),
            (
                3,
                'ntt-resonant-tech',
                'FlutterKaigi参加者の皆さんへ──NTTレゾナントテクノロジーはUXにこだわるNTTドコモグループの技術カンパニーです。技術を活かし、共に革新的な体験を創りませんか？フルリモート・フルフレックスで挑戦できる環境が整っています。',
                'https://nttr-tech.co.jp/'
            ),
            (
                4,
                'mixi',
                'MIXIは、「豊かなコミュニケーションを広げ、世界を幸せな驚きで包む。」というパーパスのもと、「mixi」や「モンスターストライク」など、友人や家族間で一緒に楽しむコミュニケーションサービスを提供しています。',
                'https://mixi.co.jp/'
            ),
            (
                5,
                'sentry',
                'Sentryはリアルタイムエラー追跡と詳細情報提供で迅速な問題特定を実現。多言語対応でウェブ、モバイル、バックエンドを一気通貫で監視が可能。Ichizokuとの協業で日本市場向けに特化した強力なサポートを提供し、迅速な対応を実現しています。',
                'https://sentry.ichizoku.io/'
            ),
            (
                6,
                'layerx',
                'LayerXは「すべての経済活動を、デジタル化する。」をミッションに掲げ、SaaS+Fintechを軸に、AIを中心としたソフトウェア体験を社会実装するスタートアップです。AIを活用し「時間を創造するモバイルアプリ」を一緒に作りませんか？',
                'https://layerx.co.jp'
            ),
            (
                7,
                'pioneer',
                '企業ミッション「より多くの人と、感動を」のもと、カーエレクトロニクス分野を中心に、斬新でユニークな発想とテクノロジーを活かし、車室内の快適性、感動、安心・安全を実現する製品・サービスを提供することで、新たな価値を提案していく会社です',
                'https://jpn.pioneer/ja/'
            ),
            (
                8,
                'medley',
                'メドレーは、「医療ヘルスケアの未来をつくる」ミッションのもと、テクノロジーを活用した事業やプロジェクトを通じて、医療ヘルスケア分野の課題を解決していきます。それにより、「持続可能な医療」の実現と、「納得できる医療」の実現を目指しています。',
                'https://www.medley.jp/'
            ),
            (
                9,
                'zozo',
                'ファッションEC「ZOZOTOWN」、ファッションコーディネートアプリ「WEAR by ZOZO」など各種サービスの企画・展開のほか、「ZOZOSUIT」「ZOZOMAT」「ZOZOGLASS」など計測技術の開発・活用にも取り組んでいます。',
                'https://corp.zozo.com/'
            ),
            (
                10,
                'genda',
                '「世界中の人々の人生をより楽しく」をAspirationに掲げるエンタメ企業。「GiGO」等のアミューズメント施設運営やカラオケ、キャラクターMD、F&B、コンテンツ&プロモーションなどエンタメ領域で事業を展開しています。',
                'https://genda.jp/'
            ),
            (
                11,
                'linc-well',
                'Linc''wellは「テクノロジーを通じて、医療を一歩前へ」をミッションに掲げ、医療を効率化し患者の医療体験と医療の質の向上を目指した事業展開を行っています。2023年リリースのFlutterアプリ「クリフォア」を開発する仲間を募集中です！',
                'https://linc-well.com/'
            ),
            (
                12,
                'yumemi',
                '6000万人のみんな知ってるあのサービスも、ゆめみが一緒に作ってます。大手企業や急成長スタートアップと共創型でWeb/スマホのサービス作りや内製化支援を行っています。【エンジニアが最も成長できる会社No.1】を目標にした、アジャイル組織として先端を走るエンジニア集団です。',
                'https://yumemi.co.jp/'
            ),
            (
                13,
                'coderabbit',
                'CodeRabbitはAIコードレビューサービスです。GitHub/GitLabなどのPRに対して、自動的にコードレビューを行います。レビューの負荷軽減、時間削減、チーム開発効率化に貢献します！',
                'https://www.coderabbit.ai'
            ),
            (
                14,
                'studyplus',
                'スタディプラスは「学ぶ喜びをすべての人へ」をミッションに、学習の記録・可視化・共有をサポートするStudyplusを提供しています。楽しく学びを広げるプラットフォームを一緒に作りませんか？あなたのアイデアが、学びを豊かにする力になります。',
                'https://info.studyplus.co.jp/'
            ),
            (
                15,
                'ibj',
                '様々な婚活サービスとライフデザインサービスを提供し、日本の婚姻数の3％、最も多くの結婚カップルを創出しています。\n「IT×ヒト」を強みにサービス部門だけでなく、アプリやシステムを改修・開発などクリエイターやエンジニアも活躍している会社です。',
                'https://www.ibjapan.jp/'
            ),
            (
                16,
                'dena',
                'DeNAは、事業価値の最大化と課題解決のためのAI活用と独自のデータ分析手法によって、ゲーム、ライブスコミュニティ、スポーツ・まちづくり、ヘルスケア・メディカルなど幅広い事業を展開しています。\n\nAt DeNA (pronounced "D-N-A") we use AI technology and our unique data analysis methods to maximize business value and solve problems to engage in a variety of businesses, from games and live communities to sports & the community and healthcare & medical.',
                'https://dena.com/jp/'
            ),
            (
                17,
                'geekneer',
                'ギークニアは、転職エージェントが全員元エンジニアの人材紹介会社です。エンジニア、ITコンサル、PM、データサイエンティスト、PdM、SRE、QAエンジニアなどIT専門職の方のキャリアサクセスを応援しております。',
                'https://geekneer.com/'
            ),
            (
                18,
                'tmp-assign',
                'アサインは「人」と「技術」の力で、若手ハイエンド向けのキャリア支援サービスを提供しています。\n\n転職サイト『ASSIGN』は、単なる転職支援に留まらず、長期のキャリア形成をサポートするために、キャリア実現に欠かせないパーソナライズされた情報へのアクセスを容易にしています。技術の力を最大限活用し、ユーザーへの提供価値を向上させています。\n\n若手ハイエンド特化の転職サイト『ASSIGN』\n・2019年のサービス開始以来 累計ユーザー数66万人突破\n・2021年4月からFlutterで開発',
                'https://assign-inc.com/'
            ),
            (
                19,
                'ibis',
                'アイビスはFlutterでの開発支援を通じて、関わるすべての人と企業が成長できる持続可能な関係づくりを目指しています。\n共にアイビスを創る仲間も募集しています。',
                'https://i-bis.jp/company/profile/'
            ),
            (
                20,
                'demae-can',
                '出前館はクイックコマースサービスとして領域を拡大し、当社のコーポレートミッション「テクノロジーで時間価値を高める」に基づき、利用いただいた皆さまに対して“時間価値の最大化“を実現していきたいと考えています。\n地域活性化とともに、少子高齢化や買い物難民の増加をはじめとした地域や社会課題の解決に向き合い、社会にとって不可欠なライフインフラとして日本経済の発展に貢献できるサービスを目指して挑戦を続けています。',
                'https://recruit.demae-can.co.jp/'
            ),
            (
                21,
                'm3',
                'エムスリーは"インターネットを活用し、健康で楽しく長生きする人を１人でも増やし、不必要な医療コストを１円でも減らすこと" をミッションに、テクノロジーの力で日本および世界の医療の変革にチャレンジしています。',
                'https://jobs.m3.com/product/'
            ),
            (
                22,
                'tmp-team-lab',
                '最新のテクノロジーを活用したソリューション、大規模なシステム開発、都市計画や、ICT空間設計などを行う。チームラボのFlutter活用事例はGoogle I/Oでも紹介されました。https://youtu.be/OyS812ZoTzw',
                'https://www.team-lab.com/'
            ),
            (
                23,
                'tmp-sony',
                'ソニー株式会社は「テクノロジーの力で未来のエンタテインメントをクリエイターと共創する」ことをミッションとし、世界中の人に感動を届けることをめざしています。\n新たな映像や音を表現するテクノロジーとサービスに挑戦し続け、世界中の人々を感動させるエンタテイメントの未来を、クリエイターと共に創造しています。',
                'https://www.sony.co.jp/'
            )
    ) AS drafts (company_id, slug, description, website_url)
    CROSS JOIN timestamp;

-- company_drafts の全てのレコードを承認ユーザーで承認する
WITH
    draft_ids AS (
        SELECT
            id
        FROM
            public.company_drafts
    ),
    timestamp AS (
        SELECT
            '2025-06-01 00:00:00'::timestamp AS ts
    )
INSERT INTO
    public.company_draft_approvals (company_draft_id, approved_by, created_at)
SELECT
    id,
    '123e4567-e89b-12d3-a456-426614174000',
    ts
FROM
    draft_ids
    CROSS JOIN timestamp;
