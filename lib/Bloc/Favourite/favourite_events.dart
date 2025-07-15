import 'package:bloc_tutorial/Bloc/Models/favourite_items_model.dart';
import 'package:equatable/equatable.dart';

abstract class FavouriteAppEvents extends Equatable {
  const FavouriteAppEvents();
  @override
  List<Object?> get props => [];
}

class FetchFavouriteItemListEvents extends FavouriteAppEvents {}

class FavouriteItemsEvents extends FavouriteAppEvents {
  final FavouriteItemModels items;
  const FavouriteItemsEvents({required this.items});
}
