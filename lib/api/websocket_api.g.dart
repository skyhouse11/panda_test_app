// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'websocket_api.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$connectSocketHash() => r'adae6c7e9beb8f901f15a968f0e8d0fead4c9ccd';

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

/// See also [connectSocket].
@ProviderFor(connectSocket)
const connectSocketProvider = ConnectSocketFamily();

/// See also [connectSocket].
class ConnectSocketFamily extends Family<AsyncValue<WebSocket>> {
  /// See also [connectSocket].
  const ConnectSocketFamily();

  /// See also [connectSocket].
  ConnectSocketProvider call(
    String url,
  ) {
    return ConnectSocketProvider(
      url,
    );
  }

  @override
  ConnectSocketProvider getProviderOverride(
    covariant ConnectSocketProvider provider,
  ) {
    return call(
      provider.url,
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
  String? get name => r'connectSocketProvider';
}

/// See also [connectSocket].
class ConnectSocketProvider extends AutoDisposeFutureProvider<WebSocket> {
  /// See also [connectSocket].
  ConnectSocketProvider(
    String url,
  ) : this._internal(
          (ref) => connectSocket(
            ref as ConnectSocketRef,
            url,
          ),
          from: connectSocketProvider,
          name: r'connectSocketProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$connectSocketHash,
          dependencies: ConnectSocketFamily._dependencies,
          allTransitiveDependencies:
              ConnectSocketFamily._allTransitiveDependencies,
          url: url,
        );

  ConnectSocketProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.url,
  }) : super.internal();

  final String url;

  @override
  Override overrideWith(
    FutureOr<WebSocket> Function(ConnectSocketRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ConnectSocketProvider._internal(
        (ref) => create(ref as ConnectSocketRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        url: url,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<WebSocket> createElement() {
    return _ConnectSocketProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ConnectSocketProvider && other.url == url;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, url.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ConnectSocketRef on AutoDisposeFutureProviderRef<WebSocket> {
  /// The parameter `url` of this provider.
  String get url;
}

class _ConnectSocketProviderElement
    extends AutoDisposeFutureProviderElement<WebSocket> with ConnectSocketRef {
  _ConnectSocketProviderElement(super.provider);

  @override
  String get url => (origin as ConnectSocketProvider).url;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
