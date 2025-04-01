import 'dart:async';

import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/features/calculator/data/bodies/create_daily_nutrient_body.dart';
import 'package:baliqchi/src/features/calculator/data/bodies/create_fish_decline_body.dart';
import 'package:baliqchi/src/features/calculator/data/bodies/create_general_calculation_body.dart';
import 'package:baliqchi/src/features/calculator/data/bodies/create_pond_body.dart';
import 'package:baliqchi/src/features/calculator/data/bodies/fish_decline_statistic_body.dart';
import 'package:baliqchi/src/features/calculator/data/bodies/update_general_calculation.dart';
import 'package:baliqchi/src/features/calculator/data/models/create_daily_nutrient_model.dart';
import 'package:baliqchi/src/features/calculator/data/models/fish_decline_details_model.dart';
import 'package:baliqchi/src/features/calculator/data/models/fish_decline_history_model.dart';
import 'package:baliqchi/src/features/calculator/data/models/fish_decline_statistic_model.dart';
import 'package:baliqchi/src/features/calculator/data/models/fish_declines_model.dart';
import 'package:baliqchi/src/features/calculator/data/models/food_model.dart';
import 'package:baliqchi/src/features/calculator/data/models/general_calculation_details_model.dart';
import 'package:baliqchi/src/features/calculator/data/models/general_calculations_model.dart';
import 'package:baliqchi/src/features/calculator/data/models/general_nutritional_info_model.dart';
import 'package:baliqchi/src/features/calculator/data/models/nutritional_info_model.dart';
import 'package:baliqchi/src/features/calculator/data/models/pond_fish_model.dart';
import 'package:baliqchi/src/features/calculator/data/models/pond_model.dart';
import 'package:baliqchi/src/features/calculator/data/models/pont_details_model.dart';
import 'package:baliqchi/src/features/calculator/domain/use_case/create_daily_nutrient_use_case.dart';
import 'package:baliqchi/src/features/calculator/domain/use_case/create_fish_decline_use_case.dart';
import 'package:baliqchi/src/features/calculator/domain/use_case/create_general_calculation_use_case.dart';
import 'package:baliqchi/src/features/calculator/domain/use_case/create_pond_use_case.dart';
import 'package:baliqchi/src/features/calculator/domain/use_case/delete_fish_decline_use_case.dart';
import 'package:baliqchi/src/features/calculator/domain/use_case/delete_general_calculation_use_case.dart';
import 'package:baliqchi/src/features/calculator/domain/use_case/fish_decline_details_use_case.dart';
import 'package:baliqchi/src/features/calculator/domain/use_case/fish_decline_statistic_use_case.dart';
import 'package:baliqchi/src/features/calculator/domain/use_case/fish_declines_history_use_case.dart';
import 'package:baliqchi/src/features/calculator/domain/use_case/fish_declines_use_case.dart';
import 'package:baliqchi/src/features/calculator/domain/use_case/fish_types1_use_case.dart';
import 'package:baliqchi/src/features/calculator/domain/use_case/food_types1_use_case.dart';
import 'package:baliqchi/src/features/calculator/domain/use_case/general_calculation_details_use_case.dart';
import 'package:baliqchi/src/features/calculator/domain/use_case/general_calculation_list_use_case.dart';
import 'package:baliqchi/src/features/calculator/domain/use_case/general_calculations_use_case.dart';
import 'package:baliqchi/src/features/calculator/domain/use_case/general_nutritional_infos_foods_use_case.dart';
import 'package:baliqchi/src/features/calculator/domain/use_case/general_nutritional_infos_use_case.dart';
import 'package:baliqchi/src/features/calculator/domain/use_case/nutritional_infos_use_case.dart';
import 'package:baliqchi/src/features/calculator/domain/use_case/pond_details_use_case.dart';
import 'package:baliqchi/src/features/calculator/domain/use_case/pond_fishes_use_case.dart';
import 'package:baliqchi/src/features/calculator/domain/use_case/ponds_use_case.dart';
import 'package:baliqchi/src/features/calculator/domain/use_case/technologies2_use_case.dart';
import 'package:baliqchi/src/features/calculator/domain/use_case/update_general_calculation_use_case.dart';
import 'package:baliqchi/src/features/economic/data/models/default_model.dart';
import 'package:baliqchi/src/features/home/data/bodies/paging_body.dart';
import 'package:baliqchi/src/features/home/data/models/place_details_model.dart';
import 'package:baliqchi/src/features/home/data/models/technology_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'calculator_event.dart';

part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  final FishTypes1UseCase _fishTypesUseCase;
  final FoodTypes1UseCase _foodTypesUseCase;
  final Technologies2UseCase _technologiesUseCase;
  final NutritionalInfosUseCase _nutritionalInfosUseCase;
  final PondDetailsUseCase _pondDetailsUseCase;
  final CreateDailyNutrientUseCase _createDailyNutrientUseCase;
  final CreatePondUseCase _createPondUseCase;
  final CreateFishDeclineUseCase _createFishDeclineUseCase;
  final PondsUseCase _pondsUseCase;
  final PondFishesUseCase _pondFishesUseCase;
  final GeneralCalculationsUseCase _generalCalculationsUseCase;
  final FishDeclinesUseCase _fishDeclinesUseCase;
  final FishDeclinesHistoryUseCase _fishDeclinesHistoryUseCase;
  final GeneralCalculationListUseCase _generalCalculationListUseCase;
  final GeneralCalculationDetailsUseCase _generalCalculationDetailsUseCase;
  final FishDeclineDetailsUseCase _fishDeclineDetailsUseCase;
  final UpdateGeneralCalculationUseCase _updateGeneralCalculationUseCase;
  final DeleteGeneralCalculationUseCase _deleteGeneralCalculationUseCase;
  final DeleteFishDeclineUseCase _deleteFishDeclineUseCase;
  final CreateGeneralCalculationUseCase _createGeneralCalculationUseCase;
  final GeneralNutritionalInfosUseCase _generalNutritionalInfosUseCase;
  final GeneralNutritionalInfosFoodsUseCase _generalNutritionalInfosFoodsUseCase;
  final FishDeclineStatisticUseCase _fishDeclineStatisticUseCase;

  CalculatorBloc(
    this._fishTypesUseCase,
    this._foodTypesUseCase,
    this._createDailyNutrientUseCase,
    this._nutritionalInfosUseCase,
    this._createPondUseCase,
    this._pondsUseCase,
    this._technologiesUseCase,
    this._pondDetailsUseCase,
    this._generalCalculationsUseCase,
    this._generalCalculationDetailsUseCase,
    this._createGeneralCalculationUseCase,
    this._generalNutritionalInfosUseCase,
    this._generalNutritionalInfosFoodsUseCase,
    this._updateGeneralCalculationUseCase,
    this._deleteGeneralCalculationUseCase,
    this._generalCalculationListUseCase,
    this._fishDeclinesUseCase,
    this._fishDeclineDetailsUseCase,
    this._createFishDeclineUseCase,
    this._deleteFishDeclineUseCase,
    this._fishDeclineStatisticUseCase,
    this._pondFishesUseCase, this._fishDeclinesHistoryUseCase,
  ) : super(CalculatorState()) {
    on<CreateDailyNutrientEvent>((event, emit) async {
      await emit.onEach(_onCreateDailyNutrient(event), onData: emit.call);
    });

    on<CreatePondEvent>((event, emit) async {
      await emit.onEach(_onCreatePond(event), onData: emit.call);
    });

    on<GeneralCalculationsEvent>((event, emit) async {
      await emit.onEach(_onGeneralCalculations(event), onData: emit.call);
    });

    on<GeneralCalculationListEvent>((event, emit) async {
      await emit.onEach(_onGeneralCalculationList(event), onData: emit.call);
    });

    on<CreateGeneralCalculationEvent>((event, emit) async {
      await emit.onEach(_onCreateGeneralCalculation(event), onData: emit.call);
    });

    on<FishTypesEvent>((event, emit) async {
      await emit.onEach(_onFishTypes(event), onData: emit.call);
    });

    on<FoodTypesEvent>((event, emit) async {
      await emit.onEach(_onFoodTypes(event), onData: emit.call);
    });

    on<GeneralNutritionalInfosFoodsEvent>((event, emit) async {
      await emit.onEach(_onGeneralNutritionalInfosFoods(event),
          onData: emit.call);
    });

    on<GeneralNutritionalInfosEvent>((event, emit) async {
      await emit.onEach(_onGeneralNutritionalInfos(event), onData: emit.call);
    });

    on<TechnologiesEvent>((event, emit) async {
      await emit.onEach(_onTechnologies(event), onData: emit.call);
    });

    on<PondsEvent>((event, emit) async {
      await emit.onEach(_onPonds(event), onData: emit.call);
    });

    on<NutritionalInfosEvent>((event, emit) async {
      await emit.onEach(_onNutritionalInfos(event), onData: emit.call);
    });

    on<PondDetailsEvent>((event, emit) async {
      await emit.onEach(_onPondDetails(event), onData: emit.call);
    });

    on<GeneralCalculationDetailsEvent>((event, emit) async {
      await emit.onEach(_onGeneralCalculationDetails(event), onData: emit.call);
    });

    on<GeneralCalculationListDetailsEvent>((event, emit) async {
      await emit.onEach(_onGeneralCalculationListDetails(event),
          onData: emit.call);
    });

    on<UpdateGeneralCalculationEvent>((event, emit) async {
      await emit.onEach(_onUpdateGeneralCalculation(event), onData: emit.call);
    });

    on<DeleteGeneralCalculationEvent>((event, emit) async {
      await emit.onEach(_onDeleteGeneralCalculation(event), onData: emit.call);
    });

    on<FishDeclinesEvent>((event, emit) async {
      await emit.onEach(_onFishDeclines(event), onData: emit.call);
    });

    on<FishDeclinesHistoryEvent>((event, emit) async {
      await emit.onEach(_onFishDeclinesHistory(event), onData: emit.call);
    });

    on<FishDeclineDetailsEvent>((event, emit) async {
      await emit.onEach(_onFishDeclineDetails(event), onData: emit.call);
    });

    on<CreateFishDeclineEvent>((event, emit) async {
      await emit.onEach(_onCreateFishDecline(event), onData: emit.call);
    });

    on<DeleteFishDeclineEvent>((event, emit) async {
      await emit.onEach(_onDeleteFishDecline(event), onData: emit.call);
    });

    on<FishDeclineStatisticEvent>((event, emit) async {
      await emit.onEach(_onFishDeclineStatistic(event), onData: emit.call);
    });

    on<PondFishesEvent>((event, emit) async {
      await emit.onEach(_onPondFishes(event), onData: emit.call);
    });

    on<StaticBodyEvent>((event, emit) async {
      emit(
        state.copyWith(
          statisticBody: state.statisticBody?.copyWith(
            year: event.year,
            fishTypeId: event.id,
          ) ??
              FishDeclineStatisticBody(year: 0, fishTypeId: '')
        ),
      );
    });
  }

  generalCalculations(String id) {
    add(GeneralCalculationsEvent(isPaging: false, id: id));
  }

  pagingGeneralCalculations(String id) {
    add(GeneralCalculationsEvent(isPaging: true, id: id));
  }

  fishDeclines(String pondId) {
    add(FishDeclinesEvent(isPaging: false, pondId: pondId));
  }

  pagingFishDeclines(String pondId) {
    add(FishDeclinesEvent(isPaging: true, pondId: pondId));
  }

  fishDeclinesHistory(String pondId) {
    add(FishDeclinesHistoryEvent(isPaging: false, pondId: pondId));
  }

  pagingFishDeclinesHistory(String pondId) {
    add(FishDeclinesHistoryEvent(isPaging: true, pondId: pondId));
  }

  generalCalculationList(String id) {
    add(GeneralCalculationListEvent(id: id));
  }

  fishTyped() {
    add(FishTypesEvent());
  }

  foodTyped() {
    add(FoodTypesEvent());
  }

  technologies() {
    add(TechnologiesEvent());
  }

  ponds() {
    add(PondsEvent());
  }

  nutritionalInfos(String id) {
    add(NutritionalInfosEvent(id: id));
  }

  fishDeclineStatistic() {
    add(FishDeclineStatisticEvent());
  }

  pondDetails(String id) {
    add(PondDetailsEvent(id: id));
  }

  fishDeclineDetails(String id) {
    add(FishDeclineDetailsEvent(id: id));
  }

  generalCalculationDetails(String id) {
    add(GeneralCalculationDetailsEvent(id: id));
  }

  generalCalculationListDetails(String id) {
    add(GeneralCalculationListDetailsEvent(id: id));
  }

  updateGeneralCalculation(UpdateGeneralCalculation body) {
    add(UpdateGeneralCalculationEvent(id: body));
  }

  deleteGeneralCalculation(String body) {
    add(DeleteGeneralCalculationEvent(id: body));
  }

  deleteFishDecline(String id) {
    add(DeleteFishDeclineEvent(id: id));
  }

  generalNutritionalInfosFoods(String id) {
    add(GeneralNutritionalInfosFoodsEvent(id: id));
  }

  generalNutritionalInfos(String fishId, String foodId) {
    add(GeneralNutritionalInfosEvent(fishId: fishId, foodId: foodId));
  }

  createDailyNutrient(CreateDailyNutrientBody body) {
    add(CreateDailyNutrientEvent(body: body));
  }

  createPond(CreatePondBody body) {
    add(CreatePondEvent(body: body));
  }

  createFishDecline(CreateFishDeclineBody body) {
    add(CreateFishDeclineEvent(body: body));
  }

  createGeneralCalculation(CreateGeneralCalculationBody body) {
    add(CreateGeneralCalculationEvent(body: body));
  }

  pondFishes() {
    add(PondFishesEvent());
  }

  changeStatisticBody({String? id, int? year}) {
    add(StaticBodyEvent(year, id));
  }

  Stream<CalculatorState> _onGeneralCalculations(
      GeneralCalculationsEvent event) async* {
    if (!state.reachedMax || !event.isPaging) {
      final page = event.isPaging ? (state.body?.page ?? 1) : 1;
      yield state.copyWith(
          isLoading: !event.isPaging, isPaging: event.isPaging);
      final dataState = await _generalCalculationsUseCase.call(
          params: PagingBody(page: page, regionId: event.id));

      if (dataState is DataSuccess) {
        final newList = dataState.data?.content ?? [];
        yield state.copyWith(
          generalCalculations: state.isPaging
              ? [...state.generalCalculations, ...newList]
              : newList,
          reachedMax: newList.length < 10,
          body: (state.body ?? PagingBody()).copyWith(page: page + 1),
        );
      } else if (dataState is DataFailed) {
        yield state.copyWith(hasError: true, errorMessage: dataState.message);
      }
    }
  }

  Stream<CalculatorState> _onFishDeclines(FishDeclinesEvent event) async* {
    if (!state.reachedMaxFishDecline || !event.isPaging) {
      final page = event.isPaging ? (state.bodyFishDecline?.page ?? 1) : 1;
      yield state.copyWith(
          isLoading: !event.isPaging, isPagingFishDecline: event.isPaging);
      final dataState = await _fishDeclinesUseCase.call(
          params: PagingBody(page: page, id: event.pondId));

      if (dataState is DataSuccess) {
        final newList = dataState.data?.content ?? [];
        yield state.copyWith(
          fishDeclines: state.isPagingFishDecline
              ? [...state.fishDeclines, ...newList]
              : newList,
          reachedMaxFishDecline: newList.length < 10,
          bodyFishDecline:
              (state.bodyFishDecline ?? PagingBody()).copyWith(page: page + 1),
        );
      } else if (dataState is DataFailed) {
        yield state.copyWith(hasError: true, errorMessage: dataState.message);
      }
    }
  }

  Stream<CalculatorState> _onFishDeclinesHistory(FishDeclinesHistoryEvent event) async* {
    if (!state.reachedMaxFishDeclineHistory || !event.isPaging) {
      final page = event.isPaging ? (state.bodyFishDeclineHistory?.page ?? 1) : 1;
      yield state.copyWith(
          isLoading: !event.isPaging, isPagingFishDeclineHistory: event.isPaging);
      final dataState = await _fishDeclinesHistoryUseCase.call(
          params: PagingBody(page: page, id: event.pondId));

      if (dataState is DataSuccess) {
        final newList = dataState.data?.content ?? [];
        yield state.copyWith(
          fishDeclinesHistory: state.isPagingFishDeclineHistory
              ? [...state.fishDeclinesHistory, ...newList]
              : newList,
          reachedMaxFishDeclineHistory: newList.length < 10,
          bodyFishDeclineHistory:
          (state.bodyFishDeclineHistory ?? PagingBody()).copyWith(page: page + 1),
        );
      } else if (dataState is DataFailed) {
        yield state.copyWith(hasError: true, errorMessage: dataState.message);
      }
    }
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

  Stream<CalculatorState> _onFishDeclineStatistic(
      FishDeclineStatisticEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState =
        await _fishDeclineStatisticUseCase.call(params: state.statisticBody??FishDeclineStatisticBody(year: 0, fishTypeId: ''));

    if (dataState is DataSuccess) {
      yield state.copyWith(fishDeclineStatistics: dataState.data);
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

  Stream<CalculatorState> _onGeneralNutritionalInfosFoods(
      GeneralNutritionalInfosFoodsEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState =
        await _generalNutritionalInfosFoodsUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(generalNutritionalInfosFoods: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<CalculatorState> _onGeneralNutritionalInfos(
      GeneralNutritionalInfosEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _generalNutritionalInfosUseCase.call(
        params: PagingBody(id: event.fishId, regionId: event.foodId));

    if (dataState is DataSuccess) {
      yield state.copyWith(generalNutritionalInfos: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<CalculatorState> _onTechnologies(TechnologiesEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _technologiesUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(technologies: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<CalculatorState> _onPonds(PondsEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _pondsUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(ponds: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<CalculatorState> _onPondFishes(PondFishesEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _pondFishesUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      changeStatisticBody(id:dataState.data?.first.fishTypeId ?? '',year:DateTime.now().year);
      fishDeclineStatistic();
      yield state.copyWith(pondFishes: dataState.data, isPondFishes: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<CalculatorState> _onGeneralCalculationList(
      GeneralCalculationListEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState =
        await _generalCalculationListUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(generalCalculationList: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<CalculatorState> _onNutritionalInfos(
      NutritionalInfosEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _nutritionalInfosUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(nutritionalInfos: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<CalculatorState> _onPondDetails(PondDetailsEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _pondDetailsUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(pontDetailsModel: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<CalculatorState> _onFishDeclineDetails(
      FishDeclineDetailsEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _fishDeclineDetailsUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(fishDeclineDetailsModel: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<CalculatorState> _onGeneralCalculationDetails(
      GeneralCalculationDetailsEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState =
        await _generalCalculationDetailsUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(
          generalCalculationDetailsModel: dataState.data, isDetails: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<CalculatorState> _onGeneralCalculationListDetails(
      GeneralCalculationListDetailsEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState =
        await _generalCalculationDetailsUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(generalCalculationListDetailsModel: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<CalculatorState> _onUpdateGeneralCalculation(
      UpdateGeneralCalculationEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState =
        await _updateGeneralCalculationUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(
          updateGeneralCalculationModel: dataState.data, isUpdated: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<CalculatorState> _onDeleteGeneralCalculation(
      DeleteGeneralCalculationEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState =
        await _deleteGeneralCalculationUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(
          deleteGeneralCalculationModel: dataState.data, isDeleted: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<CalculatorState> _onDeleteFishDecline(
      DeleteFishDeclineEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _deleteFishDeclineUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(
          deleteFishDeclineModel: dataState.data, isDeleted: true);
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
          createDailyNutrientModel: dataState.data,
          isCreatedDailyNutrient: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<CalculatorState> _onCreatePond(CreatePondEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _createPondUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(createPond: dataState.data, isCreatedPond: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<CalculatorState> _onCreateFishDecline(
      CreateFishDeclineEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _createFishDeclineUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(
          createFishDecline: dataState.data, isCreatedFishDecline: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<CalculatorState> _onCreateGeneralCalculation(
      CreateGeneralCalculationEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState =
        await _createGeneralCalculationUseCase.call(params: event.body);

    if (dataState is DataSuccess) {
      yield state.copyWith(
          createPond: dataState.data, isCreatedGeneralCalculation: true);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }
}
