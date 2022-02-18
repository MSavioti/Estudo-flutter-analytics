import 'package:estudo_flutter_analytics/app/shared/models/collection.dart';
import 'package:estudo_flutter_analytics/app/shared/services/services_collections.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Collection> collections = [];

  @override
  void initState() {
    loadCollections();
    super.initState();
  }

  void loadCollections() async {
    final _collections = await ServiceCollections.instance.getCollections(5);
    setState(() {
      collections = _collections;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: collections.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              itemCount: collections.length,
              itemBuilder: (context, i) {
                return Card(
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 8.0,
                    ),
                    leading: Image.network(collections[i].image),
                    title: Text(collections[i].name),
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        '/collection',
                        arguments: collections[i],
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
