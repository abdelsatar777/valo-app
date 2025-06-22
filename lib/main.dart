import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'app.dart';
import 'core/network/di.dart';
import 'core/services/local_notifications_services.dart';
import 'core/services/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUp();

  // إخفاء الـ status bar والـ navigation bar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  // تعريف الاشعارات
  await LocalNotificationsServices.init();

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const App(),
    ),
  );
}
