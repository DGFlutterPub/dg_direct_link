import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:html/parser.dart';

import '../models/dg_direct_link_model.dart';

class GoogleDrive {
 
  static Future<List<DGDirectLinkModel>> get(String url) async {
    final List<DGDirectLinkModel> links = [];
     String rUrl = url;

    url = rUrl
        .replaceAll('/file/d/', '/u/1/uc?id=')
        .replaceAll('/view?usp=share_link', '&export=download')
        .replaceAll('/view', '&export=download');

    HeadlessInAppWebView(
      initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
              cacheEnabled: true,
              useOnLoadResource: true,
              javaScriptCanOpenWindowsAutomatically: true,
              mediaPlaybackRequiresUserGesture: false,
              useOnDownloadStart: true)),
      onDownloadStartRequest: (controller, downloadStartRequest) {
        links.add(DGDirectLinkModel(
            quality: 'Normal', link: downloadStartRequest.url.toString()));
        print('GoogleDriveDirectLink: ${downloadStartRequest.url}');
      },
      initialUrlRequest: URLRequest(url: Uri.parse(url)),
      onLoadStop: (controller, url) async {
        await controller.evaluateJavascript(
            source: '''document.querySelector('#uc-download-link').click()''');

        try {
          var htm = await controller.getHtml();
          var document = parse(htm);
          print(document.body);
        } catch (e) {
          print(e.toString());
        }
      },
    )
      ..run()
      ..dispose();
   return links;
  }
 } 