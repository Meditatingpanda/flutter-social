import 'package:flutter/material.dart';

class NewPost extends StatefulWidget {
  const NewPost({super.key});

  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  @override
  Widget build(BuildContext context) {
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
              children: const [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/cat.png'),
                ),
                SizedBox(width: 10),
                Text('sussy baka'),
                SizedBox(width: 10),
                Text('@meditatingpanda', style: TextStyle(color: Colors.grey))
              ],
            ),
            const SizedBox(height: 15),
            TextFormField(
              minLines: 10,
              autofocus: true,
              maxLines: 30,
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
                  onPressed: () {},
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
