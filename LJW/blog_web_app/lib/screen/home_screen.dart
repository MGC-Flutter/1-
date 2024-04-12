import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  WebViewController webViewController = WebViewController()
    ..loadRequest(Uri.parse('https://flutter.dev'))
    ..setJavaScriptMode(JavaScriptMode.unrestricted);

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('웹뷰'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  webViewController
                      .loadRequest(Uri.parse('http://flutter.dev'));
                },
                icon: const Icon(
                  Icons.home,
                )),
          ],
        ),
        body: WebViewWidget(
          controller: webViewController,
        ));
  }
}
