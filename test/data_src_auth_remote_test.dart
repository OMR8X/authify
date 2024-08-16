import 'dart:math';

import 'package:auhtify/Features/auth/data/datasources/auth_remote_data_source_implements.dart';
import 'package:auhtify/Features/auth/data/models/user_data_model.dart';
import 'package:auhtify/Features/auth/domain/requests/sign_in_request.dart';
import 'package:auhtify/Features/auth/domain/requests/sign_up_request.dart';
import 'package:auhtify/core/resources/errors/exceptions.dart';
import 'package:auhtify/core/services/api/api_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDioClient extends Mock implements DioClient {}

void main() {
  late AuthRemoteDataSourceImplements sut; // means System Under Test
  late MockDioClient mockDioClient;

  setUp(() {
    mockDioClient = MockDioClient();
    sut = AuthRemoteDataSourceImplements(client: mockDioClient);
  });

  setUpAll(() {
    registerFallbackValue(SignUpRequest(name: '', email: '', password: ''));
    registerFallbackValue(SignInRequest(email: '', password: ''));
  });
  answerWhen({required Map<String, dynamic> data, required int statusCode}) {
    when(() => mockDioClient.post(any(), any())).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(path: ''),
        statusCode: statusCode,
        data: data,
      ),
    );
  }

  group('SignUp Tests :', () {
    String numbers = "0123456789";
    Random random = Random();
    final successRequest = SignUpRequest(
      name: 'name',
      email: "testing.1000${String.fromCharCodes(Iterable.generate(4, (_) => numbers.codeUnitAt(random.nextInt(numbers.length))))}@gmail.com",
      password: '12345678',
    );
    final existEmailRequest = SignUpRequest(name: 'name', email: 'testing.99@gmail.com', password: '12345678');
    final emptyRequest = SignUpRequest(name: '', email: '', password: '');

    test('Success test', () async {
      answerWhen(
        statusCode: 200,
        data: {
          "status": true,
          "message": "تم تسجيل الدخول بنجاح.",
          "data": {
            "token": "21|Vq4allxtVPIUrCddOX50ZQgaqmmpqwFuv5R73hEr58674d3b",
            "user": {
              "name": successRequest.name,
              "email": successRequest.email,
            },
          },
        },
      );
      final result = await sut.signUp(request: successRequest);
      expect(result, isA<UserDataModel>());
      expect(result.name, equals(successRequest.name));
      expect(result.email, equals(successRequest.email));
    });

    test('Fails when Email Already Exists', () async {
      answerWhen(
        statusCode: 401,
        data: {
          "status": false,
          "message": "خطا بالبيانات المدخلة",
          "errors": {
            "email": [
              "The email has already been taken.",
            ],
          },
        },
      );
      expect(
        () async => await sut.signUp(request: existEmailRequest),
        throwsA(isA<AuthException>()),
      );
    });

    test('Fails when Any Field is Empty', () {
      answerWhen(
        statusCode: 401,
        data: {
          "status": false,
          "message": "خطا بالبيانات المدخلة",
          "errors": {
            "name": [
              "The name field is required.",
            ],
            "email": [
              "The email field is required.",
            ],
            "password": [
              "The password field is required.",
            ],
          },
        },
      );
      expect(
        () async => await sut.signUp(request: emptyRequest),
        throwsA(isA<AuthException>()),
      );
    });
  });

  group('SignIn Tests :', () {
    final successRequest = SignInRequest(email: 'testing.99@gmail.com', password: '12345678');
    final notExistEmailRequest = SignInRequest(email: 'NotExistEmail@gmail.com', password: '12345678');
    final emptyRequest = SignInRequest(email: '', password: '');
    test('Success test', () async {
      answerWhen(
        statusCode: 200,
        data: {
          "status": true,
          "message": "User Logged In Successfully",
          "data": {
            "token": "22|zkU9MqRDQtbUBLlKpQu46JcjoXzkUmL0pZkR66YF05f20c37",
            "user": {"name": "name", "email": successRequest.email, "email_verified_at": null},
          },
        },
      );
      final result = await sut.signIn(request: successRequest);
      expect(result, isA<UserDataModel>());
      expect(result.email, equals(successRequest.email));
    });
    test('Fails when Email Does Not Exist', () {
      answerWhen(
        statusCode: 401,
        data: {"status": false, "message": "Email & Password does not match with our record."},
      );
      expect(
        () async => sut.signIn(request: notExistEmailRequest),
        throwsA(isA<ServerException>()),
      );
    });

    test('Fails when Any Field is Empty', () {
      answerWhen(
        statusCode: 401,
        data: {
          "status": false,
          "message": "خطا بالبيانات المدخلة",
          "errors": {
            "email": ["The email field is required."],
            "password": ["The password field is required."],
          },
        },
      );
      expect(
        () async => sut.signIn(request: emptyRequest),
        throwsA(isA<AuthException>()),
      );
    });
  });
}
