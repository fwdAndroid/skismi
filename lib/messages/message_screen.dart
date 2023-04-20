import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  final String name;
  final String uuid;
  const MessageScreen({super.key, required this.name, required this.uuid});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.name),
        centerTitle: true,
      ),
    );
    ;
  }
}
