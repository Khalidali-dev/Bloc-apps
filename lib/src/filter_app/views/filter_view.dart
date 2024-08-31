import '../../src.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  void initState() {
    context.read<FilterBloc>().add(FetchCommentsEvent());
    super.initState();
  }

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comments"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            width: size.width * .7,
            child: TextField(
              controller: searchController,
              onChanged: (value) =>
                  context.read<FilterBloc>().add(SearchEvent(email: value)),
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50))),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: BlocBuilder<FilterBloc, FilterState>(
              builder: (context, state) {
                switch (state.postStatus) {
                  case PostStatus.loading:
                    return const Center(child: CircularProgressIndicator());
                  case PostStatus.failure:
                    return Center(child: Text(state.errorMessage));
                  case PostStatus.success:
                    return state.noDataFound.isNotEmpty
                        ? Center(child: Text(state.noDataFound))
                        : ListView.builder(
                            itemCount: state.filteredPosts.isEmpty
                                ? state.posts.length
                                : state.filteredPosts.length,
                            itemBuilder: (context, index) {
                              var data = state.filteredPosts.isEmpty
                                  ? state.posts[index]
                                  : state.filteredPosts[index];

                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Card(
                                  child: ListTile(
                                    title: Text(
                                      data.email,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                      data.body,
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
