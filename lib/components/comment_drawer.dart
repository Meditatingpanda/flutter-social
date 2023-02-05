import 'package:flutter/material.dart';

class CommentDrawer extends StatelessWidget {
  const CommentDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Text('Comments'),
      // Expanded(child: Container()),
      const SizedBox(height: 15),
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
      Expanded(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return const ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/cat.png'),
              ),
              title: Text('sussy baka'),
              subtitle: Text('Arigato gozaimasu'),
            );
          },
        ),
      ),
    ]);
  }
}
