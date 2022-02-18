import 'package:estudo_flutter_analytics/app/shared/models/product.dart';

class ServiceProducts {
  ServiceProducts._();

  static ServiceProducts? _instance;

  static ServiceProducts get instance => _instance ??= ServiceProducts._();

  Future<List<Product>> getProducts(int pageSize) async {
    await Future.delayed(const Duration(seconds: 2));

    final List<Product> _products = [];

    for (var i = 0; i < pageSize; i++) {
      final _product = Product(
        id: i,
        sku: '$i',
        name: 'Product $i',
        image: 'https://picsum.photos/100?random=${i + 1}',
      );
      _products.add(_product);
    }

    return _products;
  }
}
