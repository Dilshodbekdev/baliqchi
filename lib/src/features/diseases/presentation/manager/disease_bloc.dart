import 'dart:async';

import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/features/diseases/data/models/diseases_model.dart';
import 'package:baliqchi/src/features/diseases/domain/use_case/disease_use_case.dart';
import 'package:baliqchi/src/features/diseases/domain/use_case/diseases_use_case.dart';
import 'package:baliqchi/src/features/home/data/bodies/paging_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'disease_event.dart';

part 'disease_state.dart';

class DiseaseBloc extends Bloc<DiseaseEvent, DiseaseState> {
  final DiseasesUseCase _diseasesUseCase;
  final DiseaseUseCase _diseaseUseCase;

  DiseaseBloc(
    this._diseasesUseCase,
    this._diseaseUseCase,
  ) : super(DiseaseState()) {
    on<DiseasesEvent>((event, emit) async {
      await emit.onEach(_onPlaces(event), onData: emit.call);
    });

    on<GetDiseaseEvent>((event, emit) async {
      await emit.onEach(_onGetDisease(event), onData: emit.call);
    });
  }

  disease(String id) {
    add(GetDiseaseEvent(id: id));
  }

  diseases(String search) {
    add(DiseasesEvent(isPaging: false, search: search));
  }

  pagingDiseases(String search) {
    add(DiseasesEvent(isPaging: true, search: search));
  }

  Stream<DiseaseState> _onPlaces(DiseasesEvent event) async* {
    if (!state.reachedMax || !event.isPaging) {
      final page = event.isPaging ? (state.body?.page ?? 1) : 1;
      yield state.copyWith(
          isLoading: !event.isPaging, isPaging: event.isPaging);
      final dataState = await _diseasesUseCase.call(
          params: PagingBody(page: page, search: event.search));

      if (dataState is DataSuccess) {
        final newList = dataState.data?.content ?? [];
        yield state.copyWith(
          disease: state.isPaging ? [...state.disease, ...newList] : newList,
          reachedMax: newList.length < 10,
          body: (state.body ?? PagingBody()).copyWith(page: page + 1),
        );
      } else if (dataState is DataFailed) {
        yield state.copyWith(hasError: true, errorMessage: dataState.message);
      }
    }
  }

  Stream<DiseaseState> _onGetDisease(GetDiseaseEvent event) async* {
    yield state.copyWith(isLoading: true);

    final dataState = await _diseaseUseCase.call(params: event.id);

    if (dataState is DataSuccess) {
      yield state.copyWith(diseaseModel: dataState.data);
    } else if (dataState is DataFailed) {
      yield state.copyWith(hasError: true, errorMessage: dataState.message);
    }
  }
}
