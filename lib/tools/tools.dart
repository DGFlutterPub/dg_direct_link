import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

class Tools {

static String windowAgent =
      "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.99 Safari/537.36";


 static Future<dom.Document?> requestSite(String url,
      {Map<String, String>? header}) async {
    try {
      final uri = Uri.parse(url);
      final response = await http.get(uri, headers: header);
      dom.Document html = dom.Document.html(response.body);
  
      return html;
    } catch (e) {
      return null;
    }
  }
}