import 'package:auhtify/core/services/api/api_constants.dart';
import 'package:auhtify/core/services/api/dio_factory.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class ApiClient {
  /// get request
  Future<dynamic> get(
    String uri, {
    bool requireAuth = false,
    Map<String, dynamic>? headers,
    Map<String, dynamic> queryParameters = const {},
  });

  /// post request
  Future<dynamic> post(
    String uri,
    Object? body, {
    bool requireAuth = false,
    Map<String, dynamic>? headers,
    Map<String, dynamic> queryParameters = const {},
  });

  /// update request
  Future<dynamic> put(
    String uri,
    Object? body, {
    bool requireAuth = false,
    Map<String, dynamic>? headers,
    Map<String, dynamic> queryParameters = const {},
  });

  /// delete request
  Future<dynamic> delete(
    String uri,
    Object? body, {
    bool requireAuth = false,
    Map<String, dynamic>? headers,
    Map<String, dynamic> queryParameters = const {},
  });
}

class DioClient implements ApiClient {
  //
  late final DioFactory _dioFactory;
  late final Map<String, String> defaultHeaders;
  late final BaseOptions options;
  //
  DioClient() {
    //
    _dioFactory = DioFactory();
    //
    defaultHeaders = {
      ApiHeaders.headerContentTypeKey: ApiHeaders.headerContentTypeJson,
      ApiHeaders.headerAcceptKey: ApiHeaders.headerContentTypeJson,
    };
    //
    options = BaseOptions(
      headers: defaultHeaders,
      baseUrl: ApiSettings.baseUrl,
      receiveTimeout: const Duration(seconds: ApiSettings.receiveTimeout),
      sendTimeout: const Duration(seconds: ApiSettings.sendTimeout),
      connectTimeout: const Duration(seconds: ApiSettings.connectTimeout),
      validateStatus: (status) {
        return true;
      },
    );
  }
  //
  @override
  Future<Response> get(
    String uri, {
    bool requireAuth = false,
    Map<String, dynamic>? headers,
    Map<String, dynamic> queryParameters = const {},
  }) async {
    final dio = _getDio(requireAuth, headers, queryParameters);
    final response = await dio.get(uri);
    return response;
  }

  @override
  Future<Response> post(
    String uri,
    Object? body, {
    bool requireAuth = false,
    Map<String, dynamic>? headers,
    Map<String, dynamic> queryParameters = const {},
  }) async {
    final dio = _getDio(requireAuth, headers, queryParameters);
    final response = await dio.post(uri, data: body);
    return response;
  }

  @override
  Future<Response> put(
    String uri,
    Object? body, {
    bool requireAuth = false,
    Map<String, dynamic>? headers,
    Map<String, dynamic> queryParameters = const {},
  }) async {
    final dio = _getDio(requireAuth, headers, queryParameters);
    final response = await dio.put(uri, data: body);
    return response;
  }

  @override
  Future<Response> delete(
    String uri,
    Object? body, {
    bool requireAuth = false,
    Map<String, dynamic>? headers,
    Map<String, dynamic> queryParameters = const {},
  }) async {
    final dio = _getDio(requireAuth, headers, queryParameters);
    final response = await dio.delete(uri, data: body);
    return response;
  }

  Dio _getDio(
    bool sendAuth,
    Map<String, dynamic>? headers,
    Map<String, dynamic> params,
  ) {
    //
    final Dio dio = _dioFactory();
    //
    options.headers = headers ?? defaultHeaders;
    // set passed parameters
    options.queryParameters = params;
    //
    dio.options = options;
    //
    return dio;
  }
}
