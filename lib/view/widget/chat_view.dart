import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:link_up/view/screens/chat_screen.dart';

import '../../constants/app_fonts.dart';

class ChatView extends StatelessWidget {
  const ChatView({
    super.key, required this.name,  required this.image,
  });

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(const ChatScreen());
      },
      child: Padding(
        padding: EdgeInsets.only(top: 30.0.h),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20.r,
              backgroundImage: const AssetImage('images/person.png'),
            ),
            SizedBox(width: 20.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontFamily: AppFonts.inter,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 5.h),
                Text(
                  'Hey, did you talk to her?',
                  style: TextStyle(
                      fontFamily: AppFonts.inter,
                      fontSize: 14.sp,
                      color: Colors.grey.shade600),
                ),
              ],
            ),
            SizedBox(width: 55.w),
            Text(
              '2min ago',
              style: TextStyle(fontFamily: AppFonts.inter, fontSize: 12.sp),
            ),
          ],
        ),
      ),
    );
  }
}
