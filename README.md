# kratos

This is an experiment of mine so I can understand how Riverpod works when it comes to:

1. Caching (notably when the FutureProvider throws an exception)
2. Displaying the loading indicator when a provider is invalidated

## What I've learned

### Learning 1
**If my FutureProvider i.e. Future<List<Product>> fetchProducts from the "data fetcher" layer throws an exception, Riverpod will indefinitely cache this exception**. If I invalidate the controller that uses it, the invalidation does not propagate, hence fetchProducts will always return an error. The solution to this is to treat Repositories and Data Fetchers with the same way as BLoC, as classes.

Bad, because if fetchProducts throws an exception it will stay like that indefinitely.
```
// product_remote_datafetcher.dart
Future<List<Product>> fetchProducts(Ref ref) async {
    final dio = ref.watch(dioProvider);
    final response = await dio.get('/products');
    final products = <parse JSON into a List<Product>>
    return products;
}

// product_repository.dart
Future<List<Product>> getProducts(Ref ref) async {
    // Just act as a pass thru because there's nothing to transform here
    return await ref.watch(fetchProductsProvider.future);
}
```

Good
```
// product_remote_datafetcher.dart
class ProductRemoteDataFetcher {
    final Dio _dio;

    const ProductRemoteDataFetcher({required Dio dio}) : _dio = dio;

    Future<List<Product>> getProducts() async {
        final response = await _dio.get('/products');
        final products = <parse JSON into a List<Product>>
        return products;
    }
}

@riverpod
ProductRemoteDataFetcher productRemoteDataFetcher(Ref ref) {
  return const ProductRemoteDataFetcher();
}

// product_repository.dart
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
```

### Learning 2
The author uses pattern matching with a switch statement for his examples, however this does not expose `skipLoadingOnRefresh` from `.when()` which is great for showing loading indicators coming off of an invalidated provider.
