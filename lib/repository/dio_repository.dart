import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_repository.g.dart';

@riverpod
Dio getDio(Ref ref) => Dio(
      BaseOptions(
        baseUrl: 'http://localhost:3001',
        contentType: Headers.jsonContentType,
      ),
    );
