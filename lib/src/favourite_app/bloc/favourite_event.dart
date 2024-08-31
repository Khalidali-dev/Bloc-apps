part of 'favouirte_bloc.dart';

abstract class FavouriteEvent {}

class FetchFavouriteEVent extends FavouriteEvent {}

class TaskCompletionEvent extends FavouriteEvent {
  final FavouriteModel taskModel;
  TaskCompletionEvent({required this.taskModel});
}

class FavouriteItemEvent extends FavouriteEvent {
  final FavouriteModel favouriteModel;
  FavouriteItemEvent({required this.favouriteModel});
}

class DeleteFavouriteEvent extends FavouriteEvent {
  final FavouriteModel favouriteModel;
  DeleteFavouriteEvent({required this.favouriteModel});
}
