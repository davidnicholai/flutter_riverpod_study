import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kratos/app/constants.dart';
import 'package:kratos/common_providers/shared_preferences_provider.dart';
import 'package:kratos/features/shop/domain/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'product_local_repository.g.dart';

class ProductLocalRepository {
  final SharedPreferences _sharedPreferences;

  const ProductLocalRepository({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences;

  /// Stores the list of products in the local database.
  Future<void> storeProducts(List<Product> products) async {
    final jsonString = jsonEncode(products);
    await _sharedPreferences.setString(StorageKeys.products, jsonString);
  }

  Future<List<Product>> getProducts() async {
    final productsJson = _sharedPreferences.getString(StorageKeys.products);

    if (productsJson != null) {
      return List<Product>.from(
          jsonDecode(productsJson).map((e) => Product.fromJson(e)));
    }

    return <Product>[];
  }
}

@riverpod
ProductLocalRepository productLocalRepository(Ref ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider).requireValue;
  return ProductLocalRepository(sharedPreferences: sharedPreferences);
}
