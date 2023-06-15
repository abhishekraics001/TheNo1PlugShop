//import 'package:flutter/material.dart';
//import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../Utility/CustomeColors.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';

class PaymentPage extends StatefulWidget {
  final String pageTitle;
  final String webPaymentLink;

  const PaymentPage(this.pageTitle, this.webPaymentLink);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  late WebViewController _webViewController;
  String webPaymentPageURL =
      ''; //"https://theno1plugshop.myshopify.com/60653175006/checkouts/26337dca56545d77d179640f75183841?key=ff2c968e1a03b3160e61d6cab5e9e820";
  // "https://theno1plugshop.myshopify.com/60653175006/checkouts/45b149b6cb2c6d16a49692148377492c/recover?key=cd8ebac7c07eea31650ebedfe2d34cad";
  String pageHeaderTitle = ''; //"Payment Page";

  @override
  void initState() {
    super.initState();
    OverlayLoadingProgress.start(
      context,
      gifOrImagePath: 'assets/images/cupertino_activity_indicator.gif',
    );
  }

  @override
  Widget build(BuildContext context) {
    webPaymentPageURL = widget.webPaymentLink;
    pageHeaderTitle = widget.pageTitle;
    return Scaffold(
      backgroundColor: CustomeColors.bodyBgColor,
      appBar: AppBar(
        title: Text(pageHeaderTitle),
      ),
      body: WebView(
        initialUrl: webPaymentPageURL,
        // zoomEnabled: false,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _webViewController = webViewController;
          _controller.complete(webViewController);
        },
        onProgress: (int progress) {
          print("Flutter WebView WebView is loading (progress : $progress%)");
        },
        javascriptChannels: <JavascriptChannel>{
          _toasterJavascriptChannel(context),
        },
        navigationDelegate: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            print('Flutter WebView blocking navigation to $request}');
            return NavigationDecision.prevent;
          }
          print('Flutter WebView allowing navigation to ${request.url}');
          return NavigationDecision.navigate;
        },
        onPageStarted: (String url) {
          print('Flutter WebView Page started loading: $url');
        },
        onPageFinished: (String url) {
          print('Flutter WebView Page finished loading: $url');
          _webViewController
              .evaluateJavascript("javascript:(function() { " +
                  "var head = document.getElementsByTagName('header')[0];" +
                  "head.parentNode.removeChild(head);" +
                  "var footer = document.getElementsByTagName('footer')[0];" +
                  "footer.parentNode.removeChild(footer);" +
                  "var subMenu = document.getElementsByClassName('bredcrumbWrap')[0];" +
                  "subMenu.parentNode.removeChild(subMenu);" +
                  "var headerbottomPaymentPage = document.getElementsByClassName('header-bottom')[0];" +
                  "subMenu.parentNode.removeChild(headerbottomPaymentPage);" +
                  "var footerPaymentPage = document.getElementsByClassName('shopify-section-footer-4')[0];" +
                  "subMenu.parentNode.removeChild(footerPaymentPage);" +
                  "})()")
              .then((value) => debugPrint(
                  'Flutter WebView Page finished loading Javascript'))
              .catchError((onError) => debugPrint('Flutter WebView $onError'));

          OverlayLoadingProgress.stop();
        },
        //gestureNavigationEnabled: true,
      ),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          log('Flutter WebView: onMessageReceived: $message');
        });
  }
}
