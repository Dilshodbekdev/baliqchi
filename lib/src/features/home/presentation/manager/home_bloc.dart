import 'dart:async';

import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/features/home/data/bodies/paging_body.dart';
import 'package:baliqchi/src/features/home/data/models/billing_model.dart';
import 'package:baliqchi/src/features/home/data/models/definition_model.dart';
import 'package:baliqchi/src/features/home/data/models/place_details_model.dart';
import 'package:baliqchi/src/features/home/data/models/places_model.dart';
import 'package:baliqchi/src/features/home/data/models/region_model.dart';
import 'package:baliqchi/src/features/home/data/models/technology_model.dart';
import 'package:baliqchi/src/features/home/domain/use_case/billings_use_case.dart';
import 'package:baliqchi/src/features/home/domain/use_case/definitions_use_case.dart';
import 'package:baliqchi/src/features/home/domain/use_case/place_details_use_case.dart';
import 'package:baliqchi/src/features/home/domain/use_case/places_use_case.dart';
import 'package:baliqchi/src/features/home/domain/use_case/regions_use_case.dart';
import 'package:baliqchi/src/features/home/domain/use_case/technologies1_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PlacesUseCase _placesUseCase;
  final RegionsUseCase _regionsUseCase;
  final DefinitionsUseCase _definitionsUseCase;
  final BillingsUseCase _billingsUseCase;
  final PlaceDetailsUseCase _placeDetailsUseCase;
  final Technologies1UseCase _technologies1useCase;

  HomeBloc(
    this._placesUseCase,
    this._regionsUseCase,
    this._placeDetailsUseCase,
    this._technologies1useCase,
    this._definitionsUseCase,
    this._billingsUseCase,
  ) : super(HomeState()) {
    on<PlacesEvent>((event, emit) async {
      await emit.onEach(_onPlaces(event), onData: emit.call);
    });

    on<TechnologyEvent>((event, emit) async {
      await emit.onEach(_onTechnologies(event), onData: emit.call);
    });

    on<RegionsEvent>((event, emit) async {
      await emit.onEach(_onRegions(event), onData: emit.call);
    });

    on<DefinitionsEvent>((event, emit) async {
      await emit.onEach(_onDefinitions(event), onData: emit.call);
    });

    on<BillingsEvent>((event, emit) async {
      await emit.onEach(_onBillings(event), onData: emit.call);
    });

    on<PlaceDetailsEvent>((event, emit) async {
      await emit.onEach(_onPlaceDetails(event), onData: emit.call);
    });
  }

  regions(String search) {
    add(RegionsEvent(search: search));
  }

  definitions() {
    add(DefinitionsEvent());
  }

  billings() {
    add(BillingsEvent());
  }

  technologies() {
    add(TechnologyEvent());
  }

  placeDetails(String id) {
    add(PlaceDetailsEvent(id: id));
  }

  places(String? region) {
    add(PlacesEvent(isPaging: false, region));
  }

  pagingPlaces(String? region) {
    add(PlacesEvent(isPaging: true, region));
  }

  Stream<HomeState> _onPlaces(PlacesEvent event) async* {
    if (!state.reachedMax || !event.isPaging) {
      final page = event.isPaging ? (state.body?.page ?? 1) : 1;
      yield state.copyWith(
          isLoading: !event.isPaging, isPaging: event.isPaging);
      final dataState = await _placesUseCase.call(
          params: PagingBody(page: page, regionId: event.region));

      if (dataState is DataSuccess) {
        final newList = dataState.data?.content ?? [];
        yield state.copyWith(
          places: state.isPaging ? [...state.places, ...newList] : newList,
          reachedMax: newList.length < 10,
          body: (state.body ?? PagingBody()).copyWith(page: page + 1),
        );
      } else if (dataState is DataFailed) {
        yield state.copyWith(hasError: true, errorMessage: dataState.message);
      }
    }
  }

  Stream<HomeState> _onRegions(RegionsEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _regionsUseCase.call(params: event.search);

    if (dataState is DataSuccess) {
      yield state.copyWith(regions: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<HomeState> _onDefinitions(DefinitionsEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _definitionsUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(definitions: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<HomeState> _onBillings(BillingsEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _billingsUseCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(billings: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<HomeState> _onTechnologies(TechnologyEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _technologies1useCase.call(params: 1);

    if (dataState is DataSuccess) {
      yield state.copyWith(technologies: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }

  Stream<HomeState> _onPlaceDetails(PlaceDetailsEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _placeDetailsUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(placeDetailsModel: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }
}
