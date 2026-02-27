import 'package:dashboard_for_url_shortner/core/networking/api_result.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dashboard_for_url_shortner/features/links/data/model/create_link_request.dart';
import 'package:dashboard_for_url_shortner/features/links/domain/use_case/create_link_use_case.dart';
import 'package:dashboard_for_url_shortner/features/links/domain/use_case/get_all_links_use_case.dart';
import 'package:dashboard_for_url_shortner/features/links/domain/use_case/delete_link_use_case.dart';
import 'package:dashboard_for_url_shortner/features/links/domain/use_case/toggle_link_status_use_case.dart';
import 'links_state.dart';

class LinksCubit extends Cubit<LinksState> {
  final CreateLinkUseCase _createLinkUseCase;
  final GetAllLinksUseCase _getAllLinksUseCase;
  final DeleteLinkUseCase _deleteLinkUseCase;
  final ToggleLinkStatusUseCase _toggleLinkStatusUseCase;

  LinksCubit(
    this._createLinkUseCase,
    this._getAllLinksUseCase,
    this._deleteLinkUseCase,
    this._toggleLinkStatusUseCase,
  ) : super(const LinksState());

  void selectCampaign(String campaign) {
    emit(state.copyWith(
      selectedCampaign: campaign,
      showCampaignDropdown: false,
    ));
  }

  void selectStatus(String status) {
    emit(state.copyWith(
      selectedStatus: status,
      showStatusDropdown: false,
    ));
  }

  void updateSearchQuery(String query) {
    emit(state.copyWith(searchQuery: query));
  }

  void toggleCampaignDropdown() {
    emit(state.copyWith(
      showCampaignDropdown: !state.showCampaignDropdown,
      showStatusDropdown: false,
    ));
  }

  void toggleStatusDropdown() {
    emit(state.copyWith(
      showStatusDropdown: !state.showStatusDropdown,
      showCampaignDropdown: false,
    ));
  }

  void closeCampaignDropdown() {
    if (state.showCampaignDropdown) {
      emit(state.copyWith(showCampaignDropdown: false));
    }
  }

  void closeStatusDropdown() {
    if (state.showStatusDropdown) {
      emit(state.copyWith(showStatusDropdown: false));
    }
  }

  void closeAllDropdowns() {
    if (state.showCampaignDropdown || state.showStatusDropdown) {
      emit(state.copyWith(
        showCampaignDropdown: false,
        showStatusDropdown: false,
      ));
    }
  }

  void addLink(Map<String, dynamic> link) {
    final updatedLinks = List<Map<String, dynamic>>.from(state.links)..add(link);
    emit(state.copyWith(links: updatedLinks));
  }

  void removeLink(int index) {
    final updatedLinks = List<Map<String, dynamic>>.from(state.links)
      ..removeAt(index);
    emit(state.copyWith(links: updatedLinks));
  }

  void updateLink(int index, Map<String, dynamic> link) {
    final updatedLinks = List<Map<String, dynamic>>.from(state.links);
    updatedLinks[index] = link;
    emit(state.copyWith(links: updatedLinks));
  }


  /// Fetch all links
  Future<void> getLinks() async {
    emit(state.copyWith(isLoadingLinks: true, error: null, successMessage: null));

    final result = await _getAllLinksUseCase();

    result.map(
      success: (success) {
        final response = success.data;
        final linksList = response.data.map((linkModel) {
          return {
            'id': linkModel.id,
            'short': linkModel.shortCode,
            'original': linkModel.originalLink,
            'title': linkModel.title ?? '',
            'status': linkModel.isActive,
            'visits': linkModel.clicksCount,
          };
        }).toList();

        emit(state.copyWith(
          links: linksList,
          isLoadingLinks: false,
          error: null,
        ));
      },
      failure: (failure) {
        emit(state.copyWith(
          isLoadingLinks: false,
          error: failure.apiErrorModel,
        ));
      },
    );
  }

  /// Create a new link
  Future<void> createLink({
    required String originalUrl,
    String? customAlias,
    String? title,
  }) async {
    emit(state.copyWith(isCreatingLink: true, error: null, successMessage: null));

    final request = CreateLinkRequest(
      originalUrl: originalUrl,
      customAlias: customAlias,
      title: title,
    );

    final result = await _createLinkUseCase(request);

    result.map(
      success: (success) {
        final response = success.data;
        final newLink = {
          'id': response.data.id,
          'short': response.data.shortCode,
          'original': response.data.originalLink,
          'title': response.data.title ?? '',
          'status': response.data.isActive,
          'visits': response.data.clicksCount,
        };

        addLink(newLink);

        emit(state.copyWith(
          isCreatingLink: false,
          error: null,
          successMessage: response.message,
        ));
      },
      failure: (failure) {
        emit(state.copyWith(
          isCreatingLink: false,
          error: failure.apiErrorModel,
        ));
      },
    );
  }

  /// Delete a link by ID
  Future<void> deleteLink(String linkId) async {
    emit(state.copyWith(isDeletingLink: true, successMessage: null));

    final result = await _deleteLinkUseCase(linkId);

    result.map(
      success: (success) {
        final response = success.data;
        final updatedLinks = state.links.where((link) => link['id'] != linkId).toList();

        emit(state.copyWith(
          links: updatedLinks,
          isDeletingLink: false,
          successMessage: response.message,
        ));
      },
      failure: (failure) {
        emit(state.copyWith(
          isDeletingLink: false,
          successMessage: 'Failed to delete link: ${failure.apiErrorModel.message}',
        ));
      },
    );
  }

  /// Toggle link status (active/inactive)
  Future<void> toggleLinkStatus(String linkId) async {
    emit(state.copyWith(isTogglingLink: true, successMessage: null));

    final result = await _toggleLinkStatusUseCase(linkId);

    result.map(
      success: (success) {
        final response = success.data;
        final linkIndex = state.links.indexWhere((link) => link['id'] == linkId);
        if (linkIndex != -1) {
          final updatedLink = {
            ...state.links[linkIndex],
            'status': response.isActive ?? state.links[linkIndex]['status'],
          };
          updateLink(linkIndex, updatedLink);
        }

        emit(state.copyWith(
          isTogglingLink: false,
          successMessage: response.message,
        ));
      },
      failure: (failure) {
        emit(state.copyWith(
          isTogglingLink: false,
          successMessage: 'Failed to toggle status: ${failure.apiErrorModel.message}',
        ));
      },
    );
  }

  /// Clear error message
  void clearError() {
    emit(state.copyWith(error: null));
  }

  /// Clear success message
  void clearSuccessMessage() {
    emit(state.copyWith(successMessage: null));
  }
}
