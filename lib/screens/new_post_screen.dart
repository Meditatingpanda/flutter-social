import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/providers/home_provider.dart';

class NewPost extends StatefulWidget {
  const NewPost({super.key});

  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final homeNotifier = Provider.of<HomeProvider>(context, listen: false);
      await homeNotifier.fetchUserData(homeNotifier.currentUserId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeNotifier = Provider.of<HomeProvider>(context, listen: true);
    //  print(user?.email);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('New Post'),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(homeNotifier
                          .user?.profilePicture ??
                      'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png'),
                ),
                const SizedBox(width: 10),
                Text(homeNotifier.user?.username ?? 'dummy@gmail.com'),
                const SizedBox(width: 10),
                Text("@${homeNotifier.user?.email}",
                    style: const TextStyle(color: Colors.grey))
              ],
            ),
            const SizedBox(height: 15),
            TextFormField(
              minLines: 10,
              autofocus: true,
              maxLines: 30,
              autocorrect: false,
              controller: homeNotifier.desc,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'What\'s on your mind?',
              ),
            ),
            const SizedBox(height: 15),
            const SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: OutlinedButton(
                  onPressed: () {
                    homeNotifier.createPost();

                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Post',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )),
            ),
          ],
        ),
      )),
    );
  }
}
