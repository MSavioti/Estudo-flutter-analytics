import 'package:estudo_flutter_analytics/app/shared/models/collection.dart';

class ServiceCollections {
  ServiceCollections._();

  static ServiceCollections? _instance;

  static ServiceCollections get instance =>
      _instance ??= ServiceCollections._();

  Future<List<Collection>> getCollections(int pageSize) async {
    await Future.delayed(const Duration(seconds: 2));

    final List<Collection> _collections = [];

    for (var i = 0; i < pageSize; i++) {
      final _collection = Collection(
        id: i + 1,
        name: 'Collection ${i + 1}',
        image: 'https://picsum.photos/100?random=${i + 1}',
        products: ['1', '2', '3', '4', '5'],
      );
      _collections.add(_collection);
    }

    return _collections;
  }
}
