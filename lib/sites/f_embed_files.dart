import 'dart:convert';

import '../models/dg_direct_link_model.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

import '../tools/tools.dart';


class FEmbedFiles {
 
  static Future<List<DGDirectLinkModel>> get(String url,bool debugMode) async {
    final List<DGDirectLinkModel> links = [];
    String? id = RegExp("(v|f)(\\/|=)(.+)(\\/|&)?", multiLine: true)
        .firstMatch(url)!
        .group(3)!
        .replaceAll("&|/", "");

    String reUrl = "https://www.fembed.com/api/source/$id";
   
    await Tools.requestSite(reUrl).then((value) async {
      
          try {
        final response = await http.post(Uri.parse(reUrl));

        var data = jsonDecode(response.body);

        for (int i = 0; i < data['data'].length; i++) {
          links.add(DGDirectLinkModel(
              quality: data['data'][i]['label'],
              link: data['data'][i]['file']));
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
/*
     static Future<List<DGDirectLinkModel>> get(String url,bool debugMode) async {
   final List<DGDirectLinkModel> links = [];
    await Tools.requestSite(url).then((value){
      
    }).onError((error, stackTrace) {
       if(debugMode){
          print(error.toString());
          print(stackTrace.toString());
        }
        return [];
    });

   return [];
  }*/