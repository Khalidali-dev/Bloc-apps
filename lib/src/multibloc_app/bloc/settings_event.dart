abstract class SettingsEvent {}

class SwitchEvent extends SettingsEvent {
  final bool isEnable;

  SwitchEvent({required this.isEnable});
}

class SliderEvent extends SettingsEvent {
  final double value;

  SliderEvent({required this.value});
}
