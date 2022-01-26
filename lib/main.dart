import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final url = "https://jsonplaceholder.typicode.com/posts";

  // SEND POST
  void postData() async {
    try {
      final response = await post(Uri.parse(url), body: {
        "title": "Anything",
        "body": "Post Body",
        "userId": "1",
      });

      debugPrint(response.body);
    } catch (er) {}
  }

// GET DATA
  // var _postsJson = [];
  //
  // void fetchPosts() async {
  //   try {
  //     final response = await get(Uri.parse(url));
  //     final jsonData = jsonDecode(response.body) as List;
  //     setState(() {
  //       _postsJson = jsonData;
  //     });
  //   } catch (err) {}
  // }
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   fetchPosts();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: postData,
            child: const Text("Send Post"),
          ),
        ),
        // ListView.builder(
        //   itemBuilder: (context, i) {
        //     final post = _postsJson[i];
        //     return Text("Title: ${post["title"]}\n Body: ${post["body"]}\n\n");
        //   },
        //   itemCount: _postsJson.length,
        // ),
      ),
    );
  }
}
