import 'package:blocmodules/src/src.dart';

class FilterState {
  PostStatus postStatus;
  List<FilterModel> posts;
  List<FilterModel> filteredPosts;
  String errorMessage;
  String noDataFound;
  FilterState({
    this.noDataFound = "",
    this.filteredPosts = const [],
    this.postStatus = PostStatus.loading,
    this.posts = const [],
    this.errorMessage = '',
  });

  FilterState copyWith(
          {PostStatus? postStatus,
          List<FilterModel>? posts,
          List<FilterModel>? filteredPosts,
          String? errorMessage,
          noDataFound}) =>
      FilterState(
        postStatus: postStatus ?? this.postStatus,
        noDataFound: noDataFound ?? this.noDataFound,
        posts: posts ?? this.posts,
        filteredPosts: filteredPosts ?? this.filteredPosts,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
