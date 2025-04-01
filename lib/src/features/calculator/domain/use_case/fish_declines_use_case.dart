import 'package:baliqchi/src/core/resources/data_state.dart';
import 'package:baliqchi/src/core/usecase/use_case.dart';
import 'package:baliqchi/src/features/calculator/data/models/fish_declines_model.dart';
import 'package:baliqchi/src/features/calculator/domain/repository/calculator_repository.dart';
import 'package:baliqchi/src/features/home/data/bodies/paging_body.dart';

class FishDeclinesUseCase
    implements UseCase<DataState<FishDeclinesModel>, PagingBody> {
  final CalculatorRepository _repository;

  FishDeclinesUseCase(this._repository);

  @override
  Future<DataState<FishDeclinesModel>> call(
          {required PagingBody params}) async =>
      await _repository.fishDeclines(params);
}
