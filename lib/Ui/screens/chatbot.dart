import 'package:flutter/material.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Color(0xFFEFF6FF),
              child: Image.asset("assets/image/chatBot.png"),
            ),
            SizedBox(width: 17),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "T-MedBot",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                ),
                Row(
                  children: [
                    Container(
                      width: 7,
                      height: 7,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Always active",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(width: 60),
            CircleAvatar(
              backgroundColor: Colors.grey[100],
              child: Icon(Icons.more_horiz),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(padding: EdgeInsets.only(left: 10, right: 10)),
          Row(
            children: [
              Padding(padding: EdgeInsetsGeometry.all(10)),

              SizedBox(
                width: 267,
                height: 44,
                child: TextField(
                  style: TextStyle(fontSize: 17),
                  decoration: InputDecoration(
                    hintText: "Type a message...",
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff6C757D),
                    ),
                    filled: true,
                    fillColor: Color(0xFFEFF6FF),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Image.asset("assets/image/icon send.png"),
            ],
          ),
          SizedBox(height: 25),
        ],
      ),
    );
  }
}
