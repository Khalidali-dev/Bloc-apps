import 'dart:async';

import 'package:blocmodules/src/post_app/view_models/bloc/post_event.dart';
import 'package:blocmodules/src/post_app/view_models/bloc/post_state.dart';
import 'package:blocmodules/src/post_app/models/post_model.dart';
import 'package:blocmodules/src/post_app/repository/post_repository.dart';
import 'package:blocmodules/src/post_app/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostRepository repository = PostRepository();
  PostBloc() : super(PostState()) {
    on<FetchPostsEvent>(fetchPosts);
  }

  FutureOr<void> fetchPosts(
      FetchPostsEvent event, Emitter<PostState> emit) async {
    try {
      List<PostModel> posts = await repository.getPost();
      emit(PostState(posts: posts, postStatus: PostStatus.success));
    } on Exception catch (error) {
      emit(PostState(
          postStatus: PostStatus.failure, errorMessage: error.toString()));
    }
  }
}
