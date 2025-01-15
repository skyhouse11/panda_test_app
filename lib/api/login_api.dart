import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_app/model/login_request_body.dart';
import 'package:test_app/model/user_model.dart';

part 'login_api.g.dart';

@riverpod
Future<UserModel> loginApi(Ref ref, LoginRequestBody body, Dio dio) async =>
    await dio
        .post(
          '/users',
          data: body.toJson(),
        )
        .then(
          (response) => UserModel.fromJson(response.data),
        )
        .onError<DioException>(
      (error, stackTrace) {
        throw Exception(error.response?.data['message']);
      },
    ).onError(
      (error, stackTrace) {
        throw Exception(error.toString());
      },
    );
