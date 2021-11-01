import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sl_001/model/panel/payment_init_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebView extends StatefulWidget {
  final String url;
  final PaymentInitData paymentInitData;

  const PaymentWebView(
      {Key? key, required this.url, required this.paymentInitData})
      : super(key: key);

  @override
  PaymentWebViewState createState() => PaymentWebViewState();
}

class PaymentWebViewState extends State<PaymentWebView> {
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    // _webViewController = webViewController;
  }

  @override
  Widget build(BuildContext context) {
    print("widget.paymentInitData.form");
    print(widget.paymentInitData.form);
    print("widget.paymentInitData.form");
    return Padding(
      padding: EdgeInsets.all(50),
      child: WebView(
        initialUrl: 'https://mipg.atipay.net/v1/redirect-to-gateway',
        // initialUrl: '',
        // initialUrl: 'https://www.digikala.com',
        // initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _webViewController = webViewController;
          loadAsset();
        },
      ),
    );
  }

  loadAsset() async {
    print("widget.url");
    print(widget.url);
    print(widget.paymentInitData.form);
    // String sample = <body onload='document.forms[\"form\"].submit()'>\n                              <form name=\"form\" action=https://mipg.atipay.net/v1/redirect-to-gateway method=\"POST\">\n                                <input type=\"hidden\" value=\"801ebe143c734874a0ecd75df1ed7979\" name=\"token\" />\n                              </form>\n                           </body>
    String fileHtmlContents = await rootBundle
        .loadString(widget.paymentInitData.form!);

    var bytes = utf8.encode(fileHtmlContents);
    var base64Str = base64.encode(bytes);

        // .loadString(widget.paymentInitData.form.toString());
    /*_webViewController.evaluateJavascript(
        "const div = document.createElement(<body onload='document.forms[\"form\"].submit()'>\n                              <form name=\"form\" action=https://mipg.atipay.net/v1/redirect-to-gateway method=\"POST\">\n                                <input type=\"hidden\" value=\"b7419b94f06e406089b1403bf4b8eb1b\" name=\"token\" />\n                              </form>\n                           </body>)" +
            "div.innerHTML = htmlData" +
            "document.body.appendChild(div)" +
            "div.firstElementChild.submit()");*/
    _webViewController.evaluateJavascript(
        // "const div = document.createElement('"+fileHtmlContents+"')" +
        "const div = document.createElement('"+base64Str+"')" +
            "div.innerHTML = htmlData" +
            "document.body.appendChild(div)" +
            "div.firstElementChild.submit()");
     /*_webViewController.evaluateJavascript(
        "externalRefrenceByHTML: (htmlData = <></>) => {" +
            "const div = document.createElement('div')" +
            "div.innerHTML = htmlData" +
            "document.body.appendChild(div)" +
            "div.firstElementChild.submit()" +
            "}");*/
    /*_webViewController.loadUrl(Uri.dataFromString(fileHtmlContents,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());*/
    // String fileHtmlContents = await rootBundle.loadString('assets/paid.html');
    /*String fileHtmlContents = await rootBundle.loadString('assets/demo.html');
    _webViewController.loadUrl(Uri.dataFromString(fileHtmlContents,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());*/
    /*_webViewController.loadUrl(Uri.dataFromString(
      '<html><body>hello world</body></html>',
      mimeType: 'text/html',
      encoding: Encoding.getByName('utf-8'),
    ).toString());*/
  }
}
