import 'dart:async';

import 'package:blocmodules/src/multibloc_app/bloc/settings_event.dart';
import 'package:blocmodules/src/counter_app/bloc/counter_state.dart';
import 'package:blocmodules/src/counter_app/bloc/counter_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(counter: 0)) {
    on<IncrementCounter>(incrementMethod);
    on<DecrementCounter>(decrementMethod);
  }

  FutureOr<void> incrementMethod(
      IncrementCounter event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter + 1));
  }

  FutureOr<void> decrementMethod(
      DecrementCounter event, Emitter<CounterState> emit) {
    emit(state.copyWith(counter: state.counter - 1));
  }
}
