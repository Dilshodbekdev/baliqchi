part of 'calculator_bloc.dart';

abstract class CalculatorEvent {}

class EconomicsEvent extends CalculatorEvent {
  final bool isPaging;

  EconomicsEvent({required this.isPaging});
}

class ExpensesMonthEvent extends CalculatorEvent {
  final bool isPaging;

  ExpensesMonthEvent({required this.isPaging});
}

class CreateDailyNutrientEvent extends CalculatorEvent {
  final CreateDailyNutrientBody body;

  CreateDailyNutrientEvent({required this.body});
}

class FishTypesEvent extends CalculatorEvent {
  FishTypesEvent();
}

class FoodTypesEvent extends CalculatorEvent {
  FoodTypesEvent();
}

class NutritionalInfosEvent extends CalculatorEvent {
  final String id;

  NutritionalInfosEvent({required this.id});
}
