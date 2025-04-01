import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/auth/data/models/login_model.dart';
import 'package:baliqchi/src/features/home/domain/repository/home_repository.dart';

class MeUseCase implements UseCase<DataState<LoginModel>, int> {
  final HomeRepository _repository;

  MeUseCase(this._repository);

  @override
  Future<DataState<LoginModel>> call({required int params}) async =>
      await _repository.me();
}
