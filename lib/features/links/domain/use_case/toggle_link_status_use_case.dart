import 'package:dashboard_for_url_shortner/core/networking/api_result.dart';
import 'package:dashboard_for_url_shortner/features/links/data/model/toggle_link_response.dart';
import 'package:dashboard_for_url_shortner/features/links/domain/repo/create_links_repo/links_repo.dart';
class ToggleLinkStatusUseCase {
  final linksRepo _linkRepo;
  const ToggleLinkStatusUseCase(this._linkRepo);
  Future<ApiResult<ToggleLinkResponse>> call(String id) async {
    return await _linkRepo.toggleLink(id);
  }
}
