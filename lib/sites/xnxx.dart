import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:html/parser.dart';

import '../models/dg_direct_link_model.dart';

class XNXX {
  
  static Future<List<DGDirectLinkModel>> get(String url,bool debugMode) async {
 final List<DGDirectLinkModel> links = [];
 var han = HeadlessInAppWebView(
      initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
              allowFileAccessFromFileURLs: false,
              allowUniversalAccessFromFileURLs: false,
              cacheEnabled: false,
              useOnLoadResource: true,
              javaScriptCanOpenWindowsAutomatically: true,
              mediaPlaybackRequiresUserGesture: false)),
      initialUrlRequest: URLRequest(url: Uri.parse(url)),
      onLoadStop: (controller, url) async {
        try {
          var htm = await controller.getHtml();
          var document = parse(htm);
          var script = document.body!.text;
          //print(document.body);

          if (script.contains("html5player.setVideoUrlLow")) {
            List<String> lines = script.split("\n");
            print(lines.length);
            await Future.wait(lines.map((line) async {
              if (line.contains("html5player.setVideoUrlLow")) {
                String lowQ = line
                    .replaceAll("html5player.setVideoUrlLow('", "")
                    .replaceAll("');", "");

                print(lowQ);
                links.add(DGDirectLinkModel(quality: 'SD', link: lowQ));
              }
            }));
          }
          if (script.contains("html5player.setVideoUrlHigh")) {
            List<String> lines = script.split("\n");
            await Future.wait(lines.map((line) async {
              if (line.contains("html5player.setVideoUrlHigh")) {
                String highQ = line
                    .replaceAll("html5player.setVideoUrlHigh('", "")
                    .replaceAll("');", "");
                links.add(DGDirectLinkModel(quality: 'HD', link: highQ));
              }
            }));
          }
        } catch (e) {}

      },
    )
      ..run()
      ..dispose();
    return links;
  }
 }