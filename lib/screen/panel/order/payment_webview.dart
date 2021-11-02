import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
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

  // WebViewController _webViewController=WebViewController();

  // late WebViewController myWebViewController;

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
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height,
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: Padding(
        padding: EdgeInsets.all(50),
        child: WebView(
          // initialUrl: 'https://mipg.atipay.net/v1/redirect-to-gateway',
          initialUrl: '',
          // initialUrl: 'https://www.digikala.com',
          // initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _webViewController = webViewController;
            loadAsset1();
            // loadAsset2();
            // loadAsset3();
            // loadAsset4();
          },
        ),
      ),
    );
  }

  loadAsset1() async {
    String fff = widget.paymentInitData.form!;
    // var htmlData = widget.paymentInitData.form;
    print("fff");
    print(fff);

    String innerHTML = Uri.dataFromString(fff,
        mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString();
    // var bytes = utf8.encode(innerHTML);
    // var base64Str = base64.encode(bytes);
    print("innerHTML");
    print(innerHTML);
    // print(fff);
    String sss = "SDasd";
// String aa = "<form name="form
//         "action=https://mipg.atipay.net/v1/redirect-to-gateway method="'POST'"><input type="'hidden'" value="'29f61d4b8e274f4895701637ecd64426'"name="token" />";
    _webViewController
        .evaluateJavascript(
      // "alert('$fff');"
        "alert('$sss');"
        // "'$innerHTML';"
        // "$fff;"
        //     "const div = document.createElement('div');"
        // "div.innerHTML = $fff;"
        // "document.body.appendChild(div);"
        // "document.body.appendChild($innerHTML);"
        // "document.body.appendChild($fff);"
        //     "document.body.appendChild(alert('Bye Bye'));"
            "document.body.appendChild(<body>alert('a')</body>);"
        // "div.firstElementChild.submit();"
    );
  }

  loadAsset2() async {
    print("widget.url");
    print(widget.url);
    print(widget.paymentInitData.form);

    String fff = "YuuuuuP";

    _webViewController.evaluateJavascript(
      // 'alert($fff);'
        'alert("$fff");'
            'alert("fff");'
            'aaa = "NoooopE";'
            'alert(aaa);'
            'alert("Bye Bye")');
  }

  loadAsset3() async {
    print("widget.url");
    print(widget.url);
    print(widget.paymentInitData.form);
    String fff = widget.paymentInitData.form!;
    String innerHTML = Uri.dataFromString(fff,
        mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString();
    // var bytes = utf8.encode(innerHTML);
    // var base64Str = base64.encode(bytes);

    _webViewController.evaluateJavascript('const div = document.createElement('
        "'div'"
        ');'
        'div.innerHTML = "$innerHTML";'
    // 'div.innerHTML = "$fff";'
        'alert("fff");');
  }

  loadAsset4() async {
    String fff = 'YuuuuuP';

    _webViewController.evaluateJavascript(
        "alert('$fff');"
        // "alert($fff);"
            "var aaa = '""NoooopE""';"
            "alert(aaa);"
            "alert('Bye Bye')");
  }
}
