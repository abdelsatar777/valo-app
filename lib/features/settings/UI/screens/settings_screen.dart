import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:valo/features/settings/UI/screens/widgets/custom_switch.dart';
import '../../../../core/services/theme_provider.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/services/local_notifications_services.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = false;

  @override
  void initState() {
    super.initState();
    _loadNotificationPreference();
  }

  Future<void> _loadNotificationPreference() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _notificationsEnabled = prefs.getBool('notifications_enabled') ?? false;
    });
  }

  Future<void> _toggleNotifications(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _notificationsEnabled = value;
    });
    await prefs.setBool('notifications_enabled', value);

    if (value) {
      LocalNotificationsServices.basicNotification(value: value);
      LocalNotificationsServices.repeatedNotification();
    } else {
      LocalNotificationsServices.basicNotification(value: value);
      LocalNotificationsServices.cancelNotification(id: 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CustomAppBar(title: "Settings"),
            SizedBox(height: 16.h),

            // 🌙 Dark Mode
            CustomSwitch(
              text: "Mode",
              iconData: Icons.dark_mode,
              value: themeProvider.isDarkMode,
              onChanged: (value) {
                themeProvider.toggleTheme(value);
              },
            ),

            // 🔔 Notifications Toggle
            CustomSwitch(
              text: "Notifications",
              iconData: Icons.notifications_active_outlined,
              value: _notificationsEnabled,
              onChanged: _toggleNotifications,
            ),

            const SizedBox(height: 16),

            // 🧾 About App
            InkWell(
              onTap: () => Navigator.pushNamed(context, "/about_screen"),
              child: Row(
                children: [
                  Icon(Icons.info_outline, size: 25.r),
                  SizedBox(width: 5.w),
                  Text("About App", style: TextStyle(fontSize: 16.sp)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
