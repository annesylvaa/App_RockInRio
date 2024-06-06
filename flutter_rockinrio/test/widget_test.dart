import 'dart:js';

import 'package:flutter/material.dart';
import 'package: device_preview/device_preview.dart';
import 'package: flutter_rockinrio/HomePage.dart';

import '../lib/main.dart';

void main() {
  runApp(
    DevicePreview(
      enabled:true,
      builder: (context) => RockInRio()
    ),
  );
}

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<String> messagens = [];
  final TextEditingController controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add(0, _controller.text);
        _controller.clear();
      });
    }
  }

  Widget _buildMessage(String message, bool isMe) {
    final aligment = isMe ? CrossAxisAlignment.end :CrossAxisAlignment.start;
         final borderRadius = isMe
         ? BorderRadius.only(
            topleft: Radius.circular(12),
            bottomLeft: Radius.circular(12),
            bottomRight: Radius.circular(12),
         )
        :  BorderRadius.only(
        topRight: Radius.circular(12),
        bottomLeft: Radius.circular(12),
        bottomRigth: Radius.circular(12),
        );

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: aligment,
        crossAxisAlignmet: CrossAxisAlignment.start,
        children: <Widget>[
          if(!isMe)
        Container(
          margin: const EdgeInsets.only(right: 16.0),
          child: CircleAvatar(child: Text('A')),
        ),
        Container(
          padding: const EdgeInsets.all(10.0),
          constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0,75),
          decoration: BoxDecoration(
            color: isMe ? Colors.green[200]: Colors.grey[300],
            borderRadius: borderRadius,
          ),
          child: Text(message),
        ),
        if(isMe)
         Container(
           margin: const EdgeInsets.only(Left: 16.0),
           child: CircleAvatar(child: Text('M')),
         ),
      ),
    );