import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/economic/data/models/expense_type_model.dart';
import 'package:baliqchi/src/features/economic/domain/repository/economic_repository.dart';

class ExpenseTypesUseCase
    implements UseCase<DataState<List<ExpenseTypeModel>>, int> {
  final EconomicRepository _repository;

  ExpenseTypesUseCase(this._repository);

  @override
  Future<DataState<List<ExpenseTypeModel>>> call({required int params}) async =>
      await _repository.expenseTypes();
}
