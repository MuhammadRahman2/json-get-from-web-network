import 'dart:convert';

import 'package:http/http.dart';
import 'package:networking/src/model/post.dart';

class NetworkMap {
  final String? url;

  NetworkMap(
    this.url,
  );

  Future<PostList> loadPosts() async {
    print(url);
    Response response = await get(Uri.parse(url!));
    if (response.statusCode == 200) {
      return PostList.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to get Post");
    }
  }
}