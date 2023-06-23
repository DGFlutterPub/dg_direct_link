import 'dart:async';
import 'dart:convert';
import 'package:dg_direct_link/dg_direct_link.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:html/parser.dart';

import '../models/dg_direct_link_model.dart';

class SocialDownloader {
 
  static Future<List<DGDirectLinkModel>> get(String url,bool debugMode) async {
  
   final List<DGDirectLinkModel> links = [];
    final Completer<List<DGDirectLinkModel>> c = Completer<List<DGDirectLinkModel>>();
    HeadlessInAppWebView(
      initialUrlRequest: URLRequest(
          url: Uri.parse('https://en.savefrom.net')),
      onLoadStop: (controller, url) async {
        await controller.evaluateJavascript(source: '''
document.querySelector('#sf_url').value = '$url'
document.querySelector('#sf_submit').click()
''');
        var data = await Future.delayed(const Duration(seconds: 3), () async {
          var htm = await controller.getHtml();
          var document = parse(htm);

          try {
            String? thumbnail = document
                .querySelector(".media-result .clip img")
                ?.attributes['src'];

            var info = document.querySelector(".info-box");
            List<dom.Element> linkGroup = [
              ...info!.querySelectorAll(".link-group a")
            ];

            linkGroup.map((element) {
              String? href = element.attributes['href'];
              String? text = element.text;
            print(href.toString());
            
            links.add(DGDirectLinkModel(
                  quality: text.toString(), link: href.toString()));
              c.complete(links);
            }).toList();
          } catch (e) {
            
          }
       
        });
      },
    )
      ..run()
      ..dispose();

      return c.future;
  }
 }