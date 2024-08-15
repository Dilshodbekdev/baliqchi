part of 'disease_bloc.dart';

class DiseaseState {
  final List<DiseaseModel> disease;
  final PlaceDetailsModel? placeDetailsModel;
  final bool isLoading;
  final PagingBody? body;
  final bool isPaging;
  final bool reachedMax;
  final bool hasError;
  final String errorMessage;

  DiseaseState({
    this.disease = const [],
    this.placeDetailsModel,
    this.isLoading = false,
    this.body,
    this.isPaging = false,
    this.reachedMax = false,
    this.hasError = false,
    this.errorMessage = 'Some Error',
  });

  DiseaseState copyWith({
    List<DiseaseModel>? disease,
    PlaceDetailsModel? placeDetailsModel,
    bool? isLoading,
    PagingBody? body,
    bool? isPaging,
    bool? reachedMax,
    bool? hasError,
    String? errorMessage,
  }) =>
      DiseaseState(
        disease: disease ?? this.disease,
        placeDetailsModel: placeDetailsModel ?? this.placeDetailsModel,
        isLoading: isLoading ?? false,
        body: body ?? this.body,
        isPaging: isPaging ?? false,
        reachedMax: reachedMax ?? this.reachedMax,
        hasError: hasError ?? false,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
