import 'package:baliqchi/src/core/services/services.dart';
import 'package:baliqchi/src/core/util/app_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState(selectedIndex: 0));

  init() async {
    var name = await Prefs.getString(AppConstants.kFullName);
    var phone = await Prefs.getString(AppConstants.kPhoneNumber);
    emit(state.copyWith(
      name: name,
      phone: phone,
    ));
  }

  change(String name, String phone) {
    emit(state.copyWith(
      name: name,
      phone: phone,
    ));
  }

  void selectTab(int index) {
    emit(state.copyWith(selectedIndex: index));
  }
}
