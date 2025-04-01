import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/auth/data/models/login_model.dart';
import 'package:baliqchi/src/features/home/data/bodies/pay_me_code_body.dart';
import 'package:baliqchi/src/features/home/domain/repository/home_repository.dart';

class PayMeCodeUseCase
    implements UseCase<DataState<LoginModel>, PayMeCodeBody> {
  final HomeRepository _repository;

  PayMeCodeUseCase(this._repository);

  @override
  Future<DataState<LoginModel>> call(
          {required PayMeCodeBody params}) async =>
      await _repository.payMeCode(params);
}
