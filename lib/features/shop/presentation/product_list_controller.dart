import 'package:kratos/features/shop/data/product_remote_repository.dart';
import 'package:kratos/features/shop/domain/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_list_controller.g.dart';

@riverpod
class ProductListController extends _$ProductListController {
  @override
  FutureOr<List<Product>> build() async {
    final repository = ref.watch(productRemoteRepositoryProvider);
    return await repository.getProducts();
  }
}
