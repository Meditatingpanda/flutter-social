import 'package:flutter/material.dart';

class CommentDrawer extends StatelessWidget {
  const CommentDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Column(children: [
          const SizedBox(height: 25),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
            child: Container(
              color: Colors.grey[200],
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/cat.png'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Add a comment...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.telegram_sharp),
                    iconSize: 40,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/cat.png'),
                    ),
                    title: const Text('sussy baka'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Text('@meditatingpanda',
                            style: TextStyle(color: Colors.grey[600])),
                        const SizedBox(height: 10),
                        const Text(
                          'Fear is not evil. It tells you what weakness is. And once you know your weakness, you can become stronger as well as kinder.',
                          style: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
