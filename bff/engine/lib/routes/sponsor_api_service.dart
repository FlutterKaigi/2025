import 'package:bff_client/bff_client.dart';
import 'package:engine/main.dart';
import 'package:engine/provider/db_client_provider.dart';
import 'package:engine/util/json_response.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'sponsor_api_service.g.dart';

class SponsorApiService {
  @Route.get('/sponsors')
  Future<Response> _getSponsors(Request request) async => jsonResponse(
    () async {
      final database = await container.read(
        dbClientProvider.future,
      );

      try {
        final sponsorSummary = await database.sponsor.getSponsorSummary();
        return sponsorSummary.toJson();
      } catch (e) {
        return {
          'error': 'Failed to fetch sponsors',
          'message': e.toString(),
        };
      }
    },
  );

  @Route.get('/sponsors/companies')
  Future<Response> _getCompanySponsors(Request request) async => jsonResponse(
    () async {
      final database = await container.read(
        dbClientProvider.future,
      );

      try {
        final companySponsors = await database.sponsor.getCompanySponsors();
        return {
          'sponsors': companySponsors.map((s) => s.toJson()).toList(),
        };
      } catch (e) {
        return {
          'error': 'Failed to fetch company sponsors',
          'message': e.toString(),
        };
      }
    },
  );

  @Route.get('/sponsors/individuals')
  Future<Response> _getIndividualSponsors(Request request) async =>
      jsonResponse(
        () async {
          final database = await container.read(
            dbClientProvider.future,
          );

          try {
            final individualSponsors = await database.sponsor
                .getIndividualSponsors();
            return {
              'sponsors': individualSponsors.map((s) => s.toJson()).toList(),
            };
          } catch (e) {
            return {
              'error': 'Failed to fetch individual sponsors',
              'message': e.toString(),
            };
          }
        },
      );

  Router get router => _$SponsorApiServiceRouter(this);
}
