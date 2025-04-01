part of 'economic_bloc.dart';

class EconomicState {
  final List<EconomicModel> economics;
  final List<ExpenseMonthModel> expensesMonth;
  final DetailsEconomicModel? detailsEconomicModel;
  final List<FishTypes>? fishTypes;
  final List<FishTypes>? foodTypes;
  final List<ExpenseTypeModel>? expenseTypes;
  final List<ExpenseMonthStatisticModel>? expenseMonthStatistics;
  final DefaultModel? createEconomic;
  final DefaultModel? createExpenseMonth;
  final List<TechnologyModel>? technologies;
  final bool isLoading;
  final bool isCreated;
  final bool isCreatedExpenseMonth;
  final PagingBody? body;
  final PagingBody? body1;
  final bool isPaging;
  final bool isPaging1;
  final bool reachedMax;
  final bool reachedMax1;
  final bool hasError;
  final String errorMessage;

  EconomicState({
    this.economics = const [],
    this.expensesMonth = const [],
    this.detailsEconomicModel,
    this.fishTypes,
    this.foodTypes,
    this.expenseTypes,
    this.expenseMonthStatistics,
    this.createEconomic,
    this.createExpenseMonth,
    this.technologies,
    this.isLoading = false,
    this.isCreated = false,
    this.isCreatedExpenseMonth = false,
    this.body,
    this.body1,
    this.isPaging = false,
    this.isPaging1 = false,
    this.reachedMax = false,
    this.reachedMax1 = false,
    this.hasError = false,
    this.errorMessage = 'Some Error',
  });

  EconomicState copyWith({
    List<EconomicModel>? economics,
    List<ExpenseMonthModel>? expensesMonth,
    DetailsEconomicModel? detailsEconomicModel,
    List<FishTypes>? fishTypes,
    List<FishTypes>? foodTypes,
    List<ExpenseTypeModel>? expenseTypes,
    List<ExpenseMonthStatisticModel>? expenseMonthStatistics,
    DefaultModel? createEconomic,
    DefaultModel? createExpenseMonth,
    List<TechnologyModel>? technologies,
    bool? isLoading,
    bool? isCreated,
    bool? isCreatedExpenseMonth,
    PagingBody? body,
    PagingBody? body1,
    bool? isPaging,
    bool? isPaging1,
    bool? reachedMax,
    bool? reachedMax1,
    bool? hasError,
    String? errorMessage,
  }) =>
      EconomicState(
        economics: economics ?? this.economics,
        expensesMonth: expensesMonth ?? this.expensesMonth,
        detailsEconomicModel: detailsEconomicModel ?? this.detailsEconomicModel,
        fishTypes: fishTypes ?? this.fishTypes,
        foodTypes: foodTypes ?? this.foodTypes,
        expenseTypes: expenseTypes ?? this.expenseTypes,
        expenseMonthStatistics: expenseMonthStatistics ?? this.expenseMonthStatistics,
        createEconomic: createEconomic ?? this.createEconomic,
        createExpenseMonth: createExpenseMonth ?? this.createExpenseMonth,
        technologies: technologies ?? this.technologies,
        isLoading: isLoading ?? false,
        isCreated: isCreated ?? false,
        isCreatedExpenseMonth: isCreatedExpenseMonth ?? false,
        body: body ?? this.body,
        body1: body1 ?? this.body1,
        isPaging: isPaging ?? false,
        isPaging1: isPaging1 ?? false,
        reachedMax: reachedMax ?? this.reachedMax,
        reachedMax1: reachedMax1 ?? this.reachedMax1,
        hasError: hasError ?? false,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
