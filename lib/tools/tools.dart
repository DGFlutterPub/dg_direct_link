import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

class Tools {
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