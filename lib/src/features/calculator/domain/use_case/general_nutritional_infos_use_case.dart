import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/calculator/data/models/general_nutritional_info_model.dart';
import 'package:baliqchi/src/features/calculator/domain/repository/calculator_repository.dart';
import 'package:baliqchi/src/features/home/data/bodies/paging_body.dart';

class GeneralNutritionalInfosUseCase
    implements UseCase<DataState<List<GeneralNutritionalInfoModel>>, PagingBody> {
  final CalculatorRepository _repository;

  GeneralNutritionalInfosUseCase(this._repository);

  @override
  Future<DataState<List<GeneralNutritionalInfoModel>>> call({required PagingBody params}) async =>
      await _repository.generalNutritionalInfos(params);
}
