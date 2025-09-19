import 'dart:convert';

import 'package:db_client/src/client/news/news_db_client.dart';
import 'package:db_client/src/client/profile/profile_db_client.dart';
import 'package:db_client/src/client/sponsor/sponsor_db_client.dart';
import 'package:db_client/src/client/ticket/ticket_checkout_db_client.dart';
import 'package:db_client/src/client/ticket/ticket_option_db_client.dart';
import 'package:db_client/src/client/ticket/ticket_purchase_db_client.dart';
import 'package:db_client/src/client/ticket/ticket_type_db_client.dart';
import 'package:db_client/src/client/user/user_db_client.dart';
import 'package:postgres/postgres.dart';

class DbClient {
  DbClient({
    required Executor executor,
    required String logoBaseUrl,
  }) : _executor = executor,
       _logoBaseUrl = logoBaseUrl;

  static Future<DbClient> connect(
    String connectionString, {
    required String logoBaseUrl,
    bool disableSsl = false,
  }) async {
    final stopWatch = Stopwatch()..start();
    final connection = await Connection.open(
      parseConnectionString(connectionString),
      settings: ConnectionSettings(
        timeZone: 'Asia/Tokyo',
        applicationName: 'dart_bff_engine',
        sslMode: disableSsl ? SslMode.disable : SslMode.require,
        connectTimeout: const Duration(minutes: 1),
      ),
    );
    print(
      jsonEncode({
        'type': 'postgres-connection',
        'time': stopWatch.elapsedMicroseconds / 1000,
      }),
    );
    return DbClient(
      executor: Executor(connection: connection),
      logoBaseUrl: logoBaseUrl,
    );
  }

  final Executor _executor;
  final String _logoBaseUrl;

  UserDbClient get user => UserDbClient(executor: _executor);
  ProfileDbClient get profile => ProfileDbClient(executor: _executor);
  NewsDbClient get news => NewsDbClient(executor: _executor);
  SponsorDbClient get sponsor => SponsorDbClient(
    executor: _executor,
    logoBaseUrl: _logoBaseUrl,
  );
  TicketTypeDbClient get ticketType => TicketTypeDbClient(executor: _executor);
  TicketOptionDbClient get ticketOption =>
      TicketOptionDbClient(executor: _executor);
  TicketPurchaseDbClient get ticketPurchase =>
      TicketPurchaseDbClient(executor: _executor);
  TicketCheckoutDbClient get ticketCheckout =>
      TicketCheckoutDbClient(executor: _executor);

  Future<void> dispose() async {
    await _executor.close();
  }

  bool get isOpen => _executor.isOpen;
}

Endpoint parseConnectionString(String connectionString) {
  final uri = Uri.parse(connectionString);
  return Endpoint(
    host: uri.host,
    port: uri.port,
    database: uri.pathSegments.last,
    username: uri.userInfo.split(':').first,
    password: uri.userInfo.split(':').last,
  );
}

class Executor {
  Executor({required Connection connection}) : _connection = connection;

  final Connection _connection;

  Future<Result> execute(
    String query, {
    Map<String, dynamic>? parameters,
    bool ignoreRows = false,
    QueryMode? queryMode,
    Duration? timeout,
  }) async {
    if (!_connection.isOpen) {
      throw Exception('Connection is closed');
    }
    final stopWatch = Stopwatch()..start();
    final result = await _connection.execute(
      Sql.named(query),
      parameters: parameters,
      ignoreRows: ignoreRows,
      queryMode: queryMode,
      timeout: timeout,
    );
    print(
      jsonEncode({
        'type': 'postgres',
        'time': stopWatch.elapsedMicroseconds / 1000,
        'query': query,
        'ignoreRows': ignoreRows,
        'queryMode': queryMode,
        'timeout': timeout,
      }),
    );
    return result;
  }

  Future<R> runTx<R>(
    Future<R> Function(TxSession) fn, {
    TransactionSettings? settings,
  }) async {
    final stopWatch = Stopwatch()..start();
    final result = await _connection.runTx(fn, settings: settings);
    print(
      jsonEncode({
        'type': 'postgres-tx',
        'time': stopWatch.elapsedMicroseconds / 1000,
      }),
    );
    return result;
  }

  Future<void> close() async {
    await _connection.close();
  }

  bool get isOpen => _connection.isOpen;
}
