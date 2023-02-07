import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppingapp/api/api.dart';
import 'package:shoppingapp/models/posts_model.dart';
import 'package:http/http.dart' as http;

class HomeProvider with ChangeNotifier {
  late List<PostsModel> posts;
  final Map<String, dynamic> post = {
    "userId": "",
    "desc": "",
    "img": "",
  };

  void fetchPosts() async {
    final pref = await SharedPreferences.getInstance();
    var userData = jsonDecode(pref.getString('User')!);

    final currentUser = {
      "userId": userData["_id"],
    };
    final uri = Uri.parse(
        "${Api.BASE_URL}/posts/timeline/all?userId=${currentUser["userId"]}");
    var res = await http.get(uri, headers: {
      "Content-Type": "application/json",
      "accept": "application/json",
      "Access-Control-Allow-Origin": "https://confesso-2.web.app"
    });

    posts = postsModelFromJson(res.body);
    notifyListeners();
  }

  void createPost() async {}
  void likePost() async {}
  void fetchPostsUniversal() async {}
  void fetchPostsFollowing() async {}
  void fetchPostsFollowers() async {}
  void followUser() async {}
  void logout() async {}
  

}
