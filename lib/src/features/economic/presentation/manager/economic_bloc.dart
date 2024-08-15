import 'dart:async';

import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/features/economic/data/bodies/create_economic_body.dart';
import 'package:baliqchi/src/features/economic/data/bodies/expense_month_body.dart';
import 'package:baliqchi/src/features/economic/data/models/default_model.dart';
import 'package:baliqchi/src/features/economic/data/models/details_economic_model.dart';
import 'package:baliqchi/src/features/economic/data/models/economics_model.dart';
import 'package:baliqchi/src/features/economic/data/models/expense_type_model.dart';
import 'package:baliqchi/src/features/economic/data/models/expenses_month_model.dart';
import 'package:baliqchi/src/features/economic/domain/use_case/create_economic_use_case.dart';
import 'package:baliqchi/src/features/economic/domain/use_case/create_expense_month_use_case.dart';
import 'package:baliqchi/src/features/economic/domain/use_case/details_economic_use_case.dart';
import 'package:baliqchi/src/features/economic/domain/use_case/economics_use_case.dart';
import 'package:baliqchi/src/features/economic/domain/use_case/expense_types_use_case.dart';
import 'package:baliqchi/src/features/economic/domain/use_case/expenses_month_use_case.dart';
import 'package:baliqchi/src/features/economic/domain/use_case/fish_types_use_case.dart';
import 'package:baliqchi/src/features/economic/domain/use_case/food_types_use_case.dart';
import 'package:baliqchi/src/features/economic/domain/use_case/technologies_use_case.dart';
import 'package:baliqchi/src/features/economic/domain/use_case/update_economic_use_case.dart';
import 'package:baliqchi/src/features/home/data/bodies/paging_body.dart';
import 'package:baliqchi/src/features/home/data/models/place_details_model.dart';
import 'package:baliqchi/src/features/home/data/models/technology_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'economic_event.dart';

part 'economic_state.dart';

class EconomicBloc extends Bloc<EconomicEvent, EconomicState> {
  final EconomicsUseCase _economicsUseCase;
  final ExpensesMonthUseCase _expensesMonthUseCase;
  final FishTypesUseCase _fishTypesUseCase;
  final FoodTypesUseCase _foodTypesUseCase;
  final ExpenseTypesUseCase _expenseTypesUseCase;
  final TechnologiesUseCase _technologiesUseCase;
  final CreateEconomicUseCase _createEconomicUseCase;
  final CreateExpenseMonthUseCase _createExpenseMonthUseCase;
  final DetailsEconomicUseCase _detailsEconomicUseCase;
  final UpdateEconomicUseCase _updateEconomicUseCase;

  EconomicBloc(
    this._economicsUseCase,
    this._fishTypesUseCase,
    this._foodTypesUseCase,
    this._technologiesUseCase,
    this._createEconomicUseCase,
    this._detailsEconomicUseCase,
    this._updateEconomicUseCase,
    this._expensesMonthUseCase,
    this._expenseTypesUseCase,
    this._createExpenseMonthUseCase,
  ) : super(EconomicState()) {
    on<EconomicsEvent>((event, emit) async {
      await emit.onEach(_onEconomics(event), onData: emit.call);
    });

    on<ExpensesMonthEvent>((event, emit) async {
      await emit.onEach(_onExpensesMonth(event), onData: emit.call);
    });

    on<CreateEconomicEvent>((event, emit) async {
      await emit.onEach(_onCreateEconomic(event), onData: emit.call);
    });

    on<CreateExpenseMonthEvent>((event, emit) async {
      await emit.onEach(_onCreateExpenseMonth(event), onData: emit.call);
    });

    on<DetailsEconomicEvent>((event, emit) async {
      await emit.onEach(_onDetailsEconomic(event), onData: emit.call);
    });

    on<UpdateEconomicEvent>((event, emit) async {
      await emit.onEach(_onUpdateEconomic(event), onData: emit.call);
    });

    on<FishTypesEvent>((event, emit) async {
      await emit.onEach(_onFishTypes(event), onData: emit.call);
    });

    on<FoodTypesEvent>((event, emit) async {
      await emit.onEach(_onFoodTypes(event), onData: emit.call);
    });

    on<ExpenseTypesEvent>((event, emit) async {
      await emit.onEach(_onExpenseTypes(event), onData: emit.call);
    });

    on<TechnologiesEvent>((event, emit) async {
      await emit.onEach(_onTechnologies(event), onData: emit.call);
    });
  }

  economics() {
    add(EconomicsEvent(isPaging: false));
  }

  pagingEconomics() {
    add(EconomicsEvent(isPaging: true));
  }

  expensesMonth() {
    add(ExpensesMonthEvent(isPaging: false));
  }

  pagingExpensesMonth() {
    add(ExpensesMonthEvent(isPaging: true));
  }

  fishTyped() {
    add(FishTypesEvent());
  }

  foodTyped() {
    add(FoodTypesEvent());
  }

  expenseTyped() {
    add(ExpenseTypesEvent());
  }

  technologies() {
    add(TechnologiesEvent());
  }

  createEconomic(CreateEconomicBody body) {
    add(CreateEconomicEvent(body: body));
  }

  createExpenseMonth(List<ExpenseMonthBody> body) {
    add(CreateExpenseMonthEvent(body: body));
  }

  detailsEconomic(String id) {
    add(DetailsEconomicEvent(id: id));
  }

  updateEconomic(PagingBody body) {
    add(UpdateEconomicEvent(body: body));
  }

  Stream<EconomicState> _onEconomics(EconomicsEvent event) async* {
    if (!state.reachedMax || !event.isPaging) {
      final page = event.isPaging ? (state.body?.page ?? 1) : 1;
      yield state.copyWith(
          isLoading: !event.isPaging, isPaging: event.isPaging);
      final dataState = await _economicsUseCase.call(
          params: PagingBody(page: page));

      if (dataState is DataSuccess) {
        final newList = dataState.data?.content ?? [];
        yield state.copyWith(
          economics:
              state.isPaging ? [...state.economics, ...newList] : newList,
          reachedMax: newList.length < 10,
          body: (state.body ?? PagingBody()).copyWith(page: page + 1),
        );
      } else if (dataState is DataFailed) {
        yield state.copyWith(hasError: true, errorMessage: dataState.message);
      }
    }
  }

  Stream<EconomicState> _onExpensesMonth(ExpensesMonthEvent event) async* {
    if (!state.reachedMax1 || !event.isPaging) {
      final page = event.isPaging ? (state.body1?.page ?? 1) : 1;
      yield state.copyWith(
          isLoading: !event.isPaging, isPaging: event.isPaging);
      final dataState =
          await _expensesMonthUseCase.call(params: PagingBody(page: page));

      if (dataState is DataSuccess) {
        final newList = dataState.data?.content ?? [];
        yield state.copyWith(
          expensesMonth:
              state.isPaging1 ? [...state.expensesMonth, ...newList] : newList,
          reachedMax1: newList.length < 10,
          body1: (state.body1 ?? PagingBody()).copyWith(page: page + 1),
        );
      } else if (dataState is DataFailed) {
        yield state.copyWith(hasError: true, errorMessage: dataState.message);
      }
    }
  }

  Stream<EconomicState> _onFishTypes(FishTypesEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _fishTypesUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(fishTypes: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<EconomicState> _onFoodTypes(FoodTypesEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _foodTypesUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(foodTypes: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<EconomicState> _onExpenseTypes(ExpenseTypesEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _expenseTypesUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(expenseTypes: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<EconomicState> _onTechnologies(TechnologiesEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _technologiesUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(technologies: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<EconomicState> _onCreateEconomic(CreateEconomicEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _createEconomicUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(createEconomic: dataState.data, isCreated: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<EconomicState> _onCreateExpenseMonth(CreateExpenseMonthEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _createExpenseMonthUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(createExpenseMonth: dataState.data, isCreated: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<EconomicState> _onDetailsEconomic(DetailsEconomicEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _detailsEconomicUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(
          detailsEconomicModel: dataState.data, isCreated: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<EconomicState> _onUpdateEconomic(UpdateEconomicEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _updateEconomicUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(
          detailsEconomicModel: dataState.data, isCreated: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }
}
