import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:networking/src/Services/networking_map.dart';
import 'package:networking/src/model/post.dart';

class JsonParsingMap extends StatefulWidget {
  const JsonParsingMap({Key? key}) : super(key: key);

  @override
  _JsonParsingMapState createState() => _JsonParsingMapState();
}

class _JsonParsingMapState extends State<JsonParsingMap> {
  Future<PostList>? data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NetworkMap networkMap =
        NetworkMap('https://jsonplaceholder.typicode.com/posts');
    data = networkMap.loadPosts();
  }

  // Widget

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PODO")),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: FutureBuilder(
              future: data,
              builder: (context, AsyncSnapshot<PostList> snapshot) {
                List<Post> allposts;
                if (snapshot.hasData) {
                  allposts = snapshot.data!.posts!;
                  return createListView(allposts, context);
                  // Text('${allposts[5].body}');
                } else {
                  return CircularProgressIndicator();
                }
              }),
        ),
      ),
    );
  }

  Widget createListView(List<Post> data, BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, int index) {
            return Column(
              children: [
                const Divider(
                  height: 5.0,
                ),
                ListTile(
                  title: Text('${data[index].title}'),
                  subtitle: Text('${data[index].body}'),
                  leading: Column(
                      children: [
                        CircleAvatar(
                        backgroundColor: Colors.amber,
                        radius: 23,
                        child: Text('${data[index].id}'),
                        ),
                      ],
                  ),
                  ),    
              ],
            );
          }),
    );
  }
}
