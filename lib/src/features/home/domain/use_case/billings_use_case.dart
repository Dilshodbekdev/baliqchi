import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/home/data/models/billing_model.dart';
import 'package:baliqchi/src/features/home/domain/repository/home_repository.dart';

class BillingsUseCase implements UseCase<DataState<List<BillingModel>>, int> {
  final HomeRepository _repository;

  BillingsUseCase(this._repository);

  @override
  Future<DataState<List<BillingModel>>> call({required int params}) async =>
      await _repository.billings();
}
