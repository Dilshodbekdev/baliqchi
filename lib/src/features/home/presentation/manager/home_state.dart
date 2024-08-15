part of 'home_bloc.dart';

class HomeState {
  final List<PlaceModel> places;
  final List<RegionModel>? regions;
  final List<DefinitionModel>? definitions;
  final List<BillingModel>? billings;
  final List<TechnologyModel>? technologies;
  final PlaceDetailsModel? placeDetailsModel;
  final bool isLoading;
  final PagingBody? body;
  final bool isPaging;
  final bool reachedMax;
  final bool hasError;
  final String errorMessage;

  HomeState({
    this.places = const [],
    this.regions,
    this.definitions,
    this.billings,
    this.technologies,
    this.placeDetailsModel,
    this.isLoading = false,
    this.body,
    this.isPaging = false,
    this.reachedMax = false,
    this.hasError = false,
    this.errorMessage = 'Some Error',
  });

  HomeState copyWith({
    List<PlaceModel>? places,
    List<RegionModel>? regions,
    List<DefinitionModel>? definitions,
    List<BillingModel>? billings,
    List<TechnologyModel>? technologies,
    PlaceDetailsModel? placeDetailsModel,
    bool? isLoading,
    PagingBody? body,
    bool? isPaging,
    bool? reachedMax,
    bool? hasError,
    String? errorMessage,
  }) =>
      HomeState(
        places: places ?? this.places,
        regions: regions ?? this.regions,
        definitions: definitions ?? this.definitions,
        billings: billings ?? this.billings,
        technologies: technologies ?? this.technologies,
        placeDetailsModel: placeDetailsModel ?? this.placeDetailsModel,
        isLoading: isLoading ?? false,
        body: body ?? this.body,
        isPaging: isPaging ?? false,
        reachedMax: reachedMax ?? this.reachedMax,
        hasError: hasError ?? false,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
