import 'package:dashboard_for_url_shortner/core/networking/api_result.dart';
import 'package:dashboard_for_url_shortner/features/links/data/model/create_link_request.dart';
import 'package:dashboard_for_url_shortner/features/links/data/model/create_link_response.dart';
import 'package:dashboard_for_url_shortner/features/links/domain/repo/create_links_repo/links_repo.dart';
class CreateLinkUseCase {
  final linksRepo _linkRepo;
  const CreateLinkUseCase(this._linkRepo);
  Future<ApiResult<CreateLinkResponse>> call(CreateLinkRequest request) async {
    return await _linkRepo.createLink(request);
  }
}
