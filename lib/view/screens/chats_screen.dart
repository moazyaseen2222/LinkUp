import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:link_up/view/widget/chat_view.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController = TabController(length: 2, vsync: this);

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

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
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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

                        /// Search icon
                        IconButton(
                            onPressed: () {
                              ///
                            },
                            icon: const Icon(
                              Icons.search_outlined,
                              size: 24,
                            ))
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),

                  /// Tan Bar
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                    child: Container(
                      height: 52.h,
                      width: 327.w,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(7.r)),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TabBar(
                          onTap: (int index) {
                            setState(() {
                              _tabController.index = index;
                            });
                          },
                          indicator: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.r),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 1,
                                    offset: Offset(1, 2),
                                    blurRadius: 2),
                              ]),
                          labelColor: Colors.black,
                          labelStyle: TextStyle(
                              fontFamily: AppFonts.inter,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp),
                          controller: _tabController,
                          tabs: const [
                            Tab(
                              text: 'Chat',
                            ),
                            Tab(
                              text: 'Call',
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  /// Tab bar view

                  Column(
                    children: [
                      IndexedStack(
                        index: _tabController.index,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 28.0.w),
                            child: Column(
                              children: [
                                const ChatView(),
                                const ChatView(),
                                const ChatView(),
                                const ChatView(),
                                const ChatView(),
                                const ChatView(),
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: 90.0.h, left: 250.w),
                                  child:
                                  Container(
                                    height: 70.h,
                                    width: 70.w,
                                    decoration: BoxDecoration(
                                      color: AppColors.mainColors,
                                      borderRadius: BorderRadius.circular(50.r),
                                    ),
                                    child: IconButton(
                                        onPressed: () {
                                          //
                                        },
                                        icon: Image(
                                          height: 30.h,
                                          width: 30.w,
                                          image: const AssetImage(
                                            'images/chat_icon.png',
                                          ),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.h),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ],
          )),
    );
  }
}
