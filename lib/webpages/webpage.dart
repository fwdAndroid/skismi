import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
// Import for Android features.
import 'package:webview_flutter_android/webview_flutter_android.dart';
// Import for iOS features.
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class MyWidget extends StatefulWidget {
  String url;
  String title;
  MyWidget({super.key, required this.url, required this.title});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  WebViewController _controller = WebViewController();
  PlatformWebViewControllerCreationParams params =
      PlatformWebViewControllerCreationParams();

  @override
  void initState() {
//     if (WebViewPlatform.instance is WebKitWebViewPlatform) {
//       params = WebKitWebViewControllerCreationParams(
//         allowsInlineMediaPlayback: true,
//         mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
//       );
//     } else {
//       params = const PlatformWebViewControllerCreationParams();
//     }

//     final WebViewController controller =
//         WebViewController.fromPlatformCreationParams(params);
// // ···
//     if (controller.platform is AndroidWebViewController) {
//       AndroidWebViewController.enableDebugging(true);
//       (controller.platform as AndroidWebViewController)
//           .setMediaPlaybackRequiresUserGesture(false);
//     }

    // TODO: implement initState
    super.initState();
  }

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
      body: WebViewWidget(
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
          ..addJavaScriptChannel(
            'Toaster',
            onMessageReceived: (JavaScriptMessage message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message.message)),
              );
            },
          )
          ..loadRequest(Uri.parse(widget.url)),
      ),
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     TextButton(
      //         onPressed: () {
      //           Navigator.pop(context);
      //         },
      //         child: Text("Go Back")),
      //     SizedBox(
      //       width: 20,
      //     ),
      //     TextButton(
      //         onPressed: () {
      //           _controller.reload();
      //         },
      //         child: Text("Reload"))
      //   ],
      // )
    );
  }
}
