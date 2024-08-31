import '../src.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  void initState() {
    context.read<FavouirteBloc>().add(FetchFavouriteEVent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite ApP"),
        centerTitle: true,
      ),
      body: BlocBuilder<FavouirteBloc, FavouriteState>(
        builder: (context, state) {
          if (state.favouriteList.isEmpty) {
            return const Center(
              child: Text("Data is loading..."),
            );
          } else {
            return ListView.builder(
              itemCount: state.favouriteList.length,
              itemBuilder: (context, index) {
                final favourite = state.favouriteList[index];
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(
                    color: Colors.red,
                    child: const Icon(Icons.delete),
                  ),
                  onDismissed: (direction) => context.read<FavouirteBloc>().add(
                      DeleteFavouriteEvent(
                          favouriteModel:
                              FavouriteModel(id: index, task: favourite.task))),
                  child: ListTile(
                    title: Text(favourite.task,
                        style: favourite.isTaskCompleted
                            ? const TextStyle(
                                decoration: TextDecoration.lineThrough)
                            : const TextStyle()),
                    trailing: IconButton(
                        onPressed: () => context.read<FavouirteBloc>().add(
                            FavouriteItemEvent(
                                favouriteModel: FavouriteModel(
                                    isFavourite: !favourite.isFavourite,
                                    id: favourite.id,
                                    task: favourite.task))),
                        icon: Icon(
                          favourite.isFavourite == true
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: favourite.isFavourite == true
                              ? Colors.red
                              : Colors.grey,
                        )),
                    leading: Checkbox(
                        value: favourite.isTaskCompleted,
                        onChanged: (value) => context.read<FavouirteBloc>().add(
                            TaskCompletionEvent(
                                taskModel: FavouriteModel(
                                    isTaskCompleted: !favourite.isTaskCompleted,
                                    id: index,
                                    task: favourite.task)))),
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
