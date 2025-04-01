import 'package:baliqchi/src/core/resources/base_repository.dart';
import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/features/economic/data/bodies/create_economic_body.dart';
import 'package:baliqchi/src/features/economic/data/bodies/expense_month_body.dart';
import 'package:baliqchi/src/features/economic/data/bodies/filter_body.dart';
import 'package:baliqchi/src/features/economic/data/data_source/economic_api_service.dart';
import 'package:baliqchi/src/features/economic/data/models/default_model.dart';
import 'package:baliqchi/src/features/economic/data/models/details_economic_model.dart';
import 'package:baliqchi/src/features/economic/data/models/economics_model.dart';
import 'package:baliqchi/src/features/economic/data/models/expense_month_statistic_model.dart';
import 'package:baliqchi/src/features/economic/data/models/expense_type_model.dart';
import 'package:baliqchi/src/features/economic/data/models/expenses_month_model.dart';
import 'package:baliqchi/src/features/economic/domain/repository/economic_repository.dart';
import 'package:baliqchi/src/features/home/data/bodies/paging_body.dart';
import 'package:baliqchi/src/features/home/data/models/place_details_model.dart';
import 'package:baliqchi/src/features/home/data/models/technology_model.dart';

class EconomicRepositoryImpl with BaseRepository implements EconomicRepository {
  final EconomicApiService _apiService;

  EconomicRepositoryImpl(this._apiService);

  @override
  Future<DataState<EconomicsModel>> economics(PagingBody body) async =>
      await handleResponse(
          response: _apiService.economics(
        body.page ?? 0,
        body.pageSize ?? 10,
        body.search,
      ));

  @override
  Future<DataState<ExpensesMonthModel>> expensesMonth(PagingBody body) async =>
      await handleResponse(
          response: _apiService.expensesMonth(
        body.page ?? 0,
        body.pageSize ?? 10,
        body.search,
      ));

  @override
  Future<DataState<DetailsEconomicModel>> updateEconomic(
          PagingBody body) async =>
      await handleResponse(
          response: _apiService.updateEconomics(
        body.id ?? '',
        body.price ?? 0,
      ));

  @override
  Future<DataState<List<FishTypes>>> fishTypes() async =>
      await handleResponse(response: _apiService.fishTypes());

  @override
  Future<DataState<List<FishTypes>>> foodTypes() async =>
      await handleResponse(response: _apiService.foodTypes());

  @override
  Future<DataState<List<ExpenseTypeModel>>> expenseTypes() async =>
      await handleResponse(response: _apiService.expenseTypes());

  @override
  Future<DataState<List<TechnologyModel>>> technologies() async =>
      await handleResponse(response: _apiService.technologies());

  @override
  Future<DataState<DefaultModel>> createEconomic(
          CreateEconomicBody body) async =>
      await handleResponse(response: _apiService.createEconomic(body));

  @override
  Future<DataState<DefaultModel>> createExpenseMonth(
          List<ExpenseMonthBody> body) async =>
      await handleResponse(response: _apiService.createExpenseMonth(body));

  @override
  Future<DataState<DetailsEconomicModel>> detailsEconomic(String id) async =>
      await handleResponse(response: _apiService.detailsEconomics(id));

  @override
  Future<DataState<List<ExpenseMonthStatisticModel>>> expenseMonthStatistics(
          FilterBody body) async =>
      await handleResponse(
          response: _apiService.expenseMonthStatistics(
        body.startDate,
        body.endDate,
      ));
}
