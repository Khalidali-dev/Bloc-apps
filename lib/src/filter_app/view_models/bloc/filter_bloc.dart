import '../../../src.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterRepository repository = FilterRepository();
  FilterBloc() : super(FilterState()) {
    on<FetchCommentsEvent>(fetchPosts);
    on<SearchEvent>(filterPosts);
  }

  FutureOr<void> fetchPosts(
      FetchCommentsEvent event, Emitter<FilterState> emit) async {
    try {
      List<FilterModel> posts = await repository.getPost();
      emit(FilterState(posts: posts, postStatus: PostStatus.success));
    } on Exception catch (error) {
      emit(FilterState(
          postStatus: PostStatus.failure, errorMessage: error.toString()));
    }
  }

  FutureOr<void> filterPosts(
      SearchEvent event, Emitter<FilterState> emit) async {
    List<FilterModel> filterList = state.posts
        .where((val) => val.email
            .toLowerCase()
            .toString()
            .contains(event.email.toLowerCase().toString()))
        .toList();
    if (event.email.isEmpty) {
      emit(state.copyWith(filteredPosts: [], noDataFound: ''));
    } else if (filterList.isEmpty) {
      emit(state.copyWith(
          filteredPosts: filterList, noDataFound: "Data Not Found"));
    } else {
      emit(state.copyWith(filteredPosts: filterList));
    }
  }
}
