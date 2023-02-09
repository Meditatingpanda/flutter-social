import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/providers/home_provider.dart';
import 'package:shoppingapp/screens/profile_screen.dart';

class Followers extends StatefulWidget {
  const Followers({super.key});

  @override
  State<Followers> createState() => _FollowersState();
}

class _FollowersState extends State<Followers> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final homeNotifier = Provider.of<HomeProvider>(context, listen: false);
      await homeNotifier.fetchPostsFollowers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Text('Followers'),
      ),
      backgroundColor: Colors.white,
      body: const FollowersBody(),
    );
  }
}

class FollowersBody extends StatelessWidget {
  const FollowersBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeNotifier = Provider.of<HomeProvider>(context);
    return homeNotifier.followers == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: homeNotifier.followers?.length ?? 0,
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
                                          profileId:
                                              homeNotifier.followers?[index].id,
                                        )));
                          },
                          icon: CircleAvatar(
                            backgroundImage: NetworkImage(
                                homeNotifier.followers?[index].profilePicture ??
                                    ''),
                          ),
                        ),
                        title: Text(
                          homeNotifier.followers?[index].username ??
                              'dummy title',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('@${homeNotifier.followers?[index].email}',
                                style: const TextStyle(color: Colors.grey)),
                            Text(homeNotifier.followers?[index].desc ?? '',
                                style: const TextStyle(color: Colors.black)),
                          ],
                        ),
                        trailing: OutlinedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                              side: MaterialStateProperty.all(
                                  const BorderSide(color: Colors.grey))),
                          child: const Text(
                            'Follow Back',
                            style: TextStyle(color: Colors.black),
                          ),
                        )),
                    const Divider(
                      color: Colors.grey,
                    )
                  ],
                ),
              );
            },
          );
  }
}
