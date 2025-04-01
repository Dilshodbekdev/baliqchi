import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/home/data/bodies/pay_me_card_body.dart';
import 'package:baliqchi/src/features/home/data/models/pay_me_card_model.dart';
import 'package:baliqchi/src/features/home/domain/repository/home_repository.dart';

class PayMeCardUseCase
    implements UseCase<DataState<PayMeCardModel>, PayMeCardBody> {
  final HomeRepository _repository;

  PayMeCardUseCase(this._repository);

  @override
  Future<DataState<PayMeCardModel>> call(
          {required PayMeCardBody params}) async =>
      await _repository.payMeCard(params);
}
