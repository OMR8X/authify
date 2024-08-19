import 'package:auhtify/Features/auth/data/datasources/auth_remote_data_source_implements.dart';
import 'package:auhtify/Features/auth/data/responses/forget_password_response.dart';
import 'package:auhtify/Features/auth/data/responses/sign_in_response.dart';
import 'package:auhtify/Features/auth/domain/entites/user_data.dart';
import 'package:auhtify/Features/auth/domain/requests/change_password_request.dart';
import 'package:auhtify/Features/auth/domain/requests/forget_password_request.dart';
import 'package:auhtify/Features/auth/domain/requests/get_user_data_request.dart';
import 'package:auhtify/Features/auth/domain/requests/sign_in_request.dart';
import 'package:auhtify/Features/auth/domain/requests/sign_up_request.dart';
import 'package:auhtify/core/resources/errors/exceptions.dart';
import 'package:auhtify/core/services/api/api_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockApiManager extends Mock implements ApiManager {}

String? storedToken;

void main() {
  late AuthRemoteDataSourceImplements sut; // means System Under Test
  late MockApiManager mockApiManager;

  setUp(() async {
    mockApiManager = MockApiManager();
    sut = AuthRemoteDataSourceImplements(apiManager: ApiManager());
  });

  setUpAll(() {
    registerFallbackValue(
        SignUpRequest(name: '', email: '', password: '', keepLoggedIn: false));
    registerFallbackValue(
        SignInRequest(email: '', password: '', keepLoggedIn: false));
    registerFallbackValue(ChangePasswordRequest(code: '', password: ''));
    registerFallbackValue(ForgetPasswordRequest(email: ''));
    registerFallbackValue(GetUserDataRequest(token: ''));
  });
  answerWhen(
      {required Map<String, dynamic> data,
      required int statusCode,
      Map<String, dynamic> headers = const {}}) {
    when(() => mockApiManager().post(any(), headers: headers)).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(path: ''),
        statusCode: statusCode,
        data: data,
      ),
    );
  }

  //! SignUp Feature
  // group('SignUp Tests :', () {
  //   String numbers = "0123456789";
  //   Random random = Random();
  //   final successRequest = SignUpRequest(
  //     name: 'name',
  //     email: "testing.1000${String.fromCharCodes(Iterable.generate(4, (_) => numbers.codeUnitAt(random.nextInt(numbers.length))))}@gmail.com",
  //     password: '12345678',
  //     keepLoggedIn: true,
  //   );
  //   final existEmailRequest = SignUpRequest(name: 'name', email: 'testing.99@gmail.com', password: '12345678', keepLoggedIn: false);
  //   final emptyRequest = SignUpRequest(name: '', email: '', password: '', keepLoggedIn: false);

  //   test('Success test', () async {
  //     answerWhen(
  //       statusCode: 200,
  //       data: {
  //         "status": true,
  //         "message": "تم تسجيل الدخول بنجاح.",
  //         "data": {
  //           "token": "21|Vq4allxtVPIUrCddOX50ZQgaqmmpqwFuv5R73hEr58674d3b",
  //           "user": {
  //             "name": successRequest.name,
  //             "email": successRequest.email,
  //           },
  //         },
  //       },
  //     );
  //     final result = await sut.signUp(request: successRequest);
  //     expect(result, isA<SignUpResponse>());
  //     expect(result.user, isA<UserData>());
  //     expect(result.user.email, equals(successRequest.email));
  //     expect(result.user.name, equals(successRequest.name));
  //   });

  //   test('Fails when Email Already Exists', () async {
  //     answerWhen(
  //       statusCode: 401,
  //       data: {
  //         "status": false,
  //         "message": "خطا بالبيانات المدخلة",
  //         "errors": {
  //           "email": [
  //             "The email has already been taken.",
  //           ],
  //         },
  //       },
  //     );
  //     expect(
  //       () async => await sut.signUp(request: existEmailRequest),
  //       throwsA(isA<AuthException>()),
  //     );
  //   });

  //   test('Fails when Any Field is Empty', () {
  //     answerWhen(
  //       statusCode: 401,
  //       data: {
  //         "status": false,
  //         "message": "خطا بالبيانات المدخلة",
  //         "errors": {
  //           "name": [
  //             "The name field is required.",
  //           ],
  //           "email": [
  //             "The email field is required.",
  //           ],
  //           "password": [
  //             "The password field is required.",
  //           ],
  //         },
  //       },
  //     );
  //     expect(
  //       () async => await sut.signUp(request: emptyRequest),
  //       throwsA(isA<AuthException>()),
  //     );
  //   });
  // });

  //! SignIn Feature
  group('SignIn Tests :', () {
    final successRequest = SignInRequest(
        email: 'laeth2004alhalabe@gmail.com',
        password: '12345678',
        keepLoggedIn: true);
    final notExistEmailRequest = SignInRequest(
        email: 'NotExistEmail@gmail.com',
        password: '12345678',
        keepLoggedIn: false);
    final emptyRequest =
        SignInRequest(email: '', password: '', keepLoggedIn: false);
    test('Success test', () async {
      answerWhen(
        statusCode: 200,
        data: {
          "status": true,
          "message": "User Logged In Successfully",
          "data": {
            "token": "114|SsYjyChCYoy0KDKn4WOCDyBVx0YsQZRQXOEqJF1T2b66166e",
            "user": {
              "name": "Laith Alhalabi",
              "email": "laeth2004alhalabe@gmail.com",
              "email_verified_at": null
            }
          }
        },
      );
      final result = await sut.signIn(request: successRequest);
      expect(result, isA<SignInResponse>());
      storedToken = result.token;
      expect(result.user, isA<UserData>());
      expect(result.user.email, equals(successRequest.email));
    });
    test('Fails when Email Does Not Exist', () {
      answerWhen(
        statusCode: 401,
        data: {
          "status": false,
          "message": "validation error",
          "errors": {
            "email": ["The selected email is invalid."]
          }
        },
      );
      expect(
        () async => sut.signIn(request: notExistEmailRequest),
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

  //! Forget Password Feature
  group('Forget Password Tests :', () {
    final request = ForgetPasswordRequest(email: 'laeth2004alhalabe@gmail.com');
    final emailNotExistRequest =
        ForgetPasswordRequest(email: 'testing.000@gmail.com');
    final notEmailRequest = ForgetPasswordRequest(email: 'any Shit');
    final emptyRequest = ForgetPasswordRequest(email: '');
    test('success test', () async {
      // TEST 1
      answerWhen(
        statusCode: 200,
        data: {"status": true, "message": "تم ارسال رمز اعادة التعيين بنجاح"},
      );
      final result = await sut.forgetPassword(request: request);
      expect(result, isA<ForgetPasswordResponse>());
    });
    test('waiting at least 1 min test', () async {
      // TEST 2
      answerWhen(
        statusCode: 429,
        data: {
          "status": false,
          "message": "wait couple minutes before sending new request."
        },
      );
      expect(
        () async => sut.forgetPassword(request: request),
        throwsA(isA<AuthException>()),
      );
    });
    test('not email test', () {
      // TEST 3
      answerWhen(
        statusCode: 401,
        data: {
          "status": false,
          "message": "خطا بالبيانات المدخلة",
          "errors": {
            "email": ["The email field must be a valid email address."]
          }
        },
      );
      expect(
        () async => sut.forgetPassword(request: notEmailRequest),
        throwsA(isA<AuthException>()),
      );
    });
    test('email not exist test', () {
      // TEST 3
      answerWhen(
        statusCode: 401,
        data: {
          "status": false,
          "message": "validation error",
          "errors": {
            "email": ["The email field must be a valid email address."]
          }
        },
      );
      expect(
        () async => sut.forgetPassword(request: emailNotExistRequest),
        throwsA(isA<AuthException>()),
      );
    });
    test('empty field test', () {
      // TEST 4
      answerWhen(
        statusCode: 401,
        data: {
          "status": false,
          "message": "خطا بالبيانات المدخلة",
          "errors": {
            "email": ["The email field is required."]
          }
        },
      );
      expect(
        () async => sut.forgetPassword(request: emptyRequest),
        throwsA(isA<AuthException>()),
      );
    });
  });

  //! Change Password Feature
  group('Change Password Tests :', () {
    final codeNotMathedRequest =
        ChangePasswordRequest(code: '######', password: '12345678');
    final codeIsNotIntegerRequest =
        ChangePasswordRequest(code: '######', password: '12345678');
    final newPasswordLessThan8CharactersRequest =
        ChangePasswordRequest(code: '123456', password: '12345');
    final emptyRequest = ChangePasswordRequest(code: '', password: '');
    test('code not matched test', () {
      // TEST 2
      answerWhen(
        statusCode: 400,
        data: {"status": false, "message": "Invalid reset code."},
      );
      expect(
        () async => await sut.changePassword(request: codeNotMathedRequest),
        throwsA(isA<AuthException>()),
      );
    });
    test('code is not integer test', () {
      // TEST 2
      answerWhen(
        statusCode: 400,
        data: {
          "status": false,
          "message": "خطا بالبيانات المدخلة",
          "errors": {
            "code": ["The code field must be an integer."]
          }
        },
      );
      expect(
        () async => await sut.changePassword(request: codeIsNotIntegerRequest),
        throwsA(isA<AuthException>()),
      );
    });
    test('new password is less than 8 characters test', () {
      // TEST 2
      answerWhen(
        statusCode: 401,
        data: {
          "status": false,
          "message": "خطا بالبيانات المدخلة",
          "errors": {
            "password": ["The password field must be at least 8 characters."]
          }
        },
      );
      expect(
        () async => await sut.changePassword(
            request: newPasswordLessThan8CharactersRequest),
        throwsA(isA<AuthException>()),
      );
    });
    test('empty field test', () {
      // TEST 3
      answerWhen(
        statusCode: 400,
        data: {
          "status": false,
          "message": "خطا بالبيانات المدخلة",
          "errors": {
            "code": ["The code field is required."],
            "password": ["The password field is required."]
          }
        },
      );
      expect(
        () async => await sut.changePassword(request: emptyRequest),
        throwsA(isA<AuthException>()),
      );
    });
  });
}


/*
//! Get User Data Feature
  group("get user data Tests :", () {
    final request = GetUserDataRequest(token: storedToken ?? "");
    final emptyRequest = GetUserDataRequest(token: "");
    test('success test', () async {
      answerWhen(
        data: {
          "status": true,
          "message": "",
          "data": {
            "token": "115|tTk3JzD6pe5EmjLUk4zawlNKkVZ67s3WCnGhlsJL0289082c",
            "user": {"name": "Laith Alhalabi", "email": "laeth2004alhalabe@gmail.com", "email_verified_at": null}
          }
        },
        statusCode: 200,
      );
      final result = await sut.getUserData(request: request);
      expect(result, isA<GetUserDataResponse>());
      expect(result.user, isA<UserData>());
      expect(result.user.email, equals("laeth2004alhalabe@gmail.com"));
    });
    test('empty field test', () async {
      answerWhen(
        data: {"message": "Unauthenticated."},
        statusCode: 401,
      );
      final result = await sut.getUserData(request: emptyRequest);
      expect(
        result,
        isA<GetUserDataResponse>(),
      );
    });
  });

group('signOut Tests :', () {
    print("++++++++++ $storedToken ++++++++++");
    final request = SignOutRequest(token: storedToken ?? "");
    test('success Test', () async {
      expect(storedToken, isNotNull, reason: "Token must be set after SignIn.");

      answerWhen(
        headers: {
          ApiHeaders.headerAuthorizationKey: "${ApiHeaders.headerAuthorizationBarer} $storedToken",
        },
        data: {"status": true, "message": "User Logged Out Successfully"},
        statusCode: 200,
      );
      final result = await sut.signOut(request: request);
      expect(result, isA<SignOutResponse>());
    });
  });
*/