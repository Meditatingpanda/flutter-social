import 'package:flutter/material.dart';
import 'package:shoppingapp/screens/Tweet.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          title: const Text("Profile"),
          centerTitle: true,
        ),
      ),
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
                  child: Image.asset(
                    'assets/images/cat.png',
                    fit: BoxFit.cover,
                    height: 200,
                  ),
                ),
              ),
              const SizedBox(
                height: 200,
              ),
              Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                children: const [
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
                    username: 'Flutter en Español',
                    name: 'EsFlutter',
                    timeAgo: '12m',
                    text: 'Comunidad Flutter de habla hispana!',
                    comments: '46',
                    retweets: '4K',
                    favorites: '17K',
                  ),
                  SizedBox(height: 10),
                ],
              )))
            ],
          ),
          // Profile image
          Positioned(
            top: 150.0, // (background container size) - (circle height / 2)
            child: profileDetails(context),
          )
        ],
      ),
    );
  }
}

//profile details components

Widget profileDetails(BuildContext context) {
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
                    shape: BoxShape.circle, color: Colors.black),
                child: const Center(
                    child: CircleAvatar(
                  radius: 37.0,
                  backgroundImage: AssetImage('assets/images/cat.png'),
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
          const Text('Gyana Ranjan Panda',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              )),
          const Text('@meditatingpanda',
              style: TextStyle(
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
          const Text(
            "Frontend Intern @tweepsbookcom ,Ex-Intern at FelvinSearch,20🧑‍💻 JavaScript Developer Tweets About Web Development & My Learning Journeys || CSE Undergrad",
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
                Text('Joined April 2022',
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
              Row(children: const [
                Text('1,000',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                    )),
                SizedBox(
                  width: 5.0,
                ),
                Text('Following',
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w300,
                    )),
              ]),
              const SizedBox(
                width: 20.0,
              ),
              Row(children: const [
                Text('1M',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                    )),
                SizedBox(
                  width: 5.0,
                ),
                Text('Followers',
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
