import 'package:dashboard_for_url_shortner/core/networking/api_constants.dart';
import 'package:dashboard_for_url_shortner/core/networking/end_points.dart';
import 'package:dashboard_for_url_shortner/features/links/data/model/create_link_response.dart';
import 'package:dashboard_for_url_shortner/features/links/data/model/get_all_links_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../model/create_link_request.dart' show CreateLinkRequest;
import '../model/toggle_link_response.dart';

part 'links_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class LinksDataSource {
  factory LinksDataSource(Dio dio, {String baseUrl}) = _LinksDataSource;

  @POST(EndPoints.generatelinks)
  Future<CreateLinkResponse> createLink(@Body() CreateLinkRequest request);

  @GET(EndPoints.getLinks)
  Future<GetLinksResponse> getAllLinks();

  @DELETE('delete-link/{id}')
  Future<void> deleteLink(@Path('id') String id);

  @POST('toggle-link/{id}')
  Future<ToggleLinkResponse> toggleLink(@Path('id') String id);
}
