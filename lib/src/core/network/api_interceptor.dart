import 'package:baliqchi/src/core/router/app_routes.dart';
import 'package:baliqchi/src/core/router/route_config.dart';
import 'package:baliqchi/src/core/services/services.dart';
import 'package:baliqchi/src/core/util/app_constants.dart';
import 'package:go_router/go_router.dart';
import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    String token = await Prefs.getString(AppConstants.kAccessToken) ?? "";
    if (token.isNotEmpty) {
      options.headers["Authorization"] = 'Bearer $token';
    }
    LogService.request(options);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    LogService.response(response);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 403) {
      rootNavigator.currentContext?.goNamed(AppRoutes.login.name);
    }
    LogService.errorResponse(err);
    super.onError(err, handler);
  }
}
