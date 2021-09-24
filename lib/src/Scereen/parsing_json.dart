import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:networking/src/Services/networking.dart';

class PasrsingJson extends StatefulWidget {
  const PasrsingJson({Key? key}) : super(key: key);

  @override
  _PasrsingJsonState createState() => _PasrsingJsonState();
}

class _PasrsingJsonState extends State<PasrsingJson> {
  Future? data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = getData();
  }

  Future getData() async {
    var data;
    String url = 'https://jsonplaceholder.typicode.com/posts';
    Network network = Network(url);
    data = network.fetchData();

    // data.then((value) {
    //   print(value[0]['title']);
    // });

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Parsing Json"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: FutureBuilder(
                future: getData(),
                builder: (context, AsyncSnapshot snapspot) {
                  if (snapspot.hasData) {
                    return createListView (snapspot.data, context);
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
          ),
        ),
      ),
    );
  }
  
//method to display list and will wnat like id,userId,title,body
  Widget createListView(List data, BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, int index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  title: Text('${data[index]['title']}'),
                  subtitle: Text("${data[index]['body']}"),
                  leading: Column(
                    children: const [
                      // CircleAvatar(
                      //     backgroundColor: Colors.black26,
                      //     radius: 23,
                      //     child: Text('${data[index]['userId']}')
                      //     ),
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
