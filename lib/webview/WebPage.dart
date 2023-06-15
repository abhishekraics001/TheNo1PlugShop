import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:theplugshop/Utility/UtilityClass.dart';
import 'package:theplugshop/retrofit/httpRequest.dart';
import 'package:theplugshop/shopifypkg/ShopifyAPICall.dart';
import 'package:theplugshop/webview/ShopDetailsData.dart';
import 'dart:developer';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:webview_flutter/webview_flutter.dart';
import '../Utility/CustomeColors.dart';
import 'package:overlay_loading_progress/overlay_loading_progress.dart';

class WebPage extends StatefulWidget {
  final String pageID;
  final String pageTitle;
  const WebPage(this.pageID, this.pageTitle);

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  late WebViewController _webViewController;
  String pageURL = "";
  String pageTitle = "The No1 Plug Shop";

  @override
  void initState() {
    super.initState();
    getProductListData();
  }

  late ShopDetailsData shopDetailsData;
  Future<void> getProductListData() async {
    String strPageID = '';
    if (widget.pageID == "AU") {
      strPageID = '';
      pageTitle = "About Us";
    } else if (widget.pageID == "TC") {
      strPageID = '92577464542';
      pageTitle = "Terms and Conditions";
    } else if (widget.pageID == "PP") {
      strPageID = '92577235166';
      pageTitle = "Privacy Policy";
    } else if (widget.pageID == "RF") {
      strPageID = '92577366238';
      pageTitle = "Refund Policy";
    } else if (widget.pageID == "HW") {
      strPageID = '98034090206';
      pageTitle = "Health Warning";
    }



    OverlayLoadingProgress.start(
      context,
      gifOrImagePath: 'assets/images/cupertino_activity_indicator.gif',
    );

    var respd = await getShopDetailsData(strPageID)
        .then((value) => {
              debugPrint('ShopDetailsData : $value'),
              ShowTostMsg(SuccessMsg),
              setState(() {
                shopDetailsData = value;
                pageURL = shopDetailsData.page!.bodyHtml!;
                pageTitle = shopDetailsData.page!.title!;

                OverlayLoadingProgress.stop();
              }),
            })
        .catchError((error) => {
              // ignore: avoid_debugPrint
              OverlayLoadingProgress.stop(),
              debugPrint('ShopDetailsData Error Exceptions 1: $error'),
              ShowTostMsg(SomeThingWentWrong),
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomeColors.bodyBgColor,
      appBar: AppBar(
        title: Text(pageTitle),
      ),
      body: SingleChildScrollView(child: loadPgaeData()),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          log('onMessageReceived: $message');
        });
  }

  loadPgaeData() {
    if (widget.pageID == "TC" ||
        widget.pageID == "PP" ||
        widget.pageID == "RF" ||
        widget.pageID == "HW") {
      return Container(
        child: Html(data: pageURL),
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(2),
      );
    } else {
      return Expanded(child: Text('No Dynamic Data'));
    }
  }
}
