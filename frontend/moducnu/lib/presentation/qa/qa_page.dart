import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class QaPage extends StatefulWidget {
  const QaPage({super.key});

  @override
  State<QaPage> createState() => _QaPageState();
}

class _QaPageState extends State<QaPage> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // JavaScript 허용
      ..loadRequest(Uri.parse(
          'https://docs.google.com/forms/d/e/1FAIpQLScpYXwJScZTKXbKlo9PN4btaw3zY-3SP7fcDRAigDa4Qd32KA/viewform?usp=dialog')); // 구글 폼 URL
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('구글폼 문의 페이지')),
      body: WebViewWidget(controller: _controller), // 폼이 바로 로딩됨
    );
  }
}
