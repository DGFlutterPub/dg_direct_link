import 'dart:convert';

import '../models/dg_direct_link_model.dart';
import '../tools/tools.dart';

class VK {
static Future<List<DGDirectLinkModel>> get(String url,bool debugMode) async {
   final List<DGDirectLinkModel> links = [];
    await Tools.requestSite(url).then((value){
          try {
        String? sc1 = RegExp("al_video.php', ?(\\{.*])", multiLine: true)
            .firstMatch(value!.body!.text.toString())!
            .group(1);
        String? sc2 = RegExp("\\}, ?(.*)", multiLine: true)
            .firstMatch(sc1.toString())!
            .group(1);
        String x240 = "url240",
            x360 = "url360",
            x480 = "url480",
            x720 = "url720",
            x1080 = "url1080";

        var decode = jsonDecode(sc2!);
        var getLink = decode[4]['player']['params'][0];

        try {
          links.add(DGDirectLinkModel(
              quality: '240P', link: getLink[x240].toString().trim()));
          print(getLink[x240].toString());
        } catch (e) {}
        try {
          links.add(DGDirectLinkModel(
              quality: '360P', link: getLink[x360].toString().trim()));
          print(getLink[x360].toString());
        } catch (e) {}

        try {
          links.add(DGDirectLinkModel(
              quality: '480P', link: getLink[x480].toString().trim()));
          print(getLink[x480].toString());
        } catch (e) {}
        try {
          links.add(DGDirectLinkModel(
              quality: '720P', link: getLink[x720].toString().trim()));
        } catch (e) {}
        try {
          links.add(DGDirectLinkModel(
              quality: '1080P', link: getLink[x1080].toString().trim()));
        } catch (e) {}
      } catch (e) {
        print(e.toString());
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