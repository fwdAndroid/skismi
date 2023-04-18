import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MyWidget extends StatefulWidget {
  String url;
  String title;
  MyWidget({super.key, required this.url, required this.title});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  WebViewController _controller = WebViewController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(widget.title),
        backgroundColor: Colors.black,
        // actions: [
        //   TextButton(
        //       onPressed: () {
        //         _controller.reload();
        //       },
        //       child: Text("Reload"))
        // ],
      ),
      body: Column(children: [
        Expanded(
          child: WebViewWidget(
            controller: _controller
              ..setJavaScriptMode(JavaScriptMode.unrestricted)
              ..setBackgroundColor(const Color(0x00000000))
              ..setNavigationDelegate(
                NavigationDelegate(
                  onProgress: (int progress) {
                    // Update loading bar.
                  },
                  onPageStarted: (String url) {},
                  onPageFinished: (String url) {},
                  onWebResourceError: (WebResourceError error) {},
                ),
              )
              ..loadRequest(Uri.parse(widget.url)),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Go Back")),
            SizedBox(
              width: 20,
            ),
            TextButton(
                onPressed: () {
                  _controller.reload();
                },
                child: Text("Reload"))
          ],
        )
      ]),
    );
  }
}
