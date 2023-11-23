// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messaging_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$messagingControllerHash() =>
    r'1d2598a36355be204e6964b2384c93e328bc407c';

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

abstract class _$MessagingController
    extends BuildlessAutoDisposeAsyncNotifier<List<Message>> {
  late final String chatId;

  FutureOr<List<Message>> build(
    String chatId,
  );
}

/// See also [MessagingController].
@ProviderFor(MessagingController)
const messagingControllerProvider = MessagingControllerFamily();

/// See also [MessagingController].
class MessagingControllerFamily extends Family<AsyncValue<List<Message>>> {
  /// See also [MessagingController].
  const MessagingControllerFamily();

  /// See also [MessagingController].
  MessagingControllerProvider call(
    String chatId,
  ) {
    return MessagingControllerProvider(
      chatId,
    );
  }

  @override
  MessagingControllerProvider getProviderOverride(
    covariant MessagingControllerProvider provider,
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
  String? get name => r'messagingControllerProvider';
}

/// See also [MessagingController].
class MessagingControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    MessagingController, List<Message>> {
  /// See also [MessagingController].
  MessagingControllerProvider(
    String chatId,
  ) : this._internal(
          () => MessagingController()..chatId = chatId,
          from: messagingControllerProvider,
          name: r'messagingControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$messagingControllerHash,
          dependencies: MessagingControllerFamily._dependencies,
          allTransitiveDependencies:
              MessagingControllerFamily._allTransitiveDependencies,
          chatId: chatId,
        );

  MessagingControllerProvider._internal(
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
  FutureOr<List<Message>> runNotifierBuild(
    covariant MessagingController notifier,
  ) {
    return notifier.build(
      chatId,
    );
  }

  @override
  Override overrideWith(MessagingController Function() create) {
    return ProviderOverride(
      origin: this,
      override: MessagingControllerProvider._internal(
        () => create()..chatId = chatId,
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
  AutoDisposeAsyncNotifierProviderElement<MessagingController, List<Message>>
      createElement() {
    return _MessagingControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MessagingControllerProvider && other.chatId == chatId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chatId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MessagingControllerRef
    on AutoDisposeAsyncNotifierProviderRef<List<Message>> {
  /// The parameter `chatId` of this provider.
  String get chatId;
}

class _MessagingControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<MessagingController,
        List<Message>> with MessagingControllerRef {
  _MessagingControllerProviderElement(super.provider);

  @override
  String get chatId => (origin as MessagingControllerProvider).chatId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
