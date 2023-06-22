import 'dart:convert';

import 'package:html_unescape/html_unescape.dart';

import '../models/dg_direct_link_model.dart';
import '../tools/tools.dart';

class OkRu{
 
  static Future<List<DGDirectLinkModel>> get(String url,bool debugMode) async {
   final List<DGDirectLinkModel> links = [];
    await Tools.requestSite(url).then((value){
       try {
        var unescape = HtmlUnescape();

        var sc1 = value!
            .getElementsByClassName('vp_video')
            .map((e) => e.innerHtml.trim())
            .toList()[0];

        String? sc2 = RegExp(r'data-options="(.*?)"', multiLine: true)
            .firstMatch(sc1)!
            .group(1);

        String sc3 = unescape.convert(sc2!);

        var sc4 = jsonDecode(sc3);

        var sc5 = jsonDecode(sc4['flashvars']['metadata']);

        var list = sc5['videos'];

        for (var i = 0; i < list.length; i++) {
          String url = list[i]["url"];
          String name = list[i]["name"];

          switch (name) {
            case "mobile":
              links.add(DGDirectLinkModel(quality: '144p', link: url));
              break;
            case "lowest":
              links.add(DGDirectLinkModel(quality: '240p', link: url));
              break;
            case "low":
              links.add(DGDirectLinkModel(quality: '360p', link: url));

              break;
            case "sd":
              links.add(DGDirectLinkModel(quality: '480p', link: url));

              break;
            case "hd":
              links.add(DGDirectLinkModel(quality: '720p', link: url));

              break;
            case "full":
              links.add(DGDirectLinkModel(quality: '1080p', link: url));

              break;
            case "quad":
              links.add(DGDirectLinkModel(quality: '2000p', link: url));
              break;
            case "ultra":
              links.add(DGDirectLinkModel(quality: '2000p', link: url));
              break;
            default:
              links.add(DGDirectLinkModel(quality: 'Default', link: url));
          }
        }

      } catch (e) {
        if(debugMode){
           print(e.toString());
        }
     
      }
    }).onError((error, stackTrace) {
       if(debugMode){
          print(error.toString());
          print(stackTrace.toString());
        }

    });

   return links;
  }
}