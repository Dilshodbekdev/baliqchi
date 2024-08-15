part of 'calculator_bloc.dart';

class CalculatorState {
  final List<EconomicModel> economics;
  final List<ExpenseMonthModel> expensesMonth;
  final DetailsEconomicModel? detailsEconomicModel;
  final List<FishTypes>? fishTypes;
  final List<FishTypes>? foodTypes;
  final List<NutritionalInfoModel>? nutritionalInfos;
  final CreateDailyNutrientModel? createDailyNutrientModel;
  final DefaultModel? createExpenseMonth;
  final List<TechnologyModel>? technologies;
  final bool isLoading;
  final bool isCreated;
  final PagingBody? body;
  final PagingBody? body1;
  final bool isPaging;
  final bool isPaging1;
  final bool reachedMax;
  final bool reachedMax1;
  final bool hasError;
  final String errorMessage;

  CalculatorState({
    this.economics = const [],
    this.expensesMonth = const [],
    this.detailsEconomicModel,
    this.fishTypes,
    this.foodTypes,
    this.nutritionalInfos,
    this.createDailyNutrientModel,
    this.createExpenseMonth,
    this.technologies,
    this.isLoading = false,
    this.isCreated = false,
    this.body,
    this.body1,
    this.isPaging = false,
    this.isPaging1 = false,
    this.reachedMax = false,
    this.reachedMax1 = false,
    this.hasError = false,
    this.errorMessage = 'Some Error',
  });

  CalculatorState copyWith({
    List<EconomicModel>? economics,
    List<ExpenseMonthModel>? expensesMonth,
    DetailsEconomicModel? detailsEconomicModel,
    List<FishTypes>? fishTypes,
    List<FishTypes>? foodTypes,
    List<NutritionalInfoModel>? nutritionalInfos,
    CreateDailyNutrientModel? createDailyNutrientModel,
    DefaultModel? createExpenseMonth,
    List<TechnologyModel>? technologies,
    bool? isLoading,
    bool? isCreated,
    PagingBody? body,
    PagingBody? body1,
    bool? isPaging,
    bool? isPaging1,
    bool? reachedMax,
    bool? reachedMax1,
    bool? hasError,
    String? errorMessage,
  }) =>
      CalculatorState(
        economics: economics ?? this.economics,
        expensesMonth: expensesMonth ?? this.expensesMonth,
        detailsEconomicModel: detailsEconomicModel ?? this.detailsEconomicModel,
        fishTypes: fishTypes ?? this.fishTypes,
        foodTypes: foodTypes ?? this.foodTypes,
        nutritionalInfos: nutritionalInfos ?? this.nutritionalInfos,
        createDailyNutrientModel: createDailyNutrientModel ?? this.createDailyNutrientModel,
        createExpenseMonth: createExpenseMonth ?? this.createExpenseMonth,
        technologies: technologies ?? this.technologies,
        isLoading: isLoading ?? false,
        isCreated: isCreated ?? false,
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
