import 'dart:async';

import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/features/diseases/data/models/diseases_model.dart';
import 'package:baliqchi/src/features/diseases/domain/use_case/diseases_use_case.dart';
import 'package:baliqchi/src/features/home/data/bodies/paging_body.dart';
import 'package:baliqchi/src/features/home/data/models/place_details_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'disease_event.dart';

part 'disease_state.dart';

class DiseaseBloc extends Bloc<DiseaseEvent, DiseaseState> {
  final DiseasesUseCase _placesUseCase;

  DiseaseBloc(
    this._placesUseCase,
  ) : super(DiseaseState()) {
    on<DiseasesEvent>((event, emit) async {
      await emit.onEach(_onPlaces(event), onData: emit.call);
    });
  }

  diseases(String search) {
    add(DiseasesEvent(isPaging: false,search: search));
  }

  pagingDiseases(String search) {
    add(DiseasesEvent(isPaging: true,search: search));
  }

  Stream<DiseaseState> _onPlaces(DiseasesEvent event) async* {
    if (!state.reachedMax || !event.isPaging) {
      final page = event.isPaging ? (state.body?.page ?? 1) : 1;
      yield state.copyWith(
          isLoading: !event.isPaging, isPaging: event.isPaging);
      final dataState =
          await _placesUseCase.call(params: PagingBody(page: page,search: event.search));

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
}
