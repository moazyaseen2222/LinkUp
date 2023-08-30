import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';

class CallCounter extends StatelessWidget {
  const CallCounter({
    super.key,
    required this.image,
    required this.name,
    required this.date,
    required this.isCome,
  });

  final AssetImage image;
  final String name;
  final String date;
  final bool isCome;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0.h),
      child: Container(
        height: 70.h,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 2,
                spreadRadius: 2,
                offset: Offset(0,1)
              )
            ],
            borderRadius: BorderRadius.circular(8.r)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: image,
                  ),
                  SizedBox(width: 15.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            fontFamily: AppFonts.inter,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        children: [
                          Text(
                            date,
                            style: TextStyle(
                              fontFamily: AppFonts.inter,
                              fontSize: 13.sp,
                            ),
                          ),
                          Icon(
                            isCome ? Icons.call_received : Icons.call_made,
                            size: 15,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              //SizedBox(width: 110.w),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.call,
                  color: AppColors.mainColors,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
