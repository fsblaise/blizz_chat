// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messaging_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$messagingRepositoryHash() =>
    r'a7fa46929250512b7de00002a391fb4900594839';

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

/// See also [messagingRepository].
@ProviderFor(messagingRepository)
const messagingRepositoryProvider = MessagingRepositoryFamily();

/// See also [messagingRepository].
class MessagingRepositoryFamily extends Family<MessagingRepository> {
  /// See also [messagingRepository].
  const MessagingRepositoryFamily();

  /// See also [messagingRepository].
  MessagingRepositoryProvider call(
    String chatId,
  ) {
    return MessagingRepositoryProvider(
      chatId,
    );
  }

  @override
  MessagingRepositoryProvider getProviderOverride(
    covariant MessagingRepositoryProvider provider,
  ) {
    return call(
      provider.chatId,
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
  String? get name => r'messagingRepositoryProvider';
}

/// See also [messagingRepository].
class MessagingRepositoryProvider
    extends AutoDisposeProvider<MessagingRepository> {
  /// See also [messagingRepository].
  MessagingRepositoryProvider(
    String chatId,
  ) : this._internal(
          (ref) => messagingRepository(
            ref as MessagingRepositoryRef,
            chatId,
          ),
          from: messagingRepositoryProvider,
          name: r'messagingRepositoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$messagingRepositoryHash,
          dependencies: MessagingRepositoryFamily._dependencies,
          allTransitiveDependencies:
              MessagingRepositoryFamily._allTransitiveDependencies,
          chatId: chatId,
        );

  MessagingRepositoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.chatId,
  }) : super.internal();

  final String chatId;

  @override
  Override overrideWith(
    MessagingRepository Function(MessagingRepositoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MessagingRepositoryProvider._internal(
        (ref) => create(ref as MessagingRepositoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        chatId: chatId,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<MessagingRepository> createElement() {
    return _MessagingRepositoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MessagingRepositoryProvider && other.chatId == chatId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chatId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MessagingRepositoryRef on AutoDisposeProviderRef<MessagingRepository> {
  /// The parameter `chatId` of this provider.
  String get chatId;
}

class _MessagingRepositoryProviderElement
    extends AutoDisposeProviderElement<MessagingRepository>
    with MessagingRepositoryRef {
  _MessagingRepositoryProviderElement(super.provider);

  @override
  String get chatId => (origin as MessagingRepositoryProvider).chatId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
