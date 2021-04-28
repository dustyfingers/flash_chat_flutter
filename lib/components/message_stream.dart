import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'message_bubble.dart';

class MessageStream extends StatelessWidget {
  final _firestore = FirebaseFirestore.instance;
  String currentUserEmail;

  MessageStream({@required this.currentUserEmail});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestore
          .collection('messages')
          .orderBy('created_at', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        List<MessageBubble> messageBubbles = [];

        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        } else {
          final messages = snapshot.data.docs;
          for (var message in messages) {
            final String messageText = message.data()['text'].toString();
            final String messageSender = message.data()['sender'];
            final messageBubble = MessageBubble(
              text: messageText,
              sender: messageSender,
              currentUser: currentUserEmail,
            );
            messageBubbles.add(messageBubble);
          }

          return Expanded(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 20.0,
              ),
              children: messageBubbles,
            ),
          );
        }
      },
    );
  }
}
