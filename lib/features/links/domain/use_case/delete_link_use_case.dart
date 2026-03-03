import 'package:dashboard_for_url_shortner/core/networking/api_result.dart';
import 'package:dashboard_for_url_shortner/features/links/data/model/get_all_links_response.dart';
import 'package:dashboard_for_url_shortner/features/links/domain/repo/create_links_repo/links_repo.dart';
class DeleteLinkUseCase {
  final linksRepo _linkRepo;
  const DeleteLinkUseCase(this._linkRepo);
  Future<ApiResult<MessageResponse>> call(String id) async {
    return await _linkRepo.deleteLink(id.toString());
  }
}
