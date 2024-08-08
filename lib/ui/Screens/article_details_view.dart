import 'package:flutter/material.dart';
import 'package:myapp/utils/color_manager.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetailsView extends StatefulWidget {
  final String url;
  final dynamic Name;
  const ArticleDetailsView({super.key, required this.url, required this.Name});

  @override
  State<ArticleDetailsView> createState() => _ArticleDetailsView();
}

class _ArticleDetailsView extends State<ArticleDetailsView> {
  final WebViewController controller = WebViewController();
  @override
  void initState() {
    super.initState();
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Directionality(
          textDirection: TextDirection.rtl,
          child: Text(widget.Name.toString())),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: ColorManager.bottomNavBarItemColor,
          ),
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
