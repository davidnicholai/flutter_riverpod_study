import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kratos/features/shop/data/product_local_repository.dart';
import 'package:kratos/features/shop/data/product_remote_repository.dart';
import 'package:kratos/features/shop/domain/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_service.g.dart';

class ProductService {
  final ProductLocalRepository _productLocalRepository;
  final ProductRemoteRepository _productRemoteRepository;

  const ProductService(
      {required ProductLocalRepository productLocalRepository,
      required ProductRemoteRepository productRemoteRepository})
      : _productLocalRepository = productLocalRepository,
        _productRemoteRepository = productRemoteRepository;

  Future<List<Product>> getProducts({bool fromCache = true}) async {
    if (fromCache) {
      return _productLocalRepository.getProducts();
    }

    final products = await _productRemoteRepository.getProducts();
    await _productLocalRepository.storeProducts(products);

    return products;
  }
}

@riverpod
ProductService productService(Ref ref) {
  final productLocalRepository = ref.watch(productLocalRepositoryProvider);
  final productRemoteRepository = ref.watch(productRemoteRepositoryProvider);

  return ProductService(
      productLocalRepository: productLocalRepository,
      productRemoteRepository: productRemoteRepository);
}
