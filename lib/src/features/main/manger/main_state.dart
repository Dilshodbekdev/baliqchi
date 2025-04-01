part of 'main_cubit.dart';

class MainState {
  final String? name;
  final String? phone;
  final int selectedIndex;

  MainState({
    this.name,
    this.phone,
    required this.selectedIndex,
  });

  MainState copyWith({
    String? name,
    String? phone,
    int? selectedIndex,
  }) {
    return MainState(
      name: name ?? this.name,
      phone: phone ?? this.phone,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
