import 'package:baliqchi/src/features/diseases/data/models/diseases_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'diseases_api_service.g.dart';

@RestApi()
abstract class DiseasesApiService {
  factory DiseasesApiService(Dio dio, {String baseUrl}) = _DiseasesApiService;

  /// URLS
  static const String _diseases = 'api/v1/diseases/all';
  static const String _disease = 'api/v1/diseases/{id}';

  /// REQUESTS
  @GET(_diseases)
  Future<HttpResponse<DiseasesModel>> diseases(
    @Query('page') int page,
    @Query('size') int size,
    @Query('search') String? search,
  );

  @GET(_disease)
  Future<HttpResponse<DiseaseModel>> disease(
    @Path('id') String id,
  );
}
