import 'package:baliqchi/src/features/auth/data/models/login_model.dart';
import 'package:baliqchi/src/features/home/data/bodies/pay_me_card_body.dart';
import 'package:baliqchi/src/features/home/data/bodies/pay_me_code_body.dart';
import 'package:baliqchi/src/features/home/data/models/billing_model.dart';
import 'package:baliqchi/src/features/home/data/models/definition_model.dart';
import 'package:baliqchi/src/features/home/data/models/pay_me_card_model.dart';
import 'package:baliqchi/src/features/home/data/models/place_details_model.dart';
import 'package:baliqchi/src/features/home/data/models/places_model.dart';
import 'package:baliqchi/src/features/home/data/models/region_model.dart';
import 'package:baliqchi/src/features/home/data/models/technology_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'home_api_service.g.dart';

@RestApi()
abstract class HomeApiService {
  factory HomeApiService(Dio dio, {String baseUrl}) = _HomeApiService;

  /// URLS
  static const String _places = 'api/v1/places/all';
  static const String _placeDetails = 'api/v1/places/{id}';
  static const String _regions = 'api/v1/regions';
  static const String _technologies = 'api/v1/technologies/all';
  static const String _definitions = 'api/v1/payment-definitions';
  static const String _billings = 'api/v1/billing-infos';
  static const String _payMeCard = 'api/pay-me/card';
  static const String _payMeCode = 'api/pay-me/code';
  static const String _me = 'api/v1/auth/me';

  /// REQUESTS
  @GET(_places)
  Future<HttpResponse<PlacesModel>> places(
    @Query('page') int page,
    @Query('size') int size,
    @Query('regionId') String? regionId,
    @Query('search') String? search,
  );

  @GET(_regions)
  Future<HttpResponse<List<RegionModel>>> regions(
    @Query('search') String? search,
  );

  @GET(_definitions)
  Future<HttpResponse<List<DefinitionModel>>> definitions();

  @GET(_me)
  Future<HttpResponse<LoginModel>> me();

  @GET(_billings)
  Future<HttpResponse<List<BillingModel>>> billings();

  @POST(_payMeCard)
  Future<HttpResponse<PayMeCardModel>> payMeCard(@Body() PayMeCardBody body);

  @POST(_payMeCode)
  Future<HttpResponse<LoginModel>> payMeCode(@Body() PayMeCodeBody body);

  @GET(_technologies)
  Future<HttpResponse<List<TechnologyModel>>> technologies();

  @GET(_placeDetails)
  Future<HttpResponse<PlaceDetailsModel>> placeDetails(@Path('id') String id);
}
