import 'package:flutter/material.dart';

import 'package:musicsync/group_chats/create_group/add_members.dart';
import 'package:musicsync/group_chats/group_chat_room.dart';
import 'package:musicsync/group_chats/group_chat_screen.dart';

class Sync extends StatefulWidget {
  const Sync({super.key});

  @override
  State<Sync> createState() => _SyncState();
}

class _SyncState extends State<Sync> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Center(
            child: Column(
              children: [
                Text(
                  'Connection',
                  style: TextStyle(fontSize: 120),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GroupChatHomeScreen()));

                    // Code to perform when the first button is pressed
                  },
                  child: Text('Host'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Code to perform when the second button is pressed
                  },
                  child: Text('Client'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
