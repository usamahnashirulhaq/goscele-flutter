import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:goscele/failures/failure.dart';
import 'package:goscele/failures/network_failure.dart';
import 'package:goscele/service_locator.dart';
import 'package:goscele/services/connectivity_service.dart';

/// Service to handle HTTP requests. Uses Dio to perform requests.
class HttpService {
  static final _connectivityService = locator<ConnectivityService>();
  static final options = BaseOptions(
    responseType: ResponseType.plain,
    connectTimeout: 10000,
    receiveTimeout: 10000,
    sendTimeout: 10000,
  );
  final _dio = new Dio(options);

  Future<Either<Failure, Response>> getHttp(
    String url, {
    Map<String, dynamic> params,
  }) async {
    return await _httpRequest(() => _dio.get(url, queryParameters: params));
  }

  Future<Either<Failure, Response>> postHttp(
    String url, {
    Map<String, dynamic> params,
  }) async {
    return await _httpRequest(() => _dio.post(url, queryParameters: params));
  }

  /// Helper function to handle errors for HTTP requests.
  Future<Either<Failure, Response>> _httpRequest(
    Future<Response> Function() request,
  ) async {
    try {
      // Check if the app is connected to the internet
      final isConnected = await _connectivityService.isInternetAvailable();
      if (!isConnected) return left(NetworkFailure.noConnection);

      final response = await request.call();
      return right(response);
    } on DioError catch (e) {
      final isTimeout = e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT ||
          e.type == DioErrorType.SEND_TIMEOUT;

      if (isTimeout)
        return left(NetworkFailure.connectionTimeout);
      else if (e.type == DioErrorType.CANCEL)
        return left(NetworkFailure.cancelled);
      else if (e.type == DioErrorType.RESPONSE)
        return left(NetworkFailure.responseFailure(e.response.statusCode));
      else
        return left(NetworkFailure.noConnection);
    }
  }
}
