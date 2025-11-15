import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  SubmitButton({super.key, required this.reporttype});

  String reporttype;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Colors.transparent,
                contentPadding: EdgeInsets.zero,
                content: Container(
                  padding: EdgeInsets.only(
                    left: 24,
                    right: 24,
                    top: 58,
                    bottom: 16,
                  ),
                  height: 536,
                  width: 306,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 2, color: Color(0xffa9adb0)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Image.asset('assets/image/Like.png'),
                      SizedBox(height: 54),
                      Text(
                        'Confirm',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff6C757D),
                        ),
                      ),
                      SizedBox(height: 11),
                      Text(
                        'Your $reporttype is successfully sent',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff6C757D),
                        ),
                      ),

                      SizedBox(height: 42),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          height: 48,
                          width: 254,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: Color(0xff4f5efa),
                          ),
                          child: Text(
                            'Done',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Container(
          alignment: Alignment.center,
          width: 133,
          height: 38,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xff4f5efa),
          ),
          child: Text(
            'Submit',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
