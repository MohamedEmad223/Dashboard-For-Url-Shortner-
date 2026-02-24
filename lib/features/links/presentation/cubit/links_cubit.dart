import 'package:flutter_bloc/flutter_bloc.dart';
import 'links_state.dart';

class LinksCubit extends Cubit<LinksState> {
  LinksCubit() : super(const LinksState());

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
}

