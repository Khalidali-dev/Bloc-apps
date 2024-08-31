import 'dart:async';
import 'dart:io';

import 'package:blocmodules/src/image_picker_app/bloc/file_event.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'file_state.dart';

class FileBloc extends Bloc<FileEvent, FileState> {
  FileBloc() : super(FileState()) {
    on<FilePickerEvent>(filePicker);
  }

  FutureOr<void> filePicker(
      FilePickerEvent event, Emitter<FileState> emit) async {
    try {
      FilePickerResult? image = await FilePicker.platform.pickFiles();
      if (image != null) {
        emit(FileState(file: image.files.single.bytes));
      } else {
        print("Please select a file");
      }
    } catch (e) {
      print(e);
    }
  }
}
