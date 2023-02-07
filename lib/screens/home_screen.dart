import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:shoppingapp/components/side_drawer.dart";
import "package:shoppingapp/providers/home_provider.dart";
import "package:shoppingapp/screens/Tweet.dart";
import "package:shoppingapp/screens/new_post_screen.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    final homeNotifier = Provider.of<HomeProvider>(context, listen: false);
    //homeNotifier.setUserData();
    homeNotifier.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    //final homeNotifier = Provider.of<HomeProvider>(context, listen: true);

    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
          key: _drawerKey,
          appBar: AppBar(
            elevation: 0.0,
            bottom: const TabBar(tabs: [
              Tab(
                child: Text(
                  "Home",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Tab(
                child: Text(
                  "Explore",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ]),
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
                radius: 30,
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
          body: TabBarView(children: [
            ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const Tweet(
                    avatar:
                        'https://pbs.twimg.com/profile_images/1604830369718509568/-UJI_bRL_400x400.jpg',
                    username: 'Gyana',
                    name: 'meditatingpanda',
                    timeAgo: '5m',
                    text:
                        'People, who can’t throw something important away, can never hope to change anything.',
                    comments: '243',
                    retweets: '23K',
                    favorites: '112K',
                  );
                }),
            ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const Tweet(
                    avatar:
                        'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/32b8f7d9-0d6c-4e2f-b737-eea02c841b00/deo8pg7-d9539697-f5a8-4e09-a5ff-e9b73f829512.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzMyYjhmN2Q5LTBkNmMtNGUyZi1iNzM3LWVlYTAyYzg0MWIwMFwvZGVvOHBnNy1kOTUzOTY5Ny1mNWE4LTRlMDktYTVmZi1lOWI3M2Y4Mjk1MTIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.1Grgns0aCw7M8tX6Yq40-dPpxMvy5Ccp3O1w4suLv8U',
                    username: 'Madara',
                    name: 'ghostOfUchiha',
                    timeAgo: '5m',
                    text:
                        'The concept of hope is nothing more than giving up. A word that holds no true meaning',
                    comments: '243',
                    retweets: '23K',
                    favorites: '112K',
                  );
                }),
          ]),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Add your onPressed code here!
              Navigator.push(
                context,
                MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (context) => const NewPost()),
              );
            },
            child: const Icon(Icons.add),
          ),
          drawer: const SideDrawer()),
    );
  }
}
