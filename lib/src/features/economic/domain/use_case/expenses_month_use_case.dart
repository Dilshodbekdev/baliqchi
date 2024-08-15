import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/economic/data/models/economics_model.dart';
import 'package:baliqchi/src/features/economic/data/models/expenses_month_model.dart';
import 'package:baliqchi/src/features/economic/domain/repository/economic_repository.dart';
import 'package:baliqchi/src/features/home/data/bodies/paging_body.dart';

class ExpensesMonthUseCase
    implements UseCase<DataState<ExpensesMonthModel>, PagingBody> {
  final EconomicRepository _repository;

  ExpensesMonthUseCase(this._repository);

  @override
  Future<DataState<ExpensesMonthModel>> call({required PagingBody params}) async =>
      await _repository.expensesMonth(params);
}
