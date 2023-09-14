import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:link_up/view/widget/chat_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';
import '../../controller/chats_controller.dart';
import '../widget/call_counter.dart';

class ChatsScreen extends StatefulWidget {
  ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen>
    with SingleTickerProviderStateMixin {
  // late TabController _tabController = TabController(length: 2, vsync: this);
  ChatsController chatsController = Get.put(ChatsController());

  @override
  void initState() {
    // _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  final supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    final stream = supabase.from('contacts').stream(primaryKey: ['id']);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            padding: const EdgeInsets.all(5),
            unselectedLabelStyle: const TextStyle(fontFamily: AppFonts.inter),
            tabs: const [
              Tab(
                text: 'Chat',
              ),
              Tab(
                text: 'Call',
              )
            ],
            indicator: BoxDecoration(
              border: Border.all(width: 3, color: AppColors.mainColors),
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
            labelColor: Colors.black,
            labelStyle: TextStyle(
                fontFamily: AppFonts.inter,
                fontWeight: FontWeight.bold,
                fontSize: 16.sp),
          ),
          backgroundColor: AppColors.mainColors,
          title: const Text(
            'LinkUp',
            style: TextStyle(
              fontFamily: AppFonts.inter,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
              tooltip: 'Logout',
              onPressed: () {
                Get.defaultDialog(
                  title: "Exit",
                  content: Text("Sure to leave?"),
                  confirm: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.main3Colors),
                    onPressed: () {
                      chatsController.logout();
                      //Get.back(); // Close the dialog
                    },
                    child: Text("Confirm"),
                  ),
                  cancel: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.main2Colors),
                    onPressed: () {
                      Get.back(); // Close the dialog
                    },
                    child: Text("Cancel"),
                  ),
                );
                //
              },
              icon: const Icon(Icons.logout_sharp)),
        ),
        body: StreamBuilder<List<Map<String, dynamic>>>(
          stream: stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: SpinKitChasingDots(
                  color: AppColors.mainColors,
                ),
              );
            }
            final names = snapshot.data!;
            return TabBarView(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      IndexedStack(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 28.0.w),
                            child: Stack(
                              children: [
                                SizedBox(
                                  height: 200.h,
                                  child: ListView.builder(
                                    itemCount: names.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          ChatView(
                                            name: names[index]['contact_name'],
                                            image: 'images/person.png',
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                )

                                ///
                              ],
                            ),
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      IndexedStack(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                            child: const Stack(
                              children: [
                                Column(
                                  children: [
                                    CallCounter(
                                      image: AssetImage('images/person.png'),
                                      name: 'Alex Param',
                                      date: 'Today,10:20',
                                      isCome: true,
                                    ),
                                    CallCounter(
                                      image: AssetImage('images/person.png'),
                                      name: 'Moaz Yaseen',
                                      date: 'yesterday,6:11',
                                      isCome: false,
                                    ),
                                    CallCounter(
                                      image: AssetImage('images/person.png'),
                                      name: 'Mohammed ali',
                                      date: 'Today,5:01',
                                      isCome: true,
                                    ),
                                    CallCounter(
                                      image: AssetImage('images/person.png'),
                                      name: 'Alex Param',
                                      date: 'Today,10:20',
                                      isCome: true,
                                    ),
                                    CallCounter(
                                      image: AssetImage('images/person.png'),
                                      name: 'Moaz Yaseen',
                                      date: 'yesterday,6:11',
                                      isCome: false,
                                    ),
                                    CallCounter(
                                      image: AssetImage('images/person.png'),
                                      name: 'Mohammed ali',
                                      date: 'Today,5:01',
                                      isCome: true,
                                    ),
                                    CallCounter(
                                      image: AssetImage('images/person.png'),
                                      name: 'Alex Param',
                                      date: 'Today,10:20',
                                      isCome: true,
                                    ),
                                    CallCounter(
                                      image: AssetImage('images/person.png'),
                                      name: 'Moaz Yaseen',
                                      date: 'yesterday,6:11',
                                      isCome: false,
                                    ),
                                    CallCounter(
                                      image: AssetImage('images/person.png'),
                                      name: 'Mohammed ali',
                                      date: 'Today,5:01',
                                      isCome: true,
                                    ),
                                    CallCounter(
                                      image: AssetImage('images/person.png'),
                                      name: 'Alex Param',
                                      date: 'Today,10:20',
                                      isCome: true,
                                    ),
                                    CallCounter(
                                      image: AssetImage('images/person.png'),
                                      name: 'Moaz Yaseen',
                                      date: 'yesterday,6:11',
                                      isCome: false,
                                    ),
                                    CallCounter(
                                      image: AssetImage('images/person.png'),
                                      name: 'Mohammed ali',
                                      date: 'Today,5:01',
                                      isCome: true,
                                    ),
                                  ],
                                ),

                                ///
                              ],
                            ),
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
            // return ListView.builder(
            //   itemCount: names.length,
            //   itemBuilder: (context, index) {
            //     return ListTile(
            //       title: Text(names[index]['contact_name']),
            //     );
            //   },
            // );
          },
        ),

        // ListView(
        //   children: [
        //     Column(
        //       children: [
        //         Padding(
        //           padding: const EdgeInsets.all(20.0),
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               Stack(
        //                 children: [
        //                   ///Image
        //                   CircleAvatar(
        //                     radius: 25.r,
        //                     backgroundImage: const AssetImage(
        //                       'images/person.png',
        //                     ),
        //                   ),
        //
        //                   /// Online Point
        //                   Padding(
        //                     padding: EdgeInsets.only(top: 38.0.h, left: 35.w),
        //                     child: Container(
        //                       height: 12.h,
        //                       width: 12.w,
        //                       decoration: BoxDecoration(
        //                           border: Border.all(color: Colors.white),
        //                           color: Colors.green,
        //                           borderRadius: BorderRadius.circular(50.r)),
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //
        //               /// Search icon
        //               IconButton(
        //                   tooltip: 'Search',
        //                   onPressed: () {
        //                     ///
        //                   },
        //                   icon: const Icon(
        //                     Icons.search_outlined,
        //                     size: 24,
        //                   ))
        //             ],
        //           ),
        //         ),
        //
        // Tab Bar
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        //   child: Container(
        //     height: 52.h,
        //     width: 327.w,
        //     decoration: BoxDecoration(
        //         color: Colors.grey.shade200,
        //         borderRadius: BorderRadius.circular(7.r)),
        //     child: Padding(
        //       padding: const EdgeInsets.all(5.0),
        //       child: TabBar(
        //         onTap: (int index) {
        //           setState(() {
        //             _tabController.index = index;
        //           });
        //         },
        //         indicator: BoxDecoration(
        //             color: Colors.white,
        //             borderRadius: BorderRadius.circular(8.r),
        //             boxShadow: const [
        //               BoxShadow(
        //                   color: Colors.grey,
        //                   spreadRadius: 1,
        //                   offset: Offset(1, 2),
        //                   blurRadius: 2),
        //             ]),
        //         labelColor: Colors.black,
        //         labelStyle: TextStyle(
        //             fontFamily: AppFonts.inter,
        //             fontWeight: FontWeight.bold,
        //             fontSize: 16.sp),
        //         controller: _tabController,
        //
        //
        //       ),
        //     ),
        //   ),
        // ),
        //
        //         /// Tab bar view
        //
        //
        //
        //
        //
        //       ],
        //     ),
        //
        //   ],
        // ),

        floatingActionButton: Container(
          height: 70.w,
          width: 70.w,
          decoration: BoxDecoration(
            color: AppColors.mainColors,
            borderRadius: BorderRadius.circular(40.r),
          ),
          child: FloatingActionButton(
            backgroundColor: AppColors.mainColors,
            tooltip: 'New Chat',
            onPressed: () {
              ///
            },
            child: IconButton(
                onPressed: () {},
                icon: Image(
                  height: 30.h,
                  width: 30.w,
                  image: const AssetImage(
                    'images/chat_icon.png',
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
