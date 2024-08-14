// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:auhtify/Features/auth/data/datasources/auth_remote_data_source_implements.dart';
import 'package:auhtify/Features/auth/domain/requests/sign_up_request.dart';
import 'package:auhtify/core/resources/errors/exceptions.dart';
import 'package:auhtify/core/services/api/api_client.dart';

void main() async {
  //
  final client = DioClient();
  //
  final dataSource = AuthRemoteDataSourceImplements(client: client);
  //
  try {
    await dataSource.signUp(
      request: SignUpRequest(
        name: "name",
        email: "testing.6@gmail.com",
        password: "12345678",
      ),
    );
  } on Exception catch (e) {}
}
