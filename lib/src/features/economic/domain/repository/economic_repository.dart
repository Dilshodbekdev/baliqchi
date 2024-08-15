import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/features/economic/data/bodies/create_economic_body.dart';
import 'package:baliqchi/src/features/economic/data/bodies/expense_month_body.dart';
import 'package:baliqchi/src/features/economic/data/models/default_model.dart';
import 'package:baliqchi/src/features/economic/data/models/details_economic_model.dart';
import 'package:baliqchi/src/features/economic/data/models/economics_model.dart';
import 'package:baliqchi/src/features/economic/data/models/expense_type_model.dart';
import 'package:baliqchi/src/features/economic/data/models/expenses_month_model.dart';
import 'package:baliqchi/src/features/home/data/bodies/paging_body.dart';
import 'package:baliqchi/src/features/home/data/models/place_details_model.dart';
import 'package:baliqchi/src/features/home/data/models/technology_model.dart';

abstract class EconomicRepository {
  Future<DataState<EconomicsModel>> economics(PagingBody body);

  Future<DataState<ExpensesMonthModel>> expensesMonth(PagingBody body);

  Future<DataState<List<FishTypes>>> fishTypes();

  Future<DataState<DefaultModel>> createEconomic(CreateEconomicBody body);

  Future<DataState<DefaultModel>> createExpenseMonth(
      List<ExpenseMonthBody> body);

  Future<DataState<DetailsEconomicModel>> detailsEconomic(String id);

  Future<DataState<DetailsEconomicModel>> updateEconomic(PagingBody body);

  Future<DataState<List<FishTypes>>> foodTypes();

  Future<DataState<List<ExpenseTypeModel>>> expenseTypes();

  Future<DataState<List<TechnologyModel>>> technologies();
}
