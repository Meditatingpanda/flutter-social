import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/providers/home_provider.dart';
import 'package:shoppingapp/screens/Tweet.dart';
import 'package:timeago/timeago.dart' as timeago;

class Profile extends StatefulWidget {
  final String? profileId;
  const Profile({Key? key, this.profileId}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final homeNotifier = Provider.of<HomeProvider>(context, listen: false);
      await homeNotifier.fetchUserData(widget.profileId!);
      await homeNotifier.fetchProfilePosts(widget.profileId!);
    });
  }

  @override
  Widget build(BuildContext context) {
    //  print(widget.profileId);
    final homeNotifier = Provider.of<HomeProvider>(context, listen: true);
    return Container(
      color: Colors.white,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          body: Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              // background image and bottom contents

              Column(
                children: <Widget>[
                  SizedBox(
                    height: 200.0,
                    // color: Colors.orange,
                    child: Center(
                      child: Image.network(
                        homeNotifier.user?.coverPicture ??
                            'https://beebom.com/wp-content/uploads/2022/10/Where-to-Watch-Chainsaw-Man-Anime.jpg?w=750&quality=75',
                        fit: BoxFit.cover,
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 200,
                  ),
                  Expanded(
                    child: homeNotifier.profilePosts == null
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            itemCount: homeNotifier.profilePosts?.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Tweet(
                                    index: index,
                                    avatar:
                                        homeNotifier.user?.profilePicture ?? '',
                                    username: homeNotifier.user?.username ?? '',
                                    name: homeNotifier.user?.email ?? '',
                                    timeAgo: timeago.format(homeNotifier
                                            .profilePosts?[index].createdAt ??
                                        DateTime.now()),
                                    text: homeNotifier
                                            .profilePosts?[index].desc ??
                                        '',
                                    comments: '46',
                                    retweets: '4K',
                                    favorites: homeNotifier.profilePosts?[index]
                                            .likes.length ??
                                        0,
                                  ),
                                  const Divider(
                                    height: 0,
                                    thickness: 1,
                                  ),
                                ],
                              );
                            },
                          ),
                  )
                ],
              ),
              // Profile image
              Positioned(
                top: 150.0, // (background container size) - (circle height / 2)
                child: profileDetails(context),
              ),
              Positioned(
                  top: 10,
                  left: 10,
                  child: CircleAvatar(
                    radius: 20,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.black,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

//profile details components

Widget profileDetails(BuildContext context) {
  final homeNotifier = Provider.of<HomeProvider>(context, listen: true);
  return Container(
    color: Colors.white,
    width: MediaQuery.of(context).size.width,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: 80.0,
                width: 80.0,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.lightBlue),
                child: Center(
                    child: CircleAvatar(
                  radius: 34.0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(homeNotifier.user?.profilePicture ??
                            'https://i.pinimg.com/originals/cb/00/35/cb003519395b56d948f9e43067ff770f.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    // child: Image.network(
                    //   homeNotifier.user?.profilePicture ?? '',
                    // ),
                  ),

                  //backgroundImage: ,
                  // backgroundImage: Image.network(homeNotifier.user?.profilePicture),
                )),
              ),
              TextButton(
                  onPressed: () {
                    showModalBottomSheet<void>(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0)),
                      ),
                      builder: (BuildContext context) {
                        return Container(
                            height: 500,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0)),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: editProfile(context)));
                      },
                    );
                  },
                  child: const Text('Edit Profile')),
            ],
          ),
          Text(homeNotifier.user?.username ?? '',
              style: const TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              )),
          Text('@${homeNotifier.user?.email}',
              style: const TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w300,
              )),
          const SizedBox(
            height: 10.0,
          ),
          const Text('Bio',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              )),
          Text(
            homeNotifier.user?.desc ?? '',
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(children: [
            Row(
              children: const [
                Icon(
                  Icons.calendar_month,
                  size: 15.0,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text('Joined may 2021',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w300,
                    )),
              ],
            ),
            const SizedBox(
              width: 20.0,
            ),
            Row(
              children: const [
                Icon(
                  Icons.link,
                  size: 15.0,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text('https://gyanaranjanpanda.com',
                    style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.blue,
                      fontWeight: FontWeight.w300,
                    )),
              ],
            )
          ]),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Row(children: [
                Text(homeNotifier.user?.following.length.toString() ?? 'null',
                    style: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                    )),
                const SizedBox(
                  width: 5.0,
                ),
                const Text('Following',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w300,
                    )),
              ]),
              const SizedBox(
                width: 20.0,
              ),
              Row(children: [
                Text(homeNotifier.user?.followers.length.toString() ?? 'null',
                    style: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                    )),
                const SizedBox(
                  width: 5.0,
                ),
                const Text('Followers',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w300,
                    )),
              ]),
            ],
          ),
          const SizedBox(
            height: 10.0,
          )
        ],
      ),
    ),
  );
}

//edit profile widget

Widget editProfile(BuildContext context) {
  return Expanded(
    child: Form(
        child: Column(
      children: [
        const Text(
          'Edit Profile',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Name',
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Bio',
          ),
          minLines: 3,
          maxLines: 6,
        ),
        const SizedBox(
          height: 10.0,
        ),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Location',
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Website',
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Save'),
        )
      ],
    )),
  );
}
