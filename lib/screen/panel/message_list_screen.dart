import 'package:flutter/material.dart';
import 'package:flutter_sl_001/screen/panel/message_widget.dart';

class MessageListScreen extends StatefulWidget {
  const MessageListScreen({Key? key}) : super(key: key);

  @override
  _MessageListScreenState createState() => _MessageListScreenState();
}

class _MessageListScreenState extends State<MessageListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScroller) => [
          const SliverAppBar(
            title: Text(
              "سیوان لند",
              style: TextStyle(fontFamily: 'Vazir'),
            ),
            backgroundColor: Color(0xff28a745),
            snap: true,
            centerTitle: true,
            floating: true,
          ),
        ],
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return MessageWidget(
                // Here we pass the basic information of messages
                );
          },
        ),
      ),
    );
  }
}
