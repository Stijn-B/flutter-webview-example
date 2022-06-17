import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewStack extends StatefulWidget {
  const WebViewStack({Key? key}) : super(key: key);

  @override
  State<WebViewStack> createState() => _WebViewStackState();
}

class _WebViewStackState extends State<WebViewStack> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WebView(
          initialUrl: 'https://your_website.com',
          // Control navigation; don't navigate if the destination doesn't contain your domain
          navigationDelegate: (navigation) {
            final host = Uri.parse(navigation.url).host;
            if (host.contains('your_website.com')) {
              return NavigationDecision.navigate;
            } else {
              return NavigationDecision.prevent;
            }
          },
          // Enable JavaScript
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ],
    );
  }
}