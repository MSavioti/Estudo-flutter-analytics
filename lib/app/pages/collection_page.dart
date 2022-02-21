import 'package:estudo_flutter_analytics/app/shared/models/collection.dart';
import 'package:estudo_flutter_analytics/app/shared/models/product.dart';
import 'package:estudo_flutter_analytics/app/shared/services/services_products.dart';
import 'package:estudo_flutter_analytics/app/shared/utils/utils_analytics.dart';
import 'package:flutter/material.dart';

class CollectionPage extends StatefulWidget {
  const CollectionPage({Key? key}) : super(key: key);

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  bool _sentUsage = false;
  List<Product> products = [];

  @override
  void initState() {
    _loadProducts();
    super.initState();
  }

  void _loadProducts() async {
    final _products = await ServiceProducts.instance.getProducts(5);
    setState(() {
      products = _products;
    });
  }

  void _sendUsage(Collection collection) async {
    if (_sentUsage) {
      return;
    }

    UtilsAnalytics.instance.sendCollectionScreenView(collection.id);
    _sentUsage = true;
  }

  @override
  Widget build(BuildContext context) {
    final _collection =
        ModalRoute.of(context)?.settings.arguments as Collection;
    _sendUsage(_collection);

    return Scaffold(
      appBar: AppBar(
        title: Text(_collection.name),
      ),
      body: products.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              itemCount: products.length,
              itemBuilder: (context, i) {
                return Card(
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 8.0,
                    ),
                    leading: Image.network(products[i].image),
                    title: Text(products[i].name),
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        '/product',
                        arguments: products[i],
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
