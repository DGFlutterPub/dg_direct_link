import '../models/dg_direct_link_model.dart';
import '../tools/tools.dart';

class MediaFire {

  static Future<List<DGDirectLinkModel>> get(String url,bool debugMode) async {
  final List<DGDirectLinkModel> links = [];
    await Tools.requestSite(url).then((value){
     
      try {
        var href = value!
            .querySelectorAll('#downloadButton > a')[0]
            .attributes['href']
            .toString();

        links.add(DGDirectLinkModel(quality: 'Normal', link: href));


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