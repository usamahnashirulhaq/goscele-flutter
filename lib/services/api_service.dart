import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:goscele/failures/failures.dart';
import 'package:goscele/models/responses/discussion_response.dart';
import 'package:goscele/models/responses/responses.dart';
import 'package:goscele/service_locator.dart';
import 'package:goscele/services/services.dart';
import 'package:goscele/utils/constants.dart';

/// Service to handle all API call requests.
class ApiService {
  static final _httpService = locator<HttpService>();
  static final _userDataService = locator<UserDataService>();

  /// Login to Moodle service. Returns either a [Failure] or a [LoginResponse].
  Future<Either<Failure, LoginResponse>> login(
    String username,
    String password,
  ) async {
    // Required params
    final params = {
      Constants.paramUsername: username,
      Constants.paramPassword: password,
    };

    // Response validator
    final Either<Failure, LoginResponse> Function(Response) validator = (r) {
      try {
        final loginResponse = loginResponseFromJson(r.data);
        if (loginResponse.token == null)
          return left(AuthFailure.invalidCredentials);
        else
          return right(loginResponse);
      } catch (_) {
        return left(AuthFailure.invalidCredentials);
      }
    };

    return await _apiRequestHelper<LoginResponse>(
      Constants.loginUrl,
      params,
      validator,
      usesServiceParam: true,
      usesToken: false,
      isGetRequest: false,
    );
  }

  /// Retrieves a user based on the [username]. Returns either a [Failure] or
  /// a [UserResponse].
  Future<Either<Failure, UserResponse>> getUserByField(String username) async {
    // Required params
    final params = {
      Constants.paramFunction: Constants.getUserByField,
      Constants.paramField: Constants.valueUsername,
      Constants.paramValues: [username],
    };

    // Response validator
    final Either<Failure, UserResponse> Function(Response) validator = (r) {
      try {
        final users = userResponseFromJson(r.data);
        if (users.isEmpty)
          return left(AuthFailure.userDoesNotExist);
        else
          return right(users.first);
      } catch (_) {
        return left(AuthFailure.userDoesNotExist);
      }
    };

    return await _apiRequestHelper<UserResponse>(
      Constants.webServiceUrl,
      params,
      validator,
    );
  }

  /// Retrieves a list of replies in academic announcements discussion. Returns either a [Failure] or
  /// a [ForumResponse].
  Future<Either<Failure, DiscussionResponse>> getAcademicAnnouncements() async {
    // Required params
    final params = {
      Constants.paramFunction: Constants.getForumById,
      Constants.paramValues: Constants.generalForumId
    };

    // Response validator
    final Either<Failure, DiscussionResponse> Function(Response) validator =
        (r) {
      try {
        final discussionResponse = DiscussionResponse.fromJson(r.data);
        if (discussionResponse.discussions.isEmpty)
          return left(NetworkFailure.emptyResponse);
        else
          return right(discussionResponse);
      } catch (_) {
        return left(NetworkFailure.emptyResponse);
      }
    };

    return await _apiRequestHelper<DiscussionResponse>(
      Constants.webServiceUrl,
      params,
      validator,
    );
  }

  /// Helper function to handle HTTP requests. Supplies additional params such
  /// as token, service type and response type. Any function that uses this
  /// helper must supply the [url] target, [params] required for the request,
  /// and a [validator] function to validate the successfully retrieved response.
  Future<Either<Failure, T>> _apiRequestHelper<T>(
    String url,
    Map<String, dynamic> params,
    Either<Failure, T> Function(Response) validator, {
    bool usesServiceParam = false,
    bool usesToken = true,
    bool isGetRequest = true,
  }) async {
    // Prepare additional params
    final Map<String, dynamic> cParams = {
      Constants.paramFormat: Constants.valueJsonFormat,
    };
    if (usesServiceParam)
      cParams.putIfAbsent(Constants.paramService, () => Constants.valueService);
    if (usesToken)
      cParams.putIfAbsent(Constants.paramToken, () => _userDataService.token);

    // Concatenate params
    final coreParams = {
      ...cParams,
      ...params,
    };

    // Perform requests and validate the response
    final response = isGetRequest
        ? await _httpService.getHttp(url, params: coreParams)
        : await _httpService.postHttp(url, params: coreParams);

    return response.fold<Either<Failure, T>>(
      (l) => left(l),
      (r) => validator(r),
    );
  }
}
