import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kratos/features/shop/data/product_remote_datafetcher.dart';
import 'package:kratos/features/shop/domain/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_repository.g.dart';

class ProductRepository {
  final ProductRemoteDataFetcher _productRemoteDataFetcher;

  ProductRepository(
      {required ProductRemoteDataFetcher productRemoteDataFetcher})
      : _productRemoteDataFetcher = productRemoteDataFetcher;

  Future<List<Product>> getProducts() {
    return _productRemoteDataFetcher.fetchProducts();
  }
}

@riverpod
ProductRepository productRepository(Ref ref) {
  final remoteDataFetcher = ref.watch(productRemoteDataFetcherProvider);
  return ProductRepository(productRemoteDataFetcher: remoteDataFetcher);
}
