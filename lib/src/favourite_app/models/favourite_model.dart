class FavouriteModel {
  final String task;
  final bool isTaskCompleted, isFavourite;
  final int id;

  FavouriteModel(
      {required this.id,
      required this.task,
      this.isTaskCompleted = false,
      this.isFavourite = false});

  FavouriteModel copyWith(
      {String? task, bool? isTaskCompleted, isFavourite, int? id}) {
    return FavouriteModel(
      id: id ?? this.id,
      task: task ?? this.task,
      isTaskCompleted: isTaskCompleted ?? this.isTaskCompleted,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }
}
