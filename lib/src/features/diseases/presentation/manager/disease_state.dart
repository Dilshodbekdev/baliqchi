part of 'disease_bloc.dart';

class DiseaseState {
  final List<DiseaseModel> disease;
  final DiseaseModel? diseaseModel;
  final bool isLoading;
  final PagingBody? body;
  final bool isPaging;
  final bool reachedMax;
  final bool hasError;
  final String errorMessage;

  DiseaseState({
    this.disease = const [],
    this.diseaseModel,
    this.isLoading = false,
    this.body,
    this.isPaging = false,
    this.reachedMax = false,
    this.hasError = false,
    this.errorMessage = 'Some Error',
  });

  DiseaseState copyWith({
    List<DiseaseModel>? disease,
    DiseaseModel? diseaseModel,
    bool? isLoading,
    PagingBody? body,
    bool? isPaging,
    bool? reachedMax,
    bool? hasError,
    String? errorMessage,
  }) =>
      DiseaseState(
        disease: disease ?? this.disease,
        diseaseModel: diseaseModel ?? this.diseaseModel,
        isLoading: isLoading ?? false,
        body: body ?? this.body,
        isPaging: isPaging ?? false,
        reachedMax: reachedMax ?? this.reachedMax,
        hasError: hasError ?? false,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
