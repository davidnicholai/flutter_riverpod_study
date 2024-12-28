import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kratos/features/shop/data/product_remote_datafetcher.dart';
import 'package:kratos/features/shop/domain/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_repository.g.dart';

@riverpod
Future<List<Product>> getProducts(Ref ref) async {
  return await ref.watch(fetchProductsProvider.future);
}
