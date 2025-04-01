part of 'home_bloc.dart';

class HomeState {
  final List<PlaceModel> places;
  final PayMeCardModel? payMeCard;
  final LoginModel? payMeCode;
  final LoginModel? me;
  final List<RegionModel>? regions;
  final List<DefinitionModel>? definitions;
  final List<BillingModel>? billings;
  final List<TechnologyModel>? technologies;
  final PlaceDetailsModel? placeDetailsModel;
  final bool isLoading;
  final bool isPayMeCard;
  final bool isPayMeCode;
  final PagingBody? body;
  final bool isPaging;
  final bool reachedMax;
  final bool hasError;
  final String errorMessage;

  HomeState({
    this.places = const [],
    this.payMeCard,
    this.payMeCode,
    this.me,
    this.regions,
    this.definitions,
    this.billings,
    this.technologies,
    this.placeDetailsModel,
    this.isLoading = false,
    this.isPayMeCard = false,
    this.isPayMeCode = false,
    this.body,
    this.isPaging = false,
    this.reachedMax = false,
    this.hasError = false,
    this.errorMessage = 'Some Error',
  });

  HomeState copyWith({
    List<PlaceModel>? places,
    PayMeCardModel? payMeCard,
    LoginModel? payMeCode,
    LoginModel? me,
    List<RegionModel>? regions,
    List<DefinitionModel>? definitions,
    List<BillingModel>? billings,
    List<TechnologyModel>? technologies,
    PlaceDetailsModel? placeDetailsModel,
    bool? isLoading,
    bool? isPayMeCard,
    bool? isPayMeCode,
    PagingBody? body,
    bool? isPaging,
    bool? reachedMax,
    bool? hasError,
    String? errorMessage,
  }) =>
      HomeState(
        places: places ?? this.places,
        payMeCard: payMeCard ?? this.payMeCard,
        payMeCode: payMeCode ?? this.payMeCode,
        me: me ?? this.me,
        regions: regions ?? this.regions,
        definitions: definitions ?? this.definitions,
        billings: billings ?? this.billings,
        technologies: technologies ?? this.technologies,
        placeDetailsModel: placeDetailsModel ?? this.placeDetailsModel,
        isLoading: isLoading ?? false,
        isPayMeCard: isPayMeCard ?? false,
        isPayMeCode: isPayMeCode ?? false,
        body: body ?? this.body,
        isPaging: isPaging ?? false,
        reachedMax: reachedMax ?? this.reachedMax,
        hasError: hasError ?? false,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
