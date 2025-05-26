import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'app.dart';
import 'core/network/di.dart';

void main() {
  setUp();
  WidgetsFlutterBinding.ensureInitialized(); // دي لازم تكون أول حاجة
  // إخفاء الـ status bar والـ navigation bar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(App());
}
