import 'package:flutter/material.dart';

class AttachmentBox extends StatelessWidget {
  const AttachmentBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 16, bottom: 27),
          width: double.infinity,
          height: 117,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xff79747E)),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Icon(Icons.inbox, color: Color(0xffBFC4C9), size: 24),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Click here ',
                    style: TextStyle(
                      color: Color(0xff0D6EFD),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'to upload or drop files here',
                    style: TextStyle(
                      color: Color(0xff6C757D),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        Positioned(
          left: 8,
          top: -10,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.white, // Background to overlap border
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              'Attachment',
              style: TextStyle(
                color: Color(0xff49454F),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
