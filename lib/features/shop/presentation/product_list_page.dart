import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kratos/features/shop/domain/product.dart';
import 'package:kratos/features/shop/presentation/product_list_controller.dart';

class ProductListPage extends ConsumerWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productListControllerProvider);
    return Scaffold(
      body: SafeArea(
        child: state.when(
          data: (value) => _DataWidget(products: value),
          error: (error, stackTrace) => _ErrorWidget(
            error: error,
            stackTrace: stackTrace,
            onRetryTapped: () => ref.invalidate(productListControllerProvider),
          ),
          loading: () => const _LoadingWidget(),
          skipLoadingOnRefresh: false,
        ),
      ),
    );
  }
}

class _DataWidget extends StatelessWidget {
  final List<Product> products;

  const _DataWidget({required this.products});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.0 / 1.4,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Card(
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1.0,
                child: Image.network(product.imageUrl),
              ),
              const SizedBox(height: 8),
              Text(
                product.name,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('PHP ${product.price.toString()}'),
            ],
          ),
        );
      },
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  final Object error;
  final StackTrace stackTrace;
  final Function()? onRetryTapped;

  const _ErrorWidget(
      {required this.error, required this.stackTrace, this.onRetryTapped});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 8,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(error.toString()),
          ElevatedButton(onPressed: onRetryTapped, child: Text('Refresh')),
        ],
      ),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
