// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_remote_datafetcher.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchProductsHash() => r'bcd95f877c4d21057d7c0f715732ef04dbb5a891';

/// Fetches the list of products from the remote server.
///
/// Throws:
/// - [Exception] A random exception.
///
/// Copied from [fetchProducts].
@ProviderFor(fetchProducts)
final fetchProductsProvider = AutoDisposeFutureProvider<List<Product>>.internal(
  fetchProducts,
  name: r'fetchProductsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchProductsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FetchProductsRef = AutoDisposeFutureProviderRef<List<Product>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
