class SettingsState {
  final bool isEnable;
  final double value;

  SettingsState({required this.isEnable, required this.value});

  SettingsState copyWith({bool? isEnable, double? value}) {
    return SettingsState(
        isEnable: isEnable ?? this.isEnable, value: value ?? this.value);
  }
}
