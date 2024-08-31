import '../src.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  late CounterBloc counterBloc;
  @override
  void initState() {
    counterBloc = CounterBloc();

    super.initState();
  }

  @override
  void dispose() {
    counterBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => counterBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Counter ApP"),
          centerTitle: true,
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              buildWhen: (previous, current) => false,
              builder: (context, state) => FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () =>
                      context.read<CounterBloc>().add(IncrementCounter())),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<CounterBloc, CounterState>(
              buildWhen: (previous, current) => false,
              builder: (context, state) => FloatingActionButton(
                  child: const Icon(Icons.minimize),
                  onPressed: () =>
                      context.read<CounterBloc>().add(DecrementCounter())),
            ),
          ],
        ),
        body: BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) => Center(
                  child: Text(
                    state.counter.toString(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                )),
      ),
    );
  }
}
