import 'package:dashboard_for_url_shortner/core/networking/api_result.dart';
import 'package:dashboard_for_url_shortner/features/links/data/model/get_all_links_response.dart';
import 'package:dashboard_for_url_shortner/features/links/domain/repo/create_links_repo/links_repo.dart';
class GetAllLinksUseCase {
  final linksRepo _linkRepo;
  const GetAllLinksUseCase(this._linkRepo);
  Future<ApiResult<GetLinksResponse>> call() async {
    return await _linkRepo.getAllLinks();
  }
}
