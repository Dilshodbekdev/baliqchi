part of 'calculator_bloc.dart';

class CalculatorState {
  final List<GeneralCalculation> generalCalculations;
  final List<FishDecline> fishDeclines;
  final List<FishDeclineHistory> fishDeclinesHistory;
  final List<GeneralCalculation>? generalCalculationList;
  final FishDeclineStatisticModel? fishDeclineStatistics;
  final List<FoodModel>? generalNutritionalInfosFoods;
  final List<GeneralNutritionalInfoModel>? generalNutritionalInfos;
  final PontDetailsModel? pontDetailsModel;
  final GeneralCalculationDetailsModel? generalCalculationDetailsModel;
  final FishDeclineDetailsModel? fishDeclineDetailsModel;
  final GeneralCalculationDetailsModel? generalCalculationListDetailsModel;
  final DefaultModel? updateGeneralCalculationModel;
  final DefaultModel? deleteGeneralCalculationModel;
  final DefaultModel? deleteFishDeclineModel;
  final List<FishTypes>? fishTypes;
  final List<FishTypes>? foodTypes;
  final List<PondModel>? ponds;
  final List<PondFishModel>? pondFishes;
  final List<NutritionalInfoModel>? nutritionalInfos;
  final CreateDailyNutrientModel? createDailyNutrientModel;
  final DefaultModel? createPond;
  final DefaultModel? createFishDecline;
  final DefaultModel? createGeneralCalculation;
  final List<TechnologyModel>? technologies;
  final bool isLoading;
  final bool isCreatedDailyNutrient;
  final bool isCreatedPond;
  final bool isPondFishes;
  final bool isCreatedFishDecline;
  final bool isCreatedGeneralCalculation;
  final bool isUpdated;
  final bool isDetails;
  final bool isDeleted;
  final PagingBody? body;
  final FishDeclineStatisticBody? statisticBody;
  final PagingBody? bodyFishDecline;
  final PagingBody? bodyFishDeclineHistory;
  final bool isPaging;
  final bool isPagingFishDecline;
  final bool isPagingFishDeclineHistory;
  final bool reachedMax;
  final bool reachedMaxFishDecline;
  final bool reachedMaxFishDeclineHistory;
  final bool hasError;
  final String errorMessage;

  CalculatorState({
    this.generalCalculations = const [],
    this.fishDeclines = const [],
    this.fishDeclinesHistory = const [],
    this.generalCalculationList,
    this.fishDeclineStatistics,
    this.generalNutritionalInfosFoods,
    this.generalNutritionalInfos,
    this.pontDetailsModel,
    this.generalCalculationDetailsModel,
    this.fishDeclineDetailsModel,
    this.generalCalculationListDetailsModel,
    this.updateGeneralCalculationModel,
    this.deleteGeneralCalculationModel,
    this.deleteFishDeclineModel,
    this.fishTypes,
    this.foodTypes,
    this.ponds,
    this.pondFishes,
    this.nutritionalInfos,
    this.createDailyNutrientModel,
    this.createPond,
    this.createFishDecline,
    this.createGeneralCalculation,
    this.technologies,
    this.isLoading = false,
    this.isCreatedDailyNutrient = false,
    this.isCreatedPond = false,
    this.isPondFishes = false,
    this.isCreatedFishDecline = false,
    this.isCreatedGeneralCalculation = false,
    this.isUpdated = false,
    this.isDeleted = false,
    this.isDetails = false,
    this.body,
    this.statisticBody,
    this.bodyFishDecline,
    this.bodyFishDeclineHistory,
    this.isPaging = false,
    this.isPagingFishDecline = false,
    this.isPagingFishDeclineHistory = false,
    this.reachedMax = false,
    this.reachedMaxFishDecline = false,
    this.reachedMaxFishDeclineHistory = false,
    this.hasError = false,
    this.errorMessage = 'Some Error',
  });

  CalculatorState copyWith({
    List<GeneralCalculation>? generalCalculations,
    List<FishDecline>? fishDeclines,
    List<FishDeclineHistory>? fishDeclinesHistory,
    List<GeneralCalculation>? generalCalculationList,
    FishDeclineStatisticModel? fishDeclineStatistics,
    List<FoodModel>? generalNutritionalInfosFoods,
    List<GeneralNutritionalInfoModel>? generalNutritionalInfos,
    PontDetailsModel? pontDetailsModel,
    GeneralCalculationDetailsModel? generalCalculationDetailsModel,
    FishDeclineDetailsModel? fishDeclineDetailsModel,
    GeneralCalculationDetailsModel? generalCalculationListDetailsModel,
    DefaultModel? updateGeneralCalculationModel,
    DefaultModel? deleteGeneralCalculationModel,
    DefaultModel? deleteFishDeclineModel,
    List<FishTypes>? fishTypes,
    List<FishTypes>? foodTypes,
    List<PondModel>? ponds,
    List<PondFishModel>? pondFishes,
    List<NutritionalInfoModel>? nutritionalInfos,
    CreateDailyNutrientModel? createDailyNutrientModel,
    DefaultModel? createPond,
    DefaultModel? createFishDecline,
    DefaultModel? createGeneralCalculation,
    List<TechnologyModel>? technologies,
    bool? isLoading,
    bool? isCreatedDailyNutrient,
    bool? isCreatedPond,
    bool? isPondFishes,
    bool? isCreatedFishDecline,
    bool? isCreatedGeneralCalculation,
    bool? isUpdated,
    bool? isDeleted,
    bool? isDetails,
    PagingBody? body,
    FishDeclineStatisticBody? statisticBody,
    PagingBody? bodyFishDecline,
    PagingBody? bodyFishDeclineHistory,
    bool? isPaging,
    bool? isPagingFishDecline,
    bool? isPagingFishDeclineHistory,
    bool? reachedMax,
    bool? reachedMaxFishDecline,
    bool? reachedMaxFishDeclineHistory,
    bool? hasError,
    String? errorMessage,
  }) =>
      CalculatorState(
        generalCalculations: generalCalculations ?? this.generalCalculations,
        fishDeclines: fishDeclines ?? this.fishDeclines,
        fishDeclinesHistory: fishDeclinesHistory ?? this.fishDeclinesHistory,
        generalCalculationList: generalCalculationList ?? this.generalCalculationList,
        fishDeclineStatistics: fishDeclineStatistics ?? this.fishDeclineStatistics,
        generalNutritionalInfosFoods: generalNutritionalInfosFoods ?? this.generalNutritionalInfosFoods,
        generalNutritionalInfos: generalNutritionalInfos,
        pontDetailsModel: pontDetailsModel??this.pontDetailsModel,
        generalCalculationDetailsModel: generalCalculationDetailsModel??this.generalCalculationDetailsModel,
        fishDeclineDetailsModel: fishDeclineDetailsModel,
        generalCalculationListDetailsModel: generalCalculationListDetailsModel,
        updateGeneralCalculationModel: updateGeneralCalculationModel,
        deleteGeneralCalculationModel: deleteGeneralCalculationModel,
        deleteFishDeclineModel: deleteFishDeclineModel,
        fishTypes: fishTypes ?? this.fishTypes,
        foodTypes: foodTypes ?? this.foodTypes,
        ponds: ponds ?? this.ponds,
        pondFishes: pondFishes ?? this.pondFishes,
        nutritionalInfos: nutritionalInfos ?? this.nutritionalInfos,
        createDailyNutrientModel: createDailyNutrientModel,
        createPond: createPond,
        createFishDecline: createFishDecline,
        createGeneralCalculation: createGeneralCalculation ,
        technologies: technologies ?? this.technologies,
        isLoading: isLoading ?? false,
        isCreatedDailyNutrient: isCreatedDailyNutrient ?? false,
        isCreatedPond: isCreatedPond ?? false,
        isPondFishes: isPondFishes ?? false,
        isCreatedFishDecline: isCreatedFishDecline ?? false,
        isCreatedGeneralCalculation: isCreatedGeneralCalculation ?? false,
        isUpdated: isUpdated ?? false,
        isDeleted: isDeleted ?? false,
        isDetails: isDetails ?? false,
        body: body ?? this.body,
        statisticBody: statisticBody ?? this.statisticBody,
        bodyFishDecline: bodyFishDecline ?? this.bodyFishDecline,
        bodyFishDeclineHistory: bodyFishDeclineHistory ?? this.bodyFishDeclineHistory,
        isPaging: isPaging ?? false,
        isPagingFishDecline: isPagingFishDecline ?? false,
        isPagingFishDeclineHistory: isPagingFishDeclineHistory ?? false,
        reachedMax: reachedMax ?? this.reachedMax,
        reachedMaxFishDecline: reachedMaxFishDecline ?? this.reachedMaxFishDecline,
        reachedMaxFishDeclineHistory: reachedMaxFishDeclineHistory ?? this.reachedMaxFishDeclineHistory,
        hasError: hasError ?? false,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
