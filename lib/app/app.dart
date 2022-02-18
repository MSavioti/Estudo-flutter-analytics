import 'package:estudo_flutter_analytics/app/pages/collection_page.dart';
import 'package:estudo_flutter_analytics/app/pages/home_page.dart';
import 'package:estudo_flutter_analytics/app/pages/product_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/collection': (context) => const CollectionPage(),
        '/product': (context) => const ProductPage(),
      },
    );
  }
}
