import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:shoppingapp/components/side_drawer.dart";
import "package:shoppingapp/screens/Tweet.dart";
import "package:shoppingapp/screens/new_post_screen.dart";

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
    return Scaffold(
        key: _drawerKey,
        appBar: AppBar(
          elevation: 0.0,
          title: const Text(
            "Confesso",
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          leadingWidth: 35,
          leading: Container(
            transform: Matrix4.translationValues(10, 0, 0),
            height: 20.0,
            width: 20.0,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.black),
            child: Center(
                child: InkWell(
              onTap: () {
                _drawerKey.currentState!.openDrawer();
              },
              child: const CircleAvatar(
                radius: 15.0,
                backgroundImage: AssetImage('assets/images/cat.png'),
              ),
            )),
          ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              color: Colors.black,
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: const [
                Tweet(
                  avatar:
                      'https://pbs.twimg.com/profile_images/1604830369718509568/-UJI_bRL_400x400.jpg',
                  username: 'Flutter',
                  name: 'FlutterDev',
                  timeAgo: '5m',
                  text:
                      'Google’s UI toolkit to build apps for mobile, web, & desktop from a single codebase.',
                  comments: '243',
                  retweets: '23K',
                  favorites: '112K',
                ),
                SizedBox(height: 10),
                Tweet(
                  avatar:
                      'https://pbs.twimg.com/profile_images/1604830369718509568/-UJI_bRL_400x400.jpg',
                  username: 'Flutter en Español',
                  name: 'EsFlutter',
                  timeAgo: '12m',
                  text: 'Comunidad Flutter de habla hispana!',
                  comments: '46',
                  retweets: '4K',
                  favorites: '17K',
                ),
                SizedBox(height: 10),
                Tweet(
                  avatar:
                      'https://pbs.twimg.com/profile_images/1604830369718509568/-UJI_bRL_400x400.jpg',
                  username: 'Android Dev',
                  name: 'AndroidDev',
                  timeAgo: '20m',
                  text:
                      'News and announcements for developers from the Android team.',
                  comments: '305',
                  retweets: '20K',
                  favorites: '1M',
                ),
                SizedBox(height: 10),
                Tweet(
                  avatar:
                      'https://pbs.twimg.com/profile_images/1604830369718509568/-UJI_bRL_400x400.jpg',
                  username: 'Android Dev',
                  name: 'AndroidDev',
                  timeAgo: '20m',
                  text:
                      'News and announcements for developers from the Android team.',
                  comments: '305',
                  retweets: '20K',
                  favorites: '1M',
                ),
                SizedBox(height: 10),
                Tweet(
                  avatar:
                      'https://pbs.twimg.com/profile_images/1604830369718509568/-UJI_bRL_400x400.jpg',
                  username: 'Android Dev',
                  name: 'AndroidDev',
                  timeAgo: '20m',
                  text:
                      'News and announcements for developers from the Android team.',
                  comments: '305',
                  retweets: '20K',
                  favorites: '1M',
                ),
                SizedBox(height: 10),
                Tweet(
                  avatar:
                      'https://pbs.twimg.com/profile_images/1604830369718509568/-UJI_bRL_400x400.jpg',
                  username: 'Android Dev',
                  name: 'AndroidDev',
                  timeAgo: '20m',
                  text:
                      'News and announcements for developers from the Android team.',
                  comments: '305',
                  retweets: '20K',
                  favorites: '1M',
                ),
                SizedBox(height: 10),
                Tweet(
                  avatar:
                      'https://pbs.twimg.com/profile_images/1604830369718509568/-UJI_bRL_400x400.jpg',
                  username: 'Android Dev',
                  name: 'AndroidDev',
                  timeAgo: '20m',
                  text:
                      'News and announcements for developers from the Android team.',
                  comments: '305',
                  retweets: '20K',
                  favorites: '1M',
                ),
                SizedBox(height: 10),
                Tweet(
                  avatar:
                      'https://pbs.twimg.com/profile_images/1604830369718509568/-UJI_bRL_400x400.jpg',
                  username: 'Android Dev',
                  name: 'AndroidDev',
                  timeAgo: '20m',
                  text:
                      'News and announcements for developers from the Android team.',
                  comments: '305',
                  retweets: '20K',
                  favorites: '1M',
                ),
                SizedBox(height: 10),
                Tweet(
                  avatar:
                      'https://pbs.twimg.com/profile_images/1604830369718509568/-UJI_bRL_400x400.jpg',
                  username: 'Android Dev',
                  name: 'AndroidDev',
                  timeAgo: '20m',
                  text:
                      'News and announcements for developers from the Android team.',
                  comments: '305',
                  retweets: '20K',
                  favorites: '1M',
                ),
                SizedBox(height: 10),
                Tweet(
                  avatar:
                      'https://pbs.twimg.com/profile_images/1604830369718509568/-UJI_bRL_400x400.jpg',
                  username: 'Android Dev',
                  name: 'AndroidDev',
                  timeAgo: '20m',
                  text:
                      'News and announcements for developers from the Android team.',
                  comments: '305',
                  retweets: '20K',
                  favorites: '1M',
                ),
                SizedBox(height: 10),
                Tweet(
                  avatar:
                      'https://pbs.twimg.com/profile_images/1604830369718509568/-UJI_bRL_400x400.jpg',
                  username: 'Android Dev',
                  name: 'AndroidDev',
                  timeAgo: '20m',
                  text:
                      'News and announcements for developers from the Android team.',
                  comments: '305',
                  retweets: '20K',
                  favorites: '1M',
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
            Navigator.push(
              context,
              CupertinoPageRoute(
                  fullscreenDialog: true,
                  builder: (context) => const NewPost()),
            );
          },
          child: const Icon(Icons.add),
        ),
        drawer: const SideDrawer());
  }
}
