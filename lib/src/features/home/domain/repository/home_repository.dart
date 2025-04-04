import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/features/auth/data/models/login_model.dart';
import 'package:baliqchi/src/features/home/data/bodies/paging_body.dart';
import 'package:baliqchi/src/features/home/data/bodies/pay_me_card_body.dart';
import 'package:baliqchi/src/features/home/data/bodies/pay_me_code_body.dart';
import 'package:baliqchi/src/features/home/data/models/billing_model.dart';
import 'package:baliqchi/src/features/home/data/models/definition_model.dart';
import 'package:baliqchi/src/features/home/data/models/pay_me_card_model.dart';
import 'package:baliqchi/src/features/home/data/models/place_details_model.dart';
import 'package:baliqchi/src/features/home/data/models/places_model.dart';
import 'package:baliqchi/src/features/home/data/models/region_model.dart';
import 'package:baliqchi/src/features/home/data/models/technology_model.dart';

abstract class HomeRepository {
  Future<DataState<PlacesModel>> places(PagingBody body);

  Future<DataState<LoginModel>> me();

  Future<DataState<PayMeCardModel>> payMeCard(PayMeCardBody body);

  Future<DataState<LoginModel>> payMeCode(PayMeCodeBody body);

  Future<DataState<PlaceDetailsModel>> placeDetails(String id);

  Future<DataState<List<RegionModel>>> regions(String? search);

  Future<DataState<List<DefinitionModel>>> definitions();

  Future<DataState<List<BillingModel>>> billings();

  Future<DataState<List<TechnologyModel>>> technologies();
}
