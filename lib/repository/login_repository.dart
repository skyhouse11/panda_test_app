import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_app/api/login_api.dart';
import 'package:test_app/model/login_request_body.dart';
import 'package:test_app/model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:test_app/repository/dio_repository.dart';

part 'login_repository.g.dart';

enum LoginState {
  initial,
  loading,
  success,
  error,
}

@Riverpod(keepAlive: true)
class LoginRepository extends _$LoginRepository {
  late final Dio _dio = ref.watch(getDioProvider);

  late UserModel _userModel;

  UserModel get userModel => _userModel;

  @override
  LoginState build() {
    return LoginState.initial;
  }

  Future<void> login(LoginRequestBody body) async {
    state = LoginState.loading;

    try {
      final result = await ref.read(loginApiProvider(body, _dio).future);

      _userModel = result;

      state = LoginState.success;
    } catch (e) {
      state = LoginState.error;
      throw Exception(e.toString());
    }
  }
}
