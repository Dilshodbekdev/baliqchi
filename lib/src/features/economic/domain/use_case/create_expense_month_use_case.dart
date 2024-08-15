import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/economic/data/bodies/expense_month_body.dart';
import 'package:baliqchi/src/features/economic/data/models/default_model.dart';
import 'package:baliqchi/src/features/economic/domain/repository/economic_repository.dart';

class CreateExpenseMonthUseCase
    implements UseCase<DataState<DefaultModel>, List<ExpenseMonthBody>> {
  final EconomicRepository _repository;

  CreateExpenseMonthUseCase(this._repository);

  @override
  Future<DataState<DefaultModel>> call(
          {required List<ExpenseMonthBody> params}) async =>
      await _repository.createExpenseMonth(params);
}
