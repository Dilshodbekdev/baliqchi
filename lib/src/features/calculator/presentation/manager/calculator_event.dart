part of 'calculator_bloc.dart';

abstract class CalculatorEvent {}

class GeneralCalculationsEvent extends CalculatorEvent {
  final bool isPaging;
  final String id;

  GeneralCalculationsEvent({required this.isPaging, required this.id});
}

class FishDeclinesEvent extends CalculatorEvent {
  final bool isPaging;
  final String pondId;

  FishDeclinesEvent({required this.isPaging, required this.pondId});
}

class FishDeclinesHistoryEvent extends CalculatorEvent {
  final bool isPaging;
  final String pondId;

  FishDeclinesHistoryEvent({required this.isPaging, required this.pondId});
}

class GeneralCalculationListEvent extends CalculatorEvent {
  final String id;

  GeneralCalculationListEvent({required this.id});
}

class GeneralCalculationDetailsEvent extends CalculatorEvent {
  final String id;

  GeneralCalculationDetailsEvent({required this.id});
}

class FishDeclineDetailsEvent extends CalculatorEvent {
  final String id;

  FishDeclineDetailsEvent({required this.id});
}

class GeneralCalculationListDetailsEvent extends CalculatorEvent {
  final String id;

  GeneralCalculationListDetailsEvent({required this.id});
}

class UpdateGeneralCalculationEvent extends CalculatorEvent {
  final UpdateGeneralCalculation id;

  UpdateGeneralCalculationEvent({required this.id});
}

class DeleteGeneralCalculationEvent extends CalculatorEvent {
  final String id;

  DeleteGeneralCalculationEvent({required this.id});
}

class DeleteFishDeclineEvent extends CalculatorEvent {
  final String id;

  DeleteFishDeclineEvent({required this.id});
}

class FishDeclineStatisticEvent extends CalculatorEvent {
  FishDeclineStatisticEvent();
}

class GeneralNutritionalInfosFoodsEvent extends CalculatorEvent {
  final String id;

  GeneralNutritionalInfosFoodsEvent({required this.id});
}

class GeneralNutritionalInfosEvent extends CalculatorEvent {
  final String fishId;
  final String foodId;

  GeneralNutritionalInfosEvent({required this.fishId, required this.foodId});
}

class CreateDailyNutrientEvent extends CalculatorEvent {
  final CreateDailyNutrientBody body;

  CreateDailyNutrientEvent({required this.body});
}

class CreatePondEvent extends CalculatorEvent {
  final CreatePondBody body;

  CreatePondEvent({required this.body});
}

class CreateFishDeclineEvent extends CalculatorEvent {
  final CreateFishDeclineBody body;

  CreateFishDeclineEvent({required this.body});
}

class CreateGeneralCalculationEvent extends CalculatorEvent {
  final CreateGeneralCalculationBody body;

  CreateGeneralCalculationEvent({required this.body});
}

class FishTypesEvent extends CalculatorEvent {
  FishTypesEvent();
}

class FoodTypesEvent extends CalculatorEvent {
  FoodTypesEvent();
}

class TechnologiesEvent extends CalculatorEvent {
  TechnologiesEvent();
}

class PondsEvent extends CalculatorEvent {
  PondsEvent();
}

class PondFishesEvent extends CalculatorEvent {
  PondFishesEvent();
}

class NutritionalInfosEvent extends CalculatorEvent {
  final String id;

  NutritionalInfosEvent({required this.id});
}

class PondDetailsEvent extends CalculatorEvent {
  final String id;

  PondDetailsEvent({required this.id});
}

class StaticBodyEvent extends CalculatorEvent {
  final int? year;
  final String? id;

  StaticBodyEvent(this.year, this.id);
}
