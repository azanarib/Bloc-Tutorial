import 'package:bloc_tutorial/Bloc/Favourite/favourite_bloc.dart';
import 'package:bloc_tutorial/Bloc/Favourite/favourite_events.dart';
import 'package:bloc_tutorial/Bloc/Favourite/favourite_state.dart';
import 'package:bloc_tutorial/Bloc/Models/favourite_items_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteAppScreen extends StatefulWidget {
  const FavouriteAppScreen({super.key});

  @override
  State<FavouriteAppScreen> createState() => _FavouriteAppScreenState();
}

class _FavouriteAppScreenState extends State<FavouriteAppScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavouriteBloc>().add(FetchFavouriteItemListEvents());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("F A V O U R I T E   A P P "))),
      body: BlocBuilder<FavouriteBloc, FavouriteItemsState>(
        builder: (context, state) {
          switch (state.listStatus) {
            case ListStatus.loading:
              return CircularProgressIndicator();
            case ListStatus.failure:
              return Center(child: Text("Something went wrong."));
            case ListStatus.success:
              return ListView.builder(
                itemBuilder: (context, index) {
                  final item = state.favouriteItemList[index];
                  return Card(
                    child: ListTile(
                      title: Text(item.value.toString()),
                      trailing: IconButton(
                        onPressed: () {
                          FavouriteItemModels favouriteItemModels =
                              FavouriteItemModels(
                                id: item.id,
                                value: item.value.toString(),
                                isFavourite: item.isFavourite ? false : true,
                              );
                          context.read<FavouriteBloc>().add(
                            FavouriteItemsEvents(items: favouriteItemModels),
                          );
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: item.isFavourite ? Colors.red : Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}
