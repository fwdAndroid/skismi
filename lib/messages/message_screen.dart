import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MessageScreen extends StatefulWidget {
  final String name;
  final String uuid;
  const MessageScreen({super.key, required this.name, required this.uuid});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
