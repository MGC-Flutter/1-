import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  late final WebViewController _webViewController = WebViewController()
    ..setNavigationDelegate(NavigationDelegate(onPageFinished: (url) {
      setAppBarTitle();
    }))
    ..loadRequest(Uri.parse('https://www.google.com'))
    ..setJavaScriptMode(JavaScriptMode.unrestricted);

  String _title = '로딩중...';

  @override
  void initState() {
    super.initState();
  }

  Future<void> setAppBarTitle() async {
    var title = await _webViewController.getTitle();

    setState(() {
      _title = title ?? '무제';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(_title),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  _webViewController
                      .loadRequest(Uri.parse('https://www.google.com'));
                },
                icon: const Icon(
                  Icons.home,
                )),
          ],
        ),
        body: WebViewWidget(
          controller: _webViewController,
        ));
  }
}
