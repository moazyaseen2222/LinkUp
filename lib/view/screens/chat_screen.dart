import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              reverse: true,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30.0.h),
                  child: Column(
                    children: [
                      SizedBox(height: 10.h),
                      const Center(
                        child: Text(
                          '08:15',
                          style: TextStyle(
                              fontFamily: AppFonts.inter,
                              color: AppColors.formLabel),
                        ),
                      ),

                      SizedBox(height: 25.h),

                      ///Chat

                      Padding(
                        padding: EdgeInsets.only(right: 90.0.w),
                        child: Container(
                          height: 58.h,
                          width: 237.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: AppColors.formLabel),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Hey,hey,hey...\nIts morning here in Tokyo ☺',
                              style: TextStyle(
                                fontFamily: AppFonts.inter,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 20.h),

                      Padding(
                        padding: EdgeInsets.only(left: 130.0.w),
                        child: Container(
                          height: 39.h,
                          width: 200.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: AppColors.mainColors),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Send me some pictures',
                              style: TextStyle(
                                  fontFamily: AppFonts.inter,
                                  fontSize: 16.sp,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      const Center(
                        child: Text(
                          '11:40',
                          style: TextStyle(
                              fontFamily: AppFonts.inter,
                              color: AppColors.formLabel),
                        ),
                      ),
                      SizedBox(height: 15.h),

                      ///Images
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 28.0.w),
                        child: Row(
                          children: [
                            Image(
                                height: 125.h,
                                width: 125.w,
                                image: const AssetImage(
                                    'images/first_chat_image.png')),
                            Image(
                                height: 125.h,
                                width: 125.w,
                                image: const AssetImage(
                                    'images/second_chat_image.png')),
                          ],
                        ),
                      ),

                      SizedBox(height: 15.h),
                      const Center(
                        child: Text(
                          '11:43',
                          style: TextStyle(
                              fontFamily: AppFonts.inter,
                              color: AppColors.formLabel),
                        ),
                      ),
                      SizedBox(height: 15.h),

                      Padding(
                        padding: EdgeInsets.only(left: 130.0.w),
                        child: Container(
                          height: 39.h,
                          width: 200.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: AppColors.mainColors),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '😱😱😱😱😱 so beautiful',
                              style: TextStyle(
                                  fontFamily: AppFonts.inter,
                                  fontSize: 16.sp,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 20.h),

                      Padding(
                        padding: EdgeInsets.only(right: 90.0.w),
                        child: Container(
                          height: 58.h,
                          width: 237.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: AppColors.formLabel),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'You need to see it by yourself.\nWhen you come?',
                              style: TextStyle(
                                fontFamily: AppFonts.inter,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 100.h),

                      ///Chat

                      Padding(
                        padding: EdgeInsets.only(right: 90.0.w),
                        child: Container(
                          height: 58.h,
                          width: 237.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: AppColors.formLabel),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Hey,hey,hey...\nIts morning here in Tokyo ☺',
                              style: TextStyle(
                                fontFamily: AppFonts.inter,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 20.h),

                      Padding(
                        padding: EdgeInsets.only(left: 130.0.w),
                        child: Container(
                          height: 39.h,
                          width: 200.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: AppColors.mainColors),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Send me some pictures',
                              style: TextStyle(
                                  fontFamily: AppFonts.inter,
                                  fontSize: 16.sp,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.h),
                      const Center(
                        child: Text(
                          '11:40',
                          style: TextStyle(
                              fontFamily: AppFonts.inter,
                              color: AppColors.formLabel),
                        ),
                      ),
                      SizedBox(height: 15.h),

                      ///Images
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 28.0.w),
                        child: Row(
                          children: [
                            Image(
                                height: 125.h,
                                width: 125.w,
                                image: const AssetImage(
                                    'images/first_chat_image.png')),
                            Image(
                                height: 125.h,
                                width: 125.w,
                                image: const AssetImage(
                                    'images/second_chat_image.png')),
                          ],
                        ),
                      ),

                      SizedBox(height: 15.h),
                      const Center(
                        child: Text(
                          '11:43',
                          style: TextStyle(
                              fontFamily: AppFonts.inter,
                              color: AppColors.formLabel),
                        ),
                      ),
                      SizedBox(height: 15.h),

                      Padding(
                        padding: EdgeInsets.only(left: 130.0.w),
                        child: Container(
                          height: 39.h,
                          width: 200.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: AppColors.mainColors),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '😱😱😱😱😱 so beautiful',
                              style: TextStyle(
                                  fontFamily: AppFonts.inter,
                                  fontSize: 16.sp,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 20.h),

                      Padding(
                        padding: EdgeInsets.only(right: 90.0.w),
                        child: Container(
                          height: 58.h,
                          width: 237.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: AppColors.formLabel),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'You need to see it by yourself.\nWhen you come?',
                              style: TextStyle(
                                fontFamily: AppFonts.inter,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 100.h),
                    ],
                  ),
                ),
              ],
            ),

            Container(
              height: 70.h,
              decoration: BoxDecoration(color: AppColors.mainColors),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      ///
                    },
                    icon: const Icon(
                      Icons.arrow_back_outlined,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Back',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        fontFamily: AppFonts.inter,
                        color: Colors.white),
                  ),
                  SizedBox(width: 60.w),
                  Text(
                    'Annette Black',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        fontFamily: AppFonts.inter,
                        color: Colors.white),
                  ),
                  SizedBox(width: 70.w),
                  Stack(
                    children: [
                      ///Image
                      CircleAvatar(
                        radius: 25.r,
                        backgroundImage: const AssetImage(
                          'images/person.png',
                        ),
                      ),

                      /// Online Point
                      Padding(
                        padding: EdgeInsets.only(top: 38.0.h, left: 35.w),
                        child: Container(
                          height: 12.h,
                          width: 12.w,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(50.r)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Divider(
            //   color: AppColors.formLabel,
            //   endIndent: 40.w,
            //   indent: 40.w,
            // ),

            ///Chat bar
            Padding(
              padding: EdgeInsets.only(top: 717.0.h),
              child: Container(
                decoration: const BoxDecoration(color: AppColors.mainColors),
                child: Row(
                  children: [
                    SizedBox(
                      width: 320.w,
                      child: TextFormField(
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    ///
                                  },
                                  icon: const Icon(Icons.send)),
                              hintText: 'Message',
                              hintStyle: const TextStyle(
                                  fontFamily: AppFonts.inter,
                                  color: AppColors.formLabel),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ))),
                    ),
                    Container(
                      height: 50.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: IconButton(
                          onPressed: () {
                            //
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
