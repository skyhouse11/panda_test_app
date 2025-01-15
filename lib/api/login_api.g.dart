// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_api.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginApiHash() => r'da2897538a92258b852f4d3c5ea348a5c16bf3fd';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [loginApi].
@ProviderFor(loginApi)
const loginApiProvider = LoginApiFamily();

/// See also [loginApi].
class LoginApiFamily extends Family<AsyncValue<UserModel>> {
  /// See also [loginApi].
  const LoginApiFamily();

  /// See also [loginApi].
  LoginApiProvider call(
    LoginRequestBody body,
    Dio dio,
  ) {
    return LoginApiProvider(
      body,
      dio,
    );
  }

  @override
  LoginApiProvider getProviderOverride(
    covariant LoginApiProvider provider,
  ) {
    return call(
      provider.body,
      provider.dio,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'loginApiProvider';
}

/// See also [loginApi].
class LoginApiProvider extends AutoDisposeFutureProvider<UserModel> {
  /// See also [loginApi].
  LoginApiProvider(
    LoginRequestBody body,
    Dio dio,
  ) : this._internal(
          (ref) => loginApi(
            ref as LoginApiRef,
            body,
            dio,
          ),
          from: loginApiProvider,
          name: r'loginApiProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$loginApiHash,
          dependencies: LoginApiFamily._dependencies,
          allTransitiveDependencies: LoginApiFamily._allTransitiveDependencies,
          body: body,
          dio: dio,
        );

  LoginApiProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.body,
    required this.dio,
  }) : super.internal();

  final LoginRequestBody body;
  final Dio dio;

  @override
  Override overrideWith(
    FutureOr<UserModel> Function(LoginApiRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LoginApiProvider._internal(
        (ref) => create(ref as LoginApiRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        body: body,
        dio: dio,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<UserModel> createElement() {
    return _LoginApiProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoginApiProvider && other.body == body && other.dio == dio;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, body.hashCode);
    hash = _SystemHash.combine(hash, dio.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LoginApiRef on AutoDisposeFutureProviderRef<UserModel> {
  /// The parameter `body` of this provider.
  LoginRequestBody get body;

  /// The parameter `dio` of this provider.
  Dio get dio;
}

class _LoginApiProviderElement
    extends AutoDisposeFutureProviderElement<UserModel> with LoginApiRef {
  _LoginApiProviderElement(super.provider);

  @override
  LoginRequestBody get body => (origin as LoginApiProvider).body;
  @override
  Dio get dio => (origin as LoginApiProvider).dio;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
