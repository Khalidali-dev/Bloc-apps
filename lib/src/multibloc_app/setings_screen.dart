import '../src.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Counter ApP"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            BlocBuilder<SettingsBloc, SettingsState>(
                buildWhen: (previous, current) =>
                    previous.isEnable != current.isEnable,
                builder: (context, state) {
                  debugPrint("Switch");
                  return Center(
                      child: Column(
                    children: [
                      Text(state.isEnable.toString()),
                      const SizedBox(
                        height: 50,
                      ),
                      Switch(
                        value: state.isEnable,
                        onChanged: (value) => context
                            .read<SettingsBloc>()
                            .add(SwitchEvent(isEnable: value)),
                      ),
                    ],
                  ));
                }),
            const SizedBox(
              height: 50,
            ),
            BlocBuilder<SettingsBloc, SettingsState>(
                buildWhen: (previous, current) =>
                    previous.value != current.value,
                builder: (context, state) {
                  debugPrint("Slider");
                  return Center(
                      child: Column(
                    children: [
                      Text(state.value.toStringAsFixed(2)),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        width: 400,
                        height: 300,
                        color: state.isEnable == true
                            ? Colors.red.withOpacity(state.value)
                            : Colors.purple.withOpacity(state.value),
                      ),
                      Slider(
                        value: state.value,
                        onChanged: (val) => context
                            .read<SettingsBloc>()
                            .add(SliderEvent(value: val)),
                      ),
                    ],
                  ));
                }),
          ],
        ));
  }
}
