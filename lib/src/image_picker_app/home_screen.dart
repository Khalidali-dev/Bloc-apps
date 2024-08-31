import '../src.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Picker"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<FileBloc, FileState>(
            builder: (context, state) => Column(
              children: [
                state.file == null
                    ? const SizedBox()
                    : Image.memory(state.file!),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () =>
                        context.read<FileBloc>().add(FilePickerEvent()),
                    child: const Text("Pick File"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
