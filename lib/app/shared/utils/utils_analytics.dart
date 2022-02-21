import 'package:estudo_flutter_analytics/env.dart';
import 'package:path_provider/path_provider.dart';
import 'package:usage/usage_io.dart';

class UtilsAnalytics {
  late AnalyticsIO googleAnalytics;

  UtilsAnalytics._() {
    _setUpAnalytics();
  }

  static UtilsAnalytics? _instance;
  static UtilsAnalytics get instance => _instance ??= UtilsAnalytics._();

  void sendCollectionScreenView(int id) async {
    googleAnalytics.sendScreenView('collection/$id');
  }

  void sendProductScreenView(String sku) {
    googleAnalytics.sendScreenView('product/$sku');
  }

  Future<void> _setUpAnalytics() async {
    final _directory = await getApplicationDocumentsDirectory();

    googleAnalytics = AnalyticsIO(
      Env.universalAnalytics,
      'Testing UA',
      '0.1.0',
      documentDirectory: _directory,
    );
    googleAnalytics.enabled = true;
    googleAnalytics.analyticsOpt = AnalyticsOpt.optIn;
  }
}
