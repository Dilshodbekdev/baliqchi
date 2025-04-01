import 'package:baliqchi/src/core/resources/base_repository.dart';
import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/features/auth/data/models/login_model.dart';
import 'package:baliqchi/src/features/home/data/bodies/paging_body.dart';
import 'package:baliqchi/src/features/home/data/bodies/pay_me_card_body.dart';
import 'package:baliqchi/src/features/home/data/bodies/pay_me_code_body.dart';
import 'package:baliqchi/src/features/home/data/data_source/home_api_service.dart';
import 'package:baliqchi/src/features/home/data/models/billing_model.dart';
import 'package:baliqchi/src/features/home/data/models/definition_model.dart';
import 'package:baliqchi/src/features/home/data/models/pay_me_card_model.dart';
import 'package:baliqchi/src/features/home/data/models/place_details_model.dart';
import 'package:baliqchi/src/features/home/data/models/places_model.dart';
import 'package:baliqchi/src/features/home/data/models/region_model.dart';
import 'package:baliqchi/src/features/home/data/models/technology_model.dart';
import 'package:baliqchi/src/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl with BaseRepository implements HomeRepository {
  final HomeApiService _apiService;

  HomeRepositoryImpl(this._apiService);

  @override
  Future<DataState<PlacesModel>> places(PagingBody body) async =>
      await handleResponse(
          response: _apiService.places(
        body.page ?? 0,
        body.pageSize ?? 10,
        body.regionId,
        body.search,
      ));

  @override
  Future<DataState<List<RegionModel>>> regions(String? search) async =>
      await handleResponse(response: _apiService.regions(search));

  @override
  Future<DataState<PlaceDetailsModel>> placeDetails(String id) async =>
      await handleResponse(response: _apiService.placeDetails(id));

  @override
  Future<DataState<List<TechnologyModel>>> technologies() async =>
      await handleResponse(response: _apiService.technologies());

  @override
  Future<DataState<List<DefinitionModel>>> definitions() async =>
      await handleResponse(response: _apiService.definitions());

  @override
  Future<DataState<List<BillingModel>>> billings() async =>
      await handleResponse(response: _apiService.billings());

  @override
  Future<DataState<PayMeCardModel>> payMeCard(PayMeCardBody body) async =>
      await handleResponse(response: _apiService.payMeCard(body));

  @override
  Future<DataState<LoginModel>> payMeCode(PayMeCodeBody body) async =>
      await handleResponse(response: _apiService.payMeCode(body));

  @override
  Future<DataState<LoginModel>> me() async =>
      await handleResponse(response: _apiService.me());
}
