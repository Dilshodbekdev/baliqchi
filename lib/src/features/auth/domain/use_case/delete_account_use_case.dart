import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/auth/domain/repository/auth_repository.dart';

class DeleteAccountUseCase implements UseCase<DataState<dynamic>, int> {
  final AuthRepository _repository;

  DeleteAccountUseCase(this._repository);

  @override
  Future<DataState<dynamic>> call({required int params}) async =>
      await _repository.deleteAccount();
}
