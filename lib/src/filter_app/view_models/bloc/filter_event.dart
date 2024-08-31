abstract class FilterEvent {}

class FetchCommentsEvent extends FilterEvent {}

class SearchEvent extends FilterEvent {
  final String email;

  SearchEvent({required this.email});
}
