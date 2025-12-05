import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:depi_hospital_complaint_system/Ui/screens/chatbot.dart';
import 'package:depi_hospital_complaint_system/Ui/screens/new_complain.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/image/person.jpg"),
            ),
            SizedBox(width: 25),
            Text(
              "HI, Farah\nWelcome Back",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(width: 55),
            Image.asset("assets/image/icon menu.png"),
            SizedBox(width: 20),
            Image.asset("assets/image/icon notification.png"),
          ],
        ),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 1400,
                height: 40,
                child: TextField(
                  style: TextStyle(fontSize: 17),
                  decoration: InputDecoration(
                    prefixIcon: Image.asset('assets/image/search icon.png'),
                    hintText: "Find best vaccinate, treatment...",
                    hintStyle: TextStyle(
                      fontSize: 12,
                      color: Color(0xff6C757D),
                      fontWeight: FontWeight.w700,
                    ),
                    filled: true,
                    fillColor: Color(0xffEFF6FF),
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

              SizedBox(height: 20),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 70,
                        width: 160,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xffF8F9FA),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total Issues",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  "3",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Image.asset(
                              "assets/image/icon total issues.png",

                              width: 60,
                              height: 54,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(width: 10),
                      Container(
                        height: 70,
                        width: 150,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xffF8F9FA),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pending",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  "1",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Image.asset(
                              "assets/image/icon pending.png",
                              width: 60,
                              height: 54,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 20),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 70,
                        width: 160,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xffF8F9FA),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "IN Progress",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  "1",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Image.asset(
                              "assets/image/icon in progress.png",
                              width: 60,
                              height: 54,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(width: 10),
                      Container(
                        height: 70,
                        width: 150,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xffF8F9FA),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Resolved",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  "1",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Image.asset(
                              "assets/image/icon resolved.png",
                              width: 60,
                              height: 54,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 15),
              Text(
                "Recent Issues",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 13),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Wrong Consult"),
                    SizedBox(height: 5),
                    Text("The issue was in the medical field"),
                    SizedBox(height: 7),
                    Row(
                      children: [
                        Text("22 October 2025"),
                        SizedBox(width: 70),
                        Text("Medical issue"),
                      ],
                    ),
                    SizedBox(height: 25),
                    Container(
                      width: 90,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xffF39C12),
                      ),
                      child: Text(
                        "Pending",
                        style: TextStyle(
                          color: Color(0xff212529),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewComplaintScreen()),
          );
        },
        child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff0D6EFD),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Icon(Icons.add, color: Colors.white, size: 50),
        ),
      ),

      bottomNavigationBar: CurvedNavigationBar(
        index: 2,
        backgroundColor: Colors.transparent,
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        height: 70,
        items: [
          Image.asset("assets/image/icon home.png"),
          Image.asset("assets/image/icon analysis.png"),
          SizedBox(height: 10),
          Image.asset("assets/image/icon chat.png"),
          Image.asset("assets/image/icon person.png"),
        ],
        onTap: (index) {
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatBot()),
            );
          }
        },
      ),
    );
  }
}
