import 'package:dashboard_for_url_shortner/core/networking/api_result.dart';
import 'package:dashboard_for_url_shortner/features/links/data/model/create_link_request.dart';
import 'package:dashboard_for_url_shortner/features/links/data/model/get_all_links_response.dart';
import 'package:dashboard_for_url_shortner/features/links/data/model/toggle_link_response.dart';

import '../../../data/model/create_link_response.dart';

abstract class linksRepo {
  Future<ApiResult<CreateLinkResponse>> createLink(CreateLinkRequest request);
  Future<ApiResult<GetLinksResponse>> getAllLinks();
  Future<ApiResult<MessageResponse>> deleteLink(String id);
  Future<ApiResult<ToggleLinkResponse>> toggleLink(String id);
}
