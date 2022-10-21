import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  _SupportScreenState createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  String url = "";
  @override
  void didChangeDependencies() {
    // WebView.platform = AndroidWebView();
    String argument = ModalRoute.of(context)!.settings.arguments as String;
    if (argument == "My Data") {
      url =
          "https://headspace-meditation.s3.eu-west-2.amazonaws.com/Privacy.html";
    } else if (argument == "Privacy Policy") {
      url =
          "https://headspace-meditation.s3.eu-west-2.amazonaws.com/Privacy.html";
    } else if (argument == "Terms & Conditions") {
      url =
          "https://headspace-meditation.s3.eu-west-2.amazonaws.com/TermsCondition.html";
    } else {
      url =
          "https://headspace-meditation.s3.eu-west-2.amazonaws.com/Support.html";
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      initialUrlRequest:  URLRequest(url: Uri.parse(url)),
    );
  }
}
