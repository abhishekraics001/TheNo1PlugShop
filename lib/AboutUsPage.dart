import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:webview_flutter/platform_interface.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'Utility/CustomeColors.dart';



class AboutUsPage extends StatefulWidget {
  final String pageID;
  final String pageTitle;
  const AboutUsPage(this.pageID, this.pageTitle);

  @override
  State<AboutUsPage> createState() => _AboutUsPage();
}

class _AboutUsPage extends State<AboutUsPage> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    //getProductListData();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomeColors.bodyBgColor,
      appBar: AppBar(
        title: Text(widget.pageTitle),
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



  static const String webview_content_AboutUS = '''
     <!DOCTYPE html>
     <html lang="en">
     <head>
     <title>About Store</title>
     </head>
     <body>

     <div class="col-left">
      
      <h3 class="heading">
<span>
  About Store
</span>
</h3>
      
      
      <div class="content">
        
<span>
  The UK has been witnessing innumerable deaths every year caused due to smoking tobacco. Compared to smoking, vaping is much safer, helping one to quit smoking effectively. Vaping is also way cheaper than smoking cigarettes as long as you take care to buy the right vape juices, equipment, and accessories from the best vape shop online in the UK.

If you are new to vaping, you need to take extra care to order your vape accessories and juices from a reputed and leading vape e-liquids shop online.
</span>

      </div>
      
    </div>

    </body>
    </html>
    ''';


  static const String webview_content_ContactSU = '''
     <!DOCTYPE html>
     <html lang="en">
     <head>
     <title> Contact US</title>
     </head>
     <body>

     <div class="col-right">
      
      <h3 class="heading">
<span>
  Contact Us
</span>
</h3>
      
      
      <div class="content">
        
<span>
  THE NO.1 PLUG<br>
25 Victoria Road<br> Keighley, BD21 1HD
<br>United Kingdom<br>

Email: contact@theno1plug.com<br>
Call Us: +447704795013<br>
</span>

      </div>
      
    </div>

    </body>
    </html>
    ''';



  String webContet ="";

  loadPgaeData() {
    print("About US pageID: ${widget.pageID}    pageTitle: ${widget.pageTitle} ");
    if(widget.pageID == 'AU'){
      webContet = webview_content_AboutUS;
    }else if(widget.pageID == 'CS'){
      webContet = webview_content_ContactSU;
    }else{

    }


    print("About US pageID: ${widget.pageID}    pageTitle: ${widget.pageTitle}   webContet  $webContet");

   // if (widget.pageID == "AU" ||  widget.pageID == "CS" ) {
      return Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(2),
        child: Html(data:  webContet),
      );
  /*  } else {
      return Expanded(child: Text('No Dynamic Data'));
    } */
  }
}


/*
class AboutUsPage extends StatefulWidget {

  final String pageID;
  final String pageTitle;

  const AboutUsPage(this.pageID, this.pageTitle, {Key? key}) : super(key: key);

  static const String routeName = '/AboutUsPage';


  @override
  State<AboutUsPage> createState() => _AboutUsPage();

}


class AboutUsPage extends StatefulWidget {
  late final String pageID;
  late final String pageTitle;

  const WebPage(this.pageID, this.pageTitle);

  @override
  State<WebPage> createState() => _AboutUsPage();
}


class _AboutUsPage extends State<AboutUsPage> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  late WebViewController _webViewController;
  String pageURL = "";
  String pageTitle = "";


  static const String webview_content = '''
     <!DOCTYPE html>
     <html lang="en">
     <head>
     <title>About Store</title>
     </head>
     <body>

     <div class="col-left">
      
      <h3 class="heading">
<span>
  About Store
</span>
</h3>
      
      
      <div class="content">
        
<span>
  The UK has been witnessing innumerable deaths every year caused due to smoking tobacco. Compared to smoking, vaping is much safer, helping one to quit smoking effectively. Vaping is also way cheaper than smoking cigarettes as long as you take care to buy the right vape juices, equipment, and accessories from the best vape shop online in the UK.

If you are new to vaping, you need to take extra care to order your vape accessories and juices from a reputed and leading vape e-liquids shop online.
</span>

      </div>
      
    </div>

    </body>
    </html>
    ''';


  static const String webview_ContactUS_content = '''
     <!DOCTYPE html>
     <html lang="en">
     <head>
     <titleContact US</title>
     </head>
     <body>

     <div class="col-right">
      
      <h3 class="heading">
<span>
  Contact Us
</span>
</h3>
      
      
      <div class="content">
        
<span>
  THE NO.1 PLUG<br>
25 Victoria Road<br> Keighley, BD21 1HD
<br>United Kingdom<br>

Email: contact@theno1plug.com<br>
Call Us: +447704795013<br>
</span>

      </div>
      
    </div>
      
    </div>

    </body>
    </html>
    ''';



String webContet ="";

  @override
  void initState() {
    super.initState();
    if(widget.pageID == 'AS'){
      webContet = webview_ContactUS_content;
    }else if(widget.pageID == 'CS'){
      webContet = webview_content;
    }else{

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomeColors.bodyBgColor,
      appBar: AppBar(
        title: Text(widget.pageTitle),
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
    if (widget.pageID == "AS" || widget.pageID == "CS") {
      return Container(
        child: Html(data: webContet),
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(2),
      );
    } else {
      return Expanded(child: Text('No Dynamic Data'));
    }
  }
}
*/
