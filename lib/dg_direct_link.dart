library dg_direct_link;

import 'dart:collection';

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
import 'package:flutter/material.dart';



class DGDirectLink {

  static Future<List<DGDirectLinkModel>> get({required String url,bool debugMode = true}) async {

    if(url.contains('http://') || url.contains('https://')){
       if (url.contains('ok.ru')) {
       return OkRu.get(url,debugMode);
    } else if (url.contains('dropbox.com')) {
     return DropBox.get(url);
    } else if (url.contains('solidfiles')) {
    return SolidFiles.get(url,debugMode);
    } else if (url.contains('drive.google.com')) {
    return GoogleDrive.get(url,debugMode);
    } else if (url.contains('fembed.com')) {
     return FEmbedFiles.get(url,debugMode);
    } else if (url.contains('youtube.com') ||
        url.contains('youtu.be') ||
        url.contains('fb.com') ||
        url.contains('facebook.com')) {
     return SocialDownloader.get(url,debugMode);
    } else if (url.contains('www.mediafire.com')) {
     return MediaFire.get(url,debugMode);
    } else if (url.contains('xnxx')) {
    return XNXX.get(url,debugMode);
    } else if (url.contains('vk.com')) {
     return VK.get(url,debugMode);
    } else {
     List<DGDirectLinkModel> links = [];
     links.add(DGDirectLinkModel(quality: 'Normal', link: url));
     return links;
    }
    }else{
       print('Only support http and https');
     List<DGDirectLinkModel> links = [];
     links.add(DGDirectLinkModel(quality: 'Normal', link: url));
     return links;
    
 
    }
    
 }

}
