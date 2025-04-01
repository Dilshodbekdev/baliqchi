part of 'economic_bloc.dart';

abstract class EconomicEvent {}

class EconomicsEvent extends EconomicEvent {
  final bool isPaging;

  EconomicsEvent({required this.isPaging});
}

class ExpensesMonthEvent extends EconomicEvent {
  final bool isPaging;

  ExpensesMonthEvent({required this.isPaging});
}

class ExpenseMonthStatisticsEvent extends EconomicEvent {
  final FilterBody body;

  ExpenseMonthStatisticsEvent({required this.body});
}

class CreateEconomicEvent extends EconomicEvent {
  final CreateEconomicBody body;

  CreateEconomicEvent({required this.body});
}

class CreateExpenseMonthEvent extends EconomicEvent {
  final List<ExpenseMonthBody> body;

  CreateExpenseMonthEvent({required this.body});
}

class DetailsEconomicEvent extends EconomicEvent {
  final String id;

  DetailsEconomicEvent({required this.id});
}

class UpdateEconomicEvent extends EconomicEvent {
  final PagingBody body;

  UpdateEconomicEvent({required this.body});
}

class FishTypesEvent extends EconomicEvent {
  FishTypesEvent();
}

class FoodTypesEvent extends EconomicEvent {
  FoodTypesEvent();
}

class ExpenseTypesEvent extends EconomicEvent {
  ExpenseTypesEvent();
}

class TechnologiesEvent extends EconomicEvent {
  TechnologiesEvent();
}
