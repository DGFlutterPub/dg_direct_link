import '../models/dg_direct_link_model.dart';

class DropBox {
 
  static Future<List<DGDirectLinkModel>> get(String url) async {
    final List<DGDirectLinkModel> links = [];
     links.add(DGDirectLinkModel(quality: 'Normal', link: url.replaceAll('?dl=0', '?dl=1')));
   return links;
  }
 }