import 'package:db_client/src/client/news/news_db_client.dart';
import 'package:db_client/src/client/sponsor/sponsor_db_client.dart';
import 'package:db_client/src/client/ticket/ticket_checkout_db_client.dart';
import 'package:db_client/src/client/ticket/ticket_option_db_client.dart';
import 'package:db_client/src/client/ticket/ticket_purchase_db_client.dart';
import 'package:db_client/src/client/ticket/ticket_type_db_client.dart';
import 'package:db_client/src/client/user/user_db_client.dart';
import 'package:postgres/postgres.dart';

class DbClient {
  DbClient({
    required Connection connection,
    required String logoBaseUrl,
  }) : _connection = connection,
       _logoBaseUrl = logoBaseUrl;

  static Future<DbClient> connect(
    String connectionString, {
    required String logoBaseUrl,
    bool disableSsl = false,
  }) async {
    final connection = await Connection.open(
      parseConnectionString(connectionString),
      settings: ConnectionSettings(
        timeZone: 'Asia/Tokyo',
        applicationName: 'dart_bff_engine',
        sslMode: disableSsl ? SslMode.disable : SslMode.require,
      ),
    );
    return DbClient(
      connection: connection,
      logoBaseUrl: logoBaseUrl,
    );
  }

  final Connection _connection;
  final String _logoBaseUrl;

  UserDbClient get user => UserDbClient(connection: _connection);
  NewsDbClient get news => NewsDbClient(connection: _connection);
  SponsorDbClient get sponsor => SponsorDbClient(
    connection: _connection,
    logoBaseUrl: _logoBaseUrl,
  );
  TicketTypeDbClient get ticketType =>
      TicketTypeDbClient(connection: _connection);
  TicketOptionDbClient get ticketOption =>
      TicketOptionDbClient(connection: _connection);
  TicketPurchaseDbClient get ticketPurchase =>
      TicketPurchaseDbClient(connection: _connection);
  TicketCheckoutDbClient get ticketCheckout =>
      TicketCheckoutDbClient(connection: _connection);

  Future<void> dispose() async {
    await _connection.close();
  }

  ConnectionInfo get connectionInfo => _connection.info;

  bool get isOpen => _connection.isOpen;
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
