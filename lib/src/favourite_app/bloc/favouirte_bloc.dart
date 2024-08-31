import 'dart:async';

import 'package:blocmodules/src/favourite_app/models/favourite_model.dart';
import 'package:blocmodules/src/favourite_app/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouirteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  List<FavouriteModel> favoriteList = [];
  final FavouriteRepository favouriteRepository;
  FavouirteBloc({required this.favouriteRepository})
      : super(FavouriteState(
          favouriteList: [],
        )) {
    on<FetchFavouriteEVent>(fetchFavItems);
    on<FavouriteItemEvent>(favouiteMethod);
    on<DeleteFavouriteEvent>(deleteItemMethod);
    on<TaskCompletionEvent>(taskCompletionMethod);
  }

  fetchFavItems(FetchFavouriteEVent event, Emitter<FavouriteState> emit) async {
    favoriteList = await favouriteRepository.fetchItems();
    emit(state.copyWith(favouriteList: List.from(favoriteList)));
  }

  FutureOr<void> favouiteMethod(
      FavouriteItemEvent event, Emitter<FavouriteState> emit) {
    var index = state.favouriteList
        .indexWhere((value) => value.id == event.favouriteModel.id);
    favoriteList[index] = event.favouriteModel;
    emit(state.copyWith(favouriteList: List.from(favoriteList)));
  }

  FutureOr<void> taskCompletionMethod(
      TaskCompletionEvent event, Emitter<FavouriteState> emit) async {
    var index =
        state.favouriteList.indexWhere((i) => i.id == event.taskModel.id);
    favoriteList[index] = event.taskModel;
    emit(state.copyWith(favouriteList: favoriteList));
  }

  FutureOr<void> deleteItemMethod(
      DeleteFavouriteEvent event, Emitter<FavouriteState> emit) {
    try {
      var favoriteList = state.favouriteList.map((value) {
        if (value.isTaskCompleted == true) {
          state.favouriteList.remove(value);
        }
      }).toList();
      state.copyWith(favouriteList: List.from(favoriteList));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
