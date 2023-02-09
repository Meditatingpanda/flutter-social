import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/providers/home_provider.dart';
import 'package:shoppingapp/screens/profile_screen.dart';

class Following extends StatefulWidget {
  const Following({super.key});

  @override
  State<Following> createState() => _FollowingState();
}

class _FollowingState extends State<Following> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final homeNotifier = Provider.of<HomeProvider>(context, listen: false);
      await homeNotifier.fetchPostsFollowing();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text('Following'),
      ),
      backgroundColor: Colors.white,
      body: const FollowingBody(),
    );
  }
}

class FollowingBody extends StatelessWidget {
  const FollowingBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeNotifier = Provider.of<HomeProvider>(context);
    return homeNotifier.followings == null
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            shrinkWrap: true,
            itemCount: homeNotifier.followings?.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  children: [
                    ListTile(
                        leading: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profile(
                                          profileId: homeNotifier
                                              .followings?[index].id,
                                        )));
                          },
                          icon: CircleAvatar(
                            backgroundImage: NetworkImage(homeNotifier
                                    .followings?[index].profilePicture ??
                                ''),
                          ),
                        ),
                        title: Text(
                          homeNotifier.followings?[index].email ?? '',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(homeNotifier.followings?[index].email ?? '',
                                style: const TextStyle(color: Colors.grey)),
                            Text(homeNotifier.followings?[index].desc ?? '',
                                style: const TextStyle(color: Colors.black)),
                          ],
                        ),
                        trailing: OutlinedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              side: MaterialStateProperty.all(
                                  const BorderSide(color: Colors.grey))),
                          child: const Text(
                            'unfollow',
                            style: TextStyle(color: Colors.black),
                          ),
                        )),
                    const Divider(
                      height: 10,
                      thickness: 1,
                    )
                  ],
                ),
              );
            },
          );
  }
}
