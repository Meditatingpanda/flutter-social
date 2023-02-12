import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppingapp/api/api.dart';
import 'package:shoppingapp/models/followers_model.dart';
import 'package:shoppingapp/models/following_model.dart';
import 'package:shoppingapp/models/posts_model.dart';
import 'package:http/http.dart' as http;
import 'package:shoppingapp/models/profile_model.dart';
import 'package:shoppingapp/models/user_model.dart';
import 'package:shoppingapp/screens/login_screen.dart';

class HomeProvider with ChangeNotifier {
  List<PostsModel>? posts;
  List<ProfileUserModel>? profilePosts;
  List<FollowingModel>? followings;
  List<FollowersModel>? followers;
  UserModel? user;
  final TextEditingController desc = TextEditingController();
  late String currentUserId;
  final Map<String, dynamic> post = {
    "userId": "",
    "desc": "",
    "img": "",
  };
  void setUserId(String userId) {
    currentUserId = userId;
  }

  Future fetchPosts() async {
    final pref = await SharedPreferences.getInstance();
    var userData = jsonDecode(pref.getString('User')!);
    setUserId(userData["_id"]);
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
    posts!.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    fetchUserData(currentUserId);
    notifyListeners();
  }

  void createPost() async {
    final pref = await SharedPreferences.getInstance();
    var userData = jsonDecode(pref.getString('User')!);

    post["userId"] = userData["_id"];
    post["desc"] = desc.text;
    final uri = Uri.parse("${Api.BASE_URL}/posts");
    await http.post(uri,
        headers: {
          "Content-Type": "application/json",
          "accept": "application/json",
          "Access-Control-Allow-Origin": "https://confesso-2.web.app"
        },
        body: jsonEncode(post));
    // print(res.body);
    fetchPosts();
    desc.clear();
  }

  void likePost(int index) async {
    final pref = await SharedPreferences.getInstance();
    var userData = jsonDecode(pref.getString('User')!);

    final currentUser = {
      "userId": userData["_id"],
    };
    final uri = Uri.parse("${Api.BASE_URL}/posts/${posts![index].id}/like");
    await http.put(uri,
        headers: {
          "Content-Type": "application/json",
          "accept": "application/json",
          "Access-Control-Allow-Origin": "https://confesso-2.web.app"
        },
        body: jsonEncode(currentUser));
    //print(res.body);
    fetchPosts();
  }

  bool checkIsLiked(int index) {
    //print(index);
    if ((index < posts!.length) &&
        posts![index].likes.contains(currentUserId)) {
      return true;
    } else {
      return false;
    }
  }

  Future fetchUserData(String userId) async {
    final uri = Uri.parse("${Api.BASE_URL}/users/?userId=$userId");
    var res = await http.get(uri, headers: {
      "Content-Type": "application/json",
      "accept": "application/json",
      "Access-Control-Allow-Origin": "https://confesso-2.web.app"
    });
    // print(res.body);
    user = userModelFromJson(res.body);

    notifyListeners();
  }

  Future fetchProfilePosts(String userId) async {
    final uri = Uri.parse("${Api.BASE_URL}/posts/?userId=$userId");
    var res = await http.get(uri, headers: {
      "Content-Type": "application/json",
      "accept": "application/json",
      "Access-Control-Allow-Origin": "https://confesso-2.web.app"
    });
    // print(res.body);
    profilePosts = profileUserModelFromJson(res.body);
    profilePosts!.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    notifyListeners();
  }

  void fetchPostsUniversal() async {}
  Future fetchPostsFollowing() async {
    final pref = await SharedPreferences.getInstance();
    var userData = jsonDecode(pref.getString('User')!);
    setUserId(userData["_id"]);
    final currentUser = {
      "userId": userData["_id"],
    };
    final uri =
        Uri.parse("${Api.BASE_URL}/users/${currentUser["userId"]}/following");
    var res = await http.get(uri, headers: {
      "Content-Type": "application/json",
      "accept": "application/json",
      "Access-Control-Allow-Origin": "https://confesso-2.web.app"
    });
    // print(res.body);
    followings = followingModelFromJson(res.body);
    notifyListeners();
  }

  Future fetchPostsFollowers() async {
    final pref = await SharedPreferences.getInstance();
    var userData = jsonDecode(pref.getString('User')!);
    setUserId(userData["_id"]);
    final currentUser = {
      "userId": userData["_id"],
    };
    final uri =
        Uri.parse("${Api.BASE_URL}/users/${currentUser["userId"]}/followers");
    var res = await http.get(uri, headers: {
      "Content-Type": "application/json",
      "accept": "application/json",
      "Access-Control-Allow-Origin": "https://confesso-2.web.app"
    });
    // print(res.body);
    followers = followersModelFromJson(res.body);
    notifyListeners();
  }

  void followUser() async {}
  void logout(context) async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Login()));
  }

  Future deletePost(int index) async {
    // print(posts![index].id);
    final uri = Uri.parse("${Api.BASE_URL}/posts/${posts![index].id}");
    var res = await http.delete(uri,
        headers: {
          "Content-Type": "application/json",
          "accept": "application/json",
          "Access-Control-Allow-Origin": "https://confesso-2.web.app"
        },
        body: jsonEncode({
          "userId": currentUserId,
        }));
    // print(res);
    fetchPosts();
  }

  bool checkIsPossibleToDelete(int index) {
    if (posts![index].userId == currentUserId) {
      return true;
    } else {
      return false;
    }
  }
}
