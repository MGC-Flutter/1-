import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

import 'package:ch8_blog_web_app_windows/w32webview/w32webview.dart';

void main() async {
  // For full-screen example
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey, 
      home: W32WebView()
    );
  }
}