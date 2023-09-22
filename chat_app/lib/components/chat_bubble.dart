import 'package:chat_app/constant.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ChatBubble extends StatelessWidget {
  ChatBubble({required this.message});

  MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsetsDirectional.only(
          start: 16,
          bottom: 32,
          end: 32,
          top: 32,
        ),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(32),
              topStart: Radius.circular(32),
              bottomEnd: Radius.circular(32)),
        ),
        child: Text(
          message.message,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class ChatBubbleForFriend extends StatelessWidget {
  ChatBubbleForFriend({required this.message});

  MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsetsDirectional.only(
          start: 16,
          bottom: 32,
          end: 32,
          top: 32,
        ),
        decoration: BoxDecoration(
          color: Color(0xff006D84),
          borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(32),
              topStart: Radius.circular(32),
              bottomStart: Radius.circular(32)),
        ),
        child: Text(
          message.message,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
