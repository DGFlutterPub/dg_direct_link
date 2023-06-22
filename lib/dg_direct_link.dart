library dg_direct_link;

import 'package:dg_direct_link/models/dg_direct_link_model.dart';
import 'package:dg_direct_link/sites/drop_box.dart';
import 'package:dg_direct_link/sites/f_embed_files.dart';
import 'package:dg_direct_link/sites/google_drive.dart';
import 'package:dg_direct_link/sites/media_fire.dart';
import 'package:dg_direct_link/sites/ok_ru.dart';
import 'package:dg_direct_link/sites/social_downloader.dart';
import 'package:dg_direct_link/sites/solid_files.dart';
import 'package:dg_direct_link/sites/vk.dart';
import 'package:dg_direct_link/sites/xnxx.dart';



class DGDirectLink {
 

 static Future<List<DGDirectLinkModel>> start({required String url,bool debugMode = true}) async {
    
     if (url.contains('ok.ru')) {
     return await OkRu.get(url,debugMode);
    } else if (url.contains('dropbox.com')) {
     return await DropBox.get(url);
    } else if (url.contains('solidfiles')) {
     return await SolidFiles.get(url,debugMode);
    } else if (url.contains('drive.google.com')) {
     return await GoogleDrive.get(url);
    } else if (url.contains('fembed.com')) {
     return await FEmbedFiles.get(url,debugMode);
    } else if (url.contains('youtube.com') ||
        url.contains('youtu.be') ||
        url.contains('fb.com') ||
        url.contains('facebook.com')) {
     return await SocialDownloader.get(url);
    } else if (url.contains('www.mediafire.com')) {
     return await MediaFire.get(url,debugMode);
    } else if (url.contains('xnxx')) {
     return await XNXX.get(url,debugMode);
    } else if (url.contains('vk.com')) {
     return await VK.get(url,debugMode);
    } else {
     final List<DGDirectLinkModel> links = [];
     links.add(DGDirectLinkModel(quality: 'Normal', link: url));
     return links;
    }
 }

}
