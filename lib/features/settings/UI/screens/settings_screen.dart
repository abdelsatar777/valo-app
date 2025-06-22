import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:valo/core/resources/app_color.dart';
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const CustomAppBar(title: "Settings"),
              const SizedBox(height: 16),

              // 🌙 Dark Mode
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.dark_mode, size: 25),
                      SizedBox(width: 5),
                      Text("Dark Mode", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Transform.scale(
                    scale: 0.7,
                    child: Switch(
                      value: themeProvider.isDarkMode,
                      onChanged: (value) {
                        themeProvider.toggleTheme(value);
                      },
                      activeColor: AppColor.primaryColor,
                      inactiveThumbColor: Colors.grey,
                      inactiveTrackColor: Colors.grey[300],
                    ),
                  ),
                ],
              ),

              // 🔔 Notifications Toggle
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.notifications_active_outlined, size: 25),
                      SizedBox(width: 5),
                      Text("Notifications", style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Transform.scale(
                    scale: 0.7,
                    child: Switch(
                      value: _notificationsEnabled,
                      onChanged: _toggleNotifications,
                      activeColor: AppColor.primaryColor,
                      inactiveThumbColor: Colors.grey,
                      inactiveTrackColor: Colors.grey[300],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // 🧾 About App
              InkWell(
                onTap: () => Navigator.pushNamed(context, "/about_screen"),
                child: const Row(
                  children: [
                    Icon(Icons.info_outline, size: 25),
                    SizedBox(width: 5),
                    Text("About App", style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
