import 'dart:convert';

import 'package:http/http.dart' as http;

class Network {
  final String? url;

  Network(
    this.url,
  );

  Future fetchData() async {
    print(url);
    http.Response response = await http.get(Uri.parse(url!));

    if (response.statusCode == 200) {
      String data = response.body;

      // var title = json.decode(data)[0]['title'];
      // print(title);
      // print(data);
      return json.decode(data);
    } else {
      // return response.hashCode;
      print(response.statusCode);
    }
  }
}
