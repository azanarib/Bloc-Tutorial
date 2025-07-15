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

class SelectItems extends FavouriteAppEvents {

  final FavouriteItemModels items;

  const SelectItems({required this.items});
}

class UnSelectItems extends FavouriteAppEvents {
 
  final FavouriteItemModels item;
 
  const UnSelectItems({required this.item});
}

class DeleteItemsEvents extends FavouriteAppEvents {
  
}
