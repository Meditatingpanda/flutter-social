import 'package:flutter/material.dart';

class Following extends StatelessWidget {
  const Following({super.key});

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
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 30,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage('assets/images/cat.png'),
              ),
              title: const Text(
                'Gyana Ranjan Panda',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('@meditatingpanda',
                      style: TextStyle(color: Colors.grey)),
                  Text('Give me a break!',
                      style: TextStyle(color: Colors.black)),
                ],
              ),
              trailing: OutlinedButton(
                onPressed: () {},
                style: ButtonStyle(
                    side: MaterialStateProperty.all(
                        const BorderSide(color: Colors.grey))),
                child: const Text(
                  'Following',
                  style: TextStyle(color: Colors.black),
                ),
              )),
        );
      },
    );
  }
}
