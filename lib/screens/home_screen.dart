import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:shoppingapp/components/side_drawer.dart";
import "package:shoppingapp/providers/home_provider.dart";
import "package:shoppingapp/screens/Tweet.dart";
import "package:shoppingapp/screens/new_post_screen.dart";
import 'package:timeago/timeago.dart' as timeago;
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final homeNotifier = Provider.of<HomeProvider>(context, listen: false);
      await homeNotifier.fetchPosts();
    });
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    // await Future.delayed(const Duration(milliseconds: 1000));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final homeNotifier = Provider.of<HomeProvider>(context, listen: false);
      await homeNotifier.fetchPosts();
    });
    _refreshController.loadComplete();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final homeNotifier = Provider.of<HomeProvider>(context, listen: false);
      await homeNotifier.fetchPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeNotifier = Provider.of<HomeProvider>(context, listen: true);
    //print(homeNotifier.posts?.length);
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
                child: CircleAvatar(
                  radius: 15.0,
                  backgroundImage:
                      NetworkImage(homeNotifier.user?.profilePicture ?? ''),
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
            homeNotifier.posts == null
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  )
                : SmartRefresher(
                    controller: _refreshController,
                    onRefresh: _onRefresh,
                    onLoading: _onLoading,
                    header: const WaterDropMaterialHeader(
                      backgroundColor: Colors.black,
                    ),
                    enablePullDown: true,
                    enablePullUp: true,
                    child: ListView.builder(
                        itemCount: homeNotifier.posts?.length,
                        itemBuilder: (context, index) {
                          return Tweet(
                            avatar: homeNotifier.posts?[index].profilePic ?? '',
                            username: homeNotifier.posts?[index].email ??
                                'dummy name',
                            name: homeNotifier.posts?[index].username ??
                                'dummy name',
                            timeAgo: timeago.format(
                                homeNotifier.posts?[index].createdAt ??
                                    DateTime.now()),
                            text:
                                homeNotifier.posts?[index].desc ?? 'dummy text',
                            comments: '69',
                            index: index,
                            retweets: '23K',
                            favorites:
                                homeNotifier.posts?[index].likes.length ?? 0,
                          );
                        }),
                  ),
            ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Tweet(
                    avatar:
                        'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/32b8f7d9-0d6c-4e2f-b737-eea02c841b00/deo8pg7-d9539697-f5a8-4e09-a5ff-e9b73f829512.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzMyYjhmN2Q5LTBkNmMtNGUyZi1iNzM3LWVlYTAyYzg0MWIwMFwvZGVvOHBnNy1kOTUzOTY5Ny1mNWE4LTRlMDktYTVmZi1lOWI3M2Y4Mjk1MTIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.1Grgns0aCw7M8tX6Yq40-dPpxMvy5Ccp3O1w4suLv8U',
                    username: 'Madara',
                    name: 'ghostOfUchiha',
                    timeAgo: '5m',
                    index: index,
                    text:
                        'The concept of hope is nothing more than giving up. A word that holds no true meaning',
                    comments: '243',
                    retweets: '23K',
                    favorites: 0,
                  );
                }),
          ]),
          floatingActionButton: FloatingActionButton(
            foregroundColor: Colors.white,
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
