import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';

enum Gender { male, female }

class SignUpProfile extends StatefulWidget {
  const SignUpProfile({super.key});

  @override
  State<SignUpProfile> createState() => _SignUpProfileState();
}

class _SignUpProfileState extends State<SignUpProfile> {
  Gender selectedGender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          bottom: true,
          child: ListView(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            ///
                          },
                          icon: const Icon(
                            Icons.arrow_back_outlined,
                            color: AppColors.mainColors,
                          ),
                        ),
                        Text(
                          'Back',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                              fontFamily: AppFonts.firaSans,
                              color: AppColors.mainColors),
                        ),
                        SizedBox(width: 70.w),
                        Text(
                          'Profile',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                            fontFamily: AppFonts.firaSans,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    child: Column(
                      children: [
                        /// Main Image
                        Stack(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  const AssetImage('images/person.png'),
                              backgroundColor: Colors.white,
                              radius: 100.r,
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.only(top: 145.0.h, left: 145.w),
                              child: Container(
                                height: 50.h,
                                width: 50.w,
                                decoration: BoxDecoration(
                                  color: AppColors.mainColors,
                                  borderRadius: BorderRadius.circular(50.r),
                                ),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.mode_edit_outline_outlined,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 40.h),

                        /// User Name
                        TextFormField(
                          decoration: InputDecoration(
                              label: Padding(
                                padding: EdgeInsets.only(left: 15.w),
                                child: Text(
                                  'User Name',
                                  style: TextStyle(
                                      fontFamily: AppFonts.firaSans,
                                      fontSize: 14.sp,
                                      color: AppColors.formLabel),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              )),
                        ),
                        SizedBox(height: 18.h),

                        /// Bio
                        TextFormField(
                          decoration: InputDecoration(
                              label: Padding(
                                padding: EdgeInsets.only(left: 15.w),
                                child: Text(
                                  'Bio',
                                  style: TextStyle(
                                      fontFamily: AppFonts.firaSans,
                                      fontSize: 14.sp,
                                      color: AppColors.formLabel),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              )),
                        ),

                        SizedBox(height: 18.h),

                        ///Gender select male
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 54.h,
                              width: 150.w,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.formLabel),
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(7.r)),
                              child: RadioListTile<Gender>(
                                title: const Text('Male',
                                    style: TextStyle(
                                        fontFamily: AppFonts.firaSans)),
                                value: Gender.male,
                                groupValue: selectedGender,
                                onChanged: (Gender? value) {
                                  setState(() {
                                    selectedGender = value!;
                                  });
                                },
                              ),
                            ),
                            Container(
                              height: 54.h,
                              width: 150.w,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.formLabel),
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(7.r)),
                              child: RadioListTile<Gender>(
                                title: const Text(
                                  'Female',
                                  style:
                                      TextStyle(fontFamily: AppFonts.firaSans),
                                ),
                                value: Gender.female,
                                groupValue: selectedGender,
                                onChanged: (Gender? value) {
                                  setState(() {
                                    selectedGender = value!;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 91.h),

                        /// Complete button
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(319.w, 54.h),
                            ),
                            onPressed: () {
                              ///
                            },
                            child: Text(
                              'Complete',
                              style: TextStyle(
                                  fontFamily: AppFonts.firaSans,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
