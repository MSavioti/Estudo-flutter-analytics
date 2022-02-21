import 'package:estudo_flutter_analytics/app/shared/models/product.dart';
import 'package:estudo_flutter_analytics/app/shared/utils/utils_analytics.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _product = ModalRoute.of(context)?.settings.arguments as Product;
    UtilsAnalytics.instance.sendProductScreenView(_product.sku);

    return Scaffold(
      appBar: AppBar(
        title: Text(_product.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(_product.image),
            const SizedBox(width: 24.0),
            SizedBox(
              height: 50.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_product.name),
                  Text(
                    _product.sku,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
