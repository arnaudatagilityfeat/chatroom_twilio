import 'package:flutter/material.dart';
import 'package:chatroom_twilio/room/join_room_page.dart';

void main() {
  runApp(TwilioProgrammableVideoExample());
}

class TwilioProgrammableVideoExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: JoinRoomPage(),
    );
  }
}
