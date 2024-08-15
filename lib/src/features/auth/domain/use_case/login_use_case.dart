
import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/auth/data/bodies/login_body.dart';
import 'package:baliqchi/src/features/auth/data/models/login_model.dart';
import 'package:baliqchi/src/features/auth/domain/repository/auth_repository.dart';

class LoginUseCase implements UseCase<DataState<LoginModel>, LoginBody> {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<DataState<LoginModel>> call({required LoginBody params}) async => await _repository.login(params);
}
