import 'package:bloc_tutorial/Bloc/Models/favourite_items_model.dart';
import 'package:equatable/equatable.dart';

enum ListStatus { loading, success, failure }

class FavouriteItemsState extends Equatable {
  final List<FavouriteItemModels> favouriteItemList;
  final ListStatus listStatus;

  const FavouriteItemsState({
    this.favouriteItemList = const [],
    this.listStatus = ListStatus.loading,
  });

  FavouriteItemsState copyWith({
    List<FavouriteItemModels>? favouriteItemList,
    ListStatus? listStatus,
  }) {
    return FavouriteItemsState(
      favouriteItemList: favouriteItemList ?? this.favouriteItemList,
      listStatus: listStatus ?? this.listStatus,
    );
  }

  @override
  List<Object?> get props => [favouriteItemList, listStatus];
}
