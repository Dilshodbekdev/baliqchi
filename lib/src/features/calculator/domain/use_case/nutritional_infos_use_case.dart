import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/calculator/data/models/nutritional_info_model.dart';
import 'package:baliqchi/src/features/calculator/domain/repository/calculator_repository.dart';

class NutritionalInfosUseCase implements UseCase<DataState<List<NutritionalInfoModel>>, String> {
  final CalculatorRepository _repository;

  NutritionalInfosUseCase(this._repository);

  @override
  Future<DataState<List<NutritionalInfoModel>>> call({required String params}) async =>
      await _repository.nutritionalInfos(params);
}
