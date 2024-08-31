import 'dart:async';

import 'package:blocmodules/src/multibloc_app/bloc/settings_event.dart';
import 'package:blocmodules/src/multibloc_app/bloc/multi_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsState(isEnable: false, value: 0.00)) {
    on<SwitchEvent>(switchMethod);
    on<SliderEvent>(sliderMethod);
  }

  FutureOr<void> switchMethod(SwitchEvent event, Emitter<SettingsState> emit) {
    emit(state.copyWith(isEnable: event.isEnable));
  }

  FutureOr<void> sliderMethod(SliderEvent event, Emitter<SettingsState> emit) {
    emit(state.copyWith(value: event.value));
  }
}
