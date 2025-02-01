// import 'dart:convert';

// import 'package:http/http.dart' as http;
// class GeminiAPI {
//   static const String _apiKey = "AIzaSyBIxsqlXX4i9ysY-e3yT6Y6Io-l_m4jnsw"; 
//   static const String _baseUrl = "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent";

//   static Future<String> getResponse(String prompt) async {
//     try {
//       final response = await http.post(
//         Uri.parse("$_baseUrl?key=$_apiKey"),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode({
//           "contents": [{
//             "parts": [{"text": prompt}]
//           }]
//         }),
//       );

//       if (response.statusCode == 200) {
//         var data = jsonDecode(response.body);
//         return data['candidates'][0]['content']['parts'][0]['text'];
//       } else {
//         return "Error: ${response.statusCode}";
//       }
//     } catch (e) {
//       return "Error: $e";
//     }
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiAPI {
  static const String _apiKey = "AIzaSyBIxsqlXX4i9ysY-e3yT6Y6Io-l_m4jnsw";
  static const String _baseUrl = "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent";

  static Future<String> getResponse(String prompt) async {
    try {
      final response = await http.post(
        Uri.parse("$_baseUrl?key=$_apiKey"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "contents": [{
            "parts": [{"text": prompt}]
          }]
        }),
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        return data['candidates'][0]['content']['parts'][0]['text'];
      } else {
        return "Error: ${response.statusCode}";
      }
    } catch (e) {
      return "Error: $e";
    }
  }
}
