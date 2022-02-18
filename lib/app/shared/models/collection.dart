import 'package:estudo_flutter_analytics/app/shared/models/product.dart';

class Collection {
  final int id;
  final String name;
  final String image;
  final List<Product> products;

  Collection({
    required this.id,
    required this.name,
    required this.image,
    required this.products,
  });
}
