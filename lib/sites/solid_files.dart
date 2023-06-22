import '../models/dg_direct_link_model.dart';
import '../tools/tools.dart';

class SolidFiles {
 static Future<List<DGDirectLinkModel>> get(String url,bool debugMode) async {
   final List<DGDirectLinkModel> links = [];
    await Tools.requestSite(url).then((value){
      try {
        String? sc1 = RegExp(r'downloadUrl":"(.*?)"', multiLine: true)
            // String? sc1 = RegExp(r"viewerOptions\'\,\ (.*?)\)\;", multiLine: true)
            .firstMatch(value!.body!.text)!
            .group(1);
        //print('SoildFiles Test' + value.body!.text);
       //print('SoildFiles Test: ' + sc1!);

        links.add(DGDirectLinkModel(quality: 'Normal', link: sc1 ?? url));


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

   return [];
  }
 }