import 'package:blocmodules/src/favourite_app/models/favourite_model.dart';

class FavouriteRepository {
  Future<List<FavouriteModel>> fetchItems() async {
    return await Future.delayed(
        const Duration(seconds: 2),
        () => List.of(List.generate(
            10, (index) => FavouriteModel(id: index, task: "Task $index"))));
  }
}
