// import 'package:auhtify/core/services/api/api_constants.dart';
// import 'package:dio/dio.dart';

// abstract class ApiClient {
//   /// get request
//   Future<dynamic> get(
//     String uri, {
//     bool sendAuth = false,
//     Map<String, dynamic>? headers,
//     Map<String, dynamic> params = const {},
//   });

//   /// post request
//   Future<dynamic> post(
//     String uri,
//     dynamic body, {
//     bool sendAuth = false,
//     Map<String, dynamic>? headers,
//     Map<String, dynamic> params = const {},
//   });

//   /// update request
//   Future<dynamic> put(
//     String uri,
//     dynamic body, {
//     bool sendAuth = false,
//     Map<String, dynamic>? headers,
//     Map<String, dynamic> params = const {},
//   });

//   /// delete request
//   Future<dynamic> delete(
//     String uri,
//     dynamic body, {
//     bool sendAuth = false,
//     Map<String, dynamic>? headers,
//     Map<String, dynamic> params = const {},
//   });
// }

// class DioClient implements ApiClient {
//   //
//   late final Map<String, String> defaultHeaders;
//   //
//   late final BaseOptions options;

//   DioClient() {
//     //
//     defaultHeaders = {
//       ApiHeaders.headerContentTypeKey: ApiHeaders.headerValueApplicationJson,
//       ApiHeaders.headerAcceptKey: ApiHeaders.headerValueApplicationJson,
//     };
//     //
//     options = BaseOptions(
//       baseUrl: ApiSettings.baseUrl,
//       headers: defaultHeaders,
//       receiveTimeout: const Duration(seconds: ApiSettings.timeOut),
//       sendTimeout: const Duration(seconds: ApiSettings.timeOut),
//       connectTimeout: const Duration(seconds: ApiSettings.timeOut),
//     );
//   }

//   /// get request
//   @override
//   Future<dynamic> get(
//     String uri, {
//     bool sendAuth = AppConstant.boolFalse,
//     Map<String, dynamic>? headers,
//     Map<String, dynamic> params = AppConstant.emptyStrMap,
//   }) async {
//     final Dio dio = _initDio(sendAuth, headers, params);
//     try {
//       final res = await dio.get(uri);

//       return res;
//     } catch (e) {
//       throw ServerException(_errorHandler.serverError(error: e));
//     }
//   }

//   /// post request
//   @override
//   Future<dynamic> post(
//     String uri,
//     dynamic body, {
//     bool sendAuth = AppConstant.boolFalse,
//     Map<String, dynamic>? headers,
//     Map<String, dynamic> params = AppConstant.emptyStrMap,
//   }) async {
//     final Dio dio = _initDio(sendAuth, headers, params);

//     try {
//       final res = await dio.post(uri, data: body);

//       return res;
//     } catch (e) {
//       throw ServerException(_errorHandler.serverError(error: e));
//     }
//   }

//   /// update request
//   @override
//   Future<dynamic> put(
//     String uri,
//     dynamic body, {
//     bool sendAuth = AppConstant.boolFalse,
//     Map<String, dynamic>? headers,
//     Map<String, dynamic> params = AppConstant.emptyStrMap,
//   }) async {
//     final Dio dio = _initDio(sendAuth, headers, params);

//     try {
//       final res = await dio.put(uri, data: body);

//       return res;
//     } catch (e) {
//       throw ServerException(_errorHandler.serverError(error: e));
//     }
//   }

//   /// delete request
//   @override
//   Future<dynamic> delete(
//     String uri,
//     dynamic body, {
//     bool sendAuth = AppConstant.boolFalse,
//     Map<String, dynamic>? headers,
//     Map<String, dynamic> params = AppConstant.emptyStrMap,
//   }) async {
//     final Dio dio = _initDio(sendAuth, headers, params);

//     try {
//       final res = await dio.delete(uri, data: body);

//       return res;
//     } catch (e) {
//       throw ServerException(_errorHandler.serverError(error: e));
//     }
//   }

//   /// init dio instance
//   Dio _initDio(
//     bool sendAuth,
//     Map<String, dynamic>? headers,
//     Map<String, dynamic> params,
//   ) {
//     //
//     final Dio dio = _dioFactory();
//     // add default headers
//     if (headers == null) {
//       options.headers = defaultHeaders;
//     } else {
//       /// replace default headers by passed one
//       options.headers = headers;
//     }

//     /// set passed parameters
//     options.queryParameters = params;

//     dio.options = options;

//     return dio;
//   }
// }
