import "package:flutter/material.dart";
import "package:shoppingapp/components/side_drawer.dart";
import "package:shoppingapp/screens/Tweet.dart";

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Confesso",
            style: TextStyle(fontSize: 18),
          ),
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
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
        drawer: const SideDrawer());
  }
}
