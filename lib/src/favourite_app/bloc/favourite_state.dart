part of 'favouirte_bloc.dart';

class FavouriteState {
  final List<FavouriteModel> favouriteList;

  FavouriteState({required this.favouriteList});

  FavouriteState copyWith({
    List<FavouriteModel>? favouriteList,
  }) =>
      FavouriteState(
        favouriteList: favouriteList ?? this.favouriteList,
      );
}
