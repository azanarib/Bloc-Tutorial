import 'package:bloc_tutorial/Bloc/Favourite/favourite_events.dart';
import 'package:bloc_tutorial/Bloc/Favourite/favourite_state.dart';
import 'package:bloc_tutorial/Bloc/Models/favourite_items_model.dart';
import 'package:bloc_tutorial/Bloc/Repo/favourite_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteBloc extends Bloc<FavouriteAppEvents, FavouriteItemsState> {
  List<FavouriteItemModels> favouriteList = [];
  FavouriteBloc(this.favouriteRepository) : super(const FavouriteItemsState()) {
    on<FetchFavouriteItemListEvents>(fetchList);
    on(_addFavouriteList);
  }
  FavouriteRepository favouriteRepository = FavouriteRepository();

  void fetchList(
    FetchFavouriteItemListEvents event,
    Emitter<FavouriteItemsState> emit,
  ) async {
    favouriteList = await favouriteRepository.fetchItems();
    emit(
      state.copyWith(
        favouriteItemList: List.from(favouriteList),
        listStatus: ListStatus.success,
      ),
    );
  }

  void _addFavouriteList(
    FavouriteItemsEvents events,
    Emitter<FavouriteItemsState> emit,
  ) async {
    final index = favouriteList.indexWhere(
      (element) => element.id == events.items.id,
    );
    favouriteList[index] = events.items;

    emit(state.copyWith(favouriteItemList: List.from(favouriteList)));
  }
}
