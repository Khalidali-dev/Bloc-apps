import 'package:blocmodules/src/filter_app/views/filter_view.dart';

import 'src/src.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => SettingsBloc(),
      ),
      BlocProvider(
        create: (context) => FileBloc(),
      ),
      BlocProvider(
        create: (context) => TodoBloc(),
      ),
      BlocProvider(
        create: (context) =>
            FavouirteBloc(favouriteRepository: FavouriteRepository()),
      ),
      BlocProvider(create: (_) => PostBloc()),
      BlocProvider(create: (_) => FilterBloc())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc Modules',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CounterScreen(),
    );
  }
}
