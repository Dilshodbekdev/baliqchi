import 'dart:async';

import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/features/calculator/data/bodies/create_daily_nutrient_body.dart';
import 'package:baliqchi/src/features/calculator/data/models/create_daily_nutrient_model.dart';
import 'package:baliqchi/src/features/calculator/data/models/nutritional_info_model.dart';
import 'package:baliqchi/src/features/calculator/domain/use_case/create_daily_nutrient_use_case.dart';
import 'package:baliqchi/src/features/calculator/domain/use_case/fish_types1_use_case.dart';
import 'package:baliqchi/src/features/calculator/domain/use_case/food_types1_use_case.dart';
import 'package:baliqchi/src/features/calculator/domain/use_case/nutritional_infos_use_case.dart';
import 'package:baliqchi/src/features/economic/data/bodies/expense_month_body.dart';
import 'package:baliqchi/src/features/economic/data/models/default_model.dart';
import 'package:baliqchi/src/features/economic/data/models/details_economic_model.dart';
import 'package:baliqchi/src/features/economic/data/models/economics_model.dart';
import 'package:baliqchi/src/features/economic/data/models/expense_type_model.dart';
import 'package:baliqchi/src/features/economic/data/models/expenses_month_model.dart';
import 'package:baliqchi/src/features/home/data/bodies/paging_body.dart';
import 'package:baliqchi/src/features/home/data/models/place_details_model.dart';
import 'package:baliqchi/src/features/home/data/models/technology_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'calculator_event.dart';

part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  final FishTypes1UseCase _fishTypesUseCase;
  final FoodTypes1UseCase _foodTypesUseCase;
  final NutritionalInfosUseCase _nutritionalInfosUseCase;
  final CreateDailyNutrientUseCase _createDailyNutrientUseCase;

  CalculatorBloc(
    this._fishTypesUseCase,
    this._foodTypesUseCase,
    this._createDailyNutrientUseCase,
    this._nutritionalInfosUseCase,
  ) : super(CalculatorState()) {
    on<CreateDailyNutrientEvent>((event, emit) async {
      await emit.onEach(_onCreateDailyNutrient(event), onData: emit.call);
    });

    on<FishTypesEvent>((event, emit) async {
      await emit.onEach(_onFishTypes(event), onData: emit.call);
    });

    on<FoodTypesEvent>((event, emit) async {
      await emit.onEach(_onFoodTypes(event), onData: emit.call);
    });

    on<NutritionalInfosEvent>((event, emit) async {
      await emit.onEach(_onNutritionalInfos(event), onData: emit.call);
    });
  }

  fishTyped() {
    add(FishTypesEvent());
  }

  foodTyped() {
    add(FoodTypesEvent());
  }

  nutritionalInfos(String id) {
    add(NutritionalInfosEvent(id: id));
  }

  createDailyNutrient(CreateDailyNutrientBody body) {
    add(CreateDailyNutrientEvent(body: body));
  }

  Stream<CalculatorState> _onFishTypes(FishTypesEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _fishTypesUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(fishTypes: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<CalculatorState> _onFoodTypes(FoodTypesEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _foodTypesUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(foodTypes: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<CalculatorState> _onNutritionalInfos(NutritionalInfosEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _nutritionalInfosUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(nutritionalInfos: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<CalculatorState> _onCreateDailyNutrient(
      CreateDailyNutrientEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState =
        await _createDailyNutrientUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(
          createDailyNutrientModel: dataState.data, isCreated: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }
}
