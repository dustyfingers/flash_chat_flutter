import 'package:flutter/material.dart';

import 'package:flash_chat_flutter/constants.dart';

class MessageBubble extends StatelessWidget {
  final String sender;
  final String text;
  final String currentUser;

  MessageBubble({
    @required this.sender,
    @required this.text,
    @required this.currentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: sender == currentUser
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black45,
            ),
          ),
          Material(
            borderRadius: sender == currentUser
                ? kCurrentUserSenderBorderRadius
                : kOtherSenderBorderRadius,
            elevation: 3.0,
            color:
                sender == currentUser ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 10.0,
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: sender == currentUser ? Colors.white : Colors.black54,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
