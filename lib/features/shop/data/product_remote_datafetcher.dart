import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kratos/features/shop/domain/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_remote_datafetcher.g.dart';

class ProductRemoteDataFetcher {
  const ProductRemoteDataFetcher();

  /// Fetches the list of products from the remote server.
  ///
  /// Throws:
  /// - [Exception] A random exception.
  Future<List<Product>> fetchProducts() async {
    await Future.delayed(const Duration(seconds: 2));

    final rand = Random().nextInt(10) + 1;
    if (rand.isEven) {
      throw Exception('Failed to fetch products');
    }

    return <Product>[
      Product(
          id: 1,
          name: 'Superstar 82 Shoes',
          price: 9000.00,
          imageUrl:
              'https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/d8f674f20bc64c0d8f5d39e8d1db29bd_9366/superstar-82-shoes.jpg'),
      Product(
          id: 2,
          name: 'Anthony Edwards 1 Low Trainers',
          price: 8000.00,
          imageUrl:
              'https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/96da16c149c749f182060896ef321230_9366/anthony-edwards-1-low-trainers.jpg'),
      Product(
          id: 3,
          name: 'Samba OG Shoes',
          price: 6800.00,
          imageUrl:
              'https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/6372db97354b4f9791fb56503e9cd1d7_9366/samba-og-shoes.jpg'),
      Product(
          id: 4,
          name: 'K 74 Shoes',
          price: 5300.00,
          imageUrl:
              'https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/bf41afdeb54d4c9988f5be11c9291c7e_9366/k-74-shoes.jpg'),
    ];
  }
}

@riverpod
ProductRemoteDataFetcher productRemoteDataFetcher(Ref ref) {
  return const ProductRemoteDataFetcher();
}
