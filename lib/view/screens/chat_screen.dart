import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:link_up/models/chat_message.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_fonts.dart';
import '../../controller/chat_controller.dart';


class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> messages = [
    ChatMessage(
        message: 'message message message message message message ',
        isOwner: true),
    ChatMessage(message: 'message message message', isOwner: true),
    ChatMessage(message: 'message message message', isOwner: false),
    ChatMessage(message: 'message message message', isOwner: false),
    ChatMessage(message: 'message message message', isOwner: true),
    ChatMessage(
        message: 'message message message message message message',
        isOwner: true),
    ChatMessage(message: 'message message message', isOwner: true),
    ChatMessage(message: 'message message message', isOwner: false),
    ChatMessage(message: 'message message message', isOwner: false),
    ChatMessage(message: 'message message message', isOwner: true),
    ChatMessage(
        message: 'message message message message message message',
        isOwner: false),
    ChatMessage(message: 'message message message', isOwner: true),
    ChatMessage(message: 'message message message', isOwner: false),
    ChatMessage(message: 'message message message', isOwner: false),
    ChatMessage(message: 'message message message', isOwner: true),
    ChatMessage(message: 'message message message', isOwner: false),
    ChatMessage(message: 'message message message', isOwner: true),
    ChatMessage(
        message: 'message message message message message message',
        isOwner: false),
    ChatMessage(message: 'message message message', isOwner: false),
    ChatMessage(message: 'message message message', isOwner: true),
  ];
  //final _formKey = GlobalKey<FormState>();

  ChatController chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColors,
        title: const Text(
          'LinkUp',
          style: TextStyle(fontFamily: AppFonts.inter),
        ),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              ///Image
              Padding(
                padding: EdgeInsets.only(right: 17.0.w, top: 5.h),
                child: CircleAvatar(
                  radius: 20.r,
                  backgroundImage: const AssetImage(
                    'images/person.png',
                  ),
                ),
              ),

              /// Online Point
              Padding(
                padding: EdgeInsets.only(top: 35.0.h, left: 25.w),
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
      body:

          // StreamBuilder<List<Message>>(
          //   stream: chatController.getMessages(),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       final messages = snapshot.data!;
          //
          //       return Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Column(
          //           children: [
          //             Expanded(
          //               child: ListView.builder(
          //                 reverse: true,
          //                 itemCount: messages.length,
          //                 itemBuilder: (context, index) {
          //                   final message = messages[index];
          //
          //                   return ChatBubble(message: message);
          //                 },
          //               ),
          //             ),
          //             SafeArea(
          //               child: Padding(
          //                 padding: const EdgeInsets.all(8.0),
          //                 child: Form(
          //                   key: _formKey,
          //                   child: TextFormField(
          //                     controller: chatController.textController,
          //                     decoration: InputDecoration(
          //                         labelText: 'Message',
          //                         /*suffixIcon: IconButton(
          //                           // onPressed: () => _submit(chatController),
          //                           icon: const Icon(
          //                             Icons.send_rounded,
          //                             color: Colors.grey,
          //                           ),
          //                         )*/),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             const SizedBox(height: 40.0)
          //           ],
          //         ),
          //       );
          //     }
          //
          //     return const Center(
          //       child: CircularProgressIndicator(),
          //     );
          //   },
          // ),

          SafeArea(
              child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: messages.map((ChatMessage chatMessage) {
                  return Align(
                    alignment: chatMessage.isOwner
                        ? Alignment.topRight
                        : Alignment.topLeft,
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: chatMessage.isOwner
                              ? AppColors.mainColors
                              : Colors.brown.shade400,
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Column(
                        children: [
                          Text(
                            textAlign: TextAlign.center,
                            '11:08',
                            style: TextStyle(
                                fontFamily: AppFonts.inter,
                                color: Colors.black,
                                fontSize: 10.sp),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            chatMessage.message,
                            style: const TextStyle(
                              fontFamily: AppFonts.inter,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            )),
          ),
          Container(
            height: 55.h,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Colors.white24,
                    blurRadius: 1,
                    spreadRadius: 1,
                    offset: Offset(0, -3))
              ],
              borderRadius: BorderRadius.circular(8.r),
              color: AppColors.mainColors,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  const Expanded(
                      child: TextField(
                          decoration: InputDecoration.collapsed(
                              hintText: 'Message',
                              hintStyle: TextStyle(
                                  fontFamily: AppFonts.inter,
                                  color: Colors.white)
                              // helperStyle: TextStyle(fontFamily: AppFonts.inter)),
                              ))),
                  IconButton(
                      padding: EdgeInsets.only(bottom: 10.h),
                      onPressed: () {
                        chatController.sendMessage('moaz');
                      },
                      icon: const Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 25,
                      ))
                ],
              ),
            ),
          ),
        ],
      )
              // Stack(
              //   children: [
              //     ListView(
              //       keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
              //       reverse: false,
              //       children: [
              //         Stack(
              //           children: [
              //             Padding(
              //               padding: EdgeInsets.only(top: 30.0.h),
              //               child: Column(
              //                 children: [
              //                   SizedBox(height: 10.h),
              //                   const Center(
              //                     child: Text(
              //                       '08:15',
              //                       style: TextStyle(
              //                           fontFamily: AppFonts.inter,
              //                           color: AppColors.formLabel),
              //                     ),
              //                   ),
              //
              //                   SizedBox(height: 25.h),
              //
              //                   ///Chat
              //
              //                   Padding(
              //                     padding: EdgeInsets.only(right: 90.0.w),
              //                     child: Container(
              //                       height: 58.h,
              //                       width: 237.w,
              //                       decoration: BoxDecoration(
              //                           borderRadius: BorderRadius.circular(8.r),
              //                           color: AppColors.formLabel),
              //                       child: Padding(
              //                         padding: const EdgeInsets.all(8.0),
              //                         child: Text(
              //                           'Hey,hey,hey...\nIts morning here in Tokyo ☺',
              //                           style: TextStyle(
              //                             fontFamily: AppFonts.inter,
              //                             fontSize: 16.sp,
              //                           ),
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //
              //                   SizedBox(height: 20.h),
              //
              //                   Padding(
              //                     padding: EdgeInsets.only(left: 130.0.w),
              //                     child: Container(
              //                       height: 39.h,
              //                       width: 200.w,
              //                       decoration: BoxDecoration(
              //                           borderRadius: BorderRadius.circular(8.r),
              //                           color: AppColors.mainColors),
              //                       child: Padding(
              //                         padding: const EdgeInsets.all(8.0),
              //                         child: Text(
              //                           'Send me some pictures',
              //                           style: TextStyle(
              //                               fontFamily: AppFonts.inter,
              //                               fontSize: 16.sp,
              //                               color: Colors.white),
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                   SizedBox(height: 15.h),
              //                   const Center(
              //                     child: Text(
              //                       '11:40',
              //                       style: TextStyle(
              //                           fontFamily: AppFonts.inter,
              //                           color: AppColors.formLabel),
              //                     ),
              //                   ),
              //                   SizedBox(height: 15.h),
              //
              //                   ///Images
              //                   Padding(
              //                     padding: EdgeInsets.symmetric(horizontal: 28.0.w),
              //                     child: Row(
              //                       children: [
              //                         Image(
              //                             height: 125.h,
              //                             width: 125.w,
              //                             image: const AssetImage(
              //                                 'images/first_chat_image.png')),
              //                         Image(
              //                             height: 125.h,
              //                             width: 125.w,
              //                             image: const AssetImage(
              //                                 'images/second_chat_image.png')),
              //                       ],
              //                     ),
              //                   ),
              //
              //                   SizedBox(height: 15.h),
              //                   const Center(
              //                     child: Text(
              //                       '11:43',
              //                       style: TextStyle(
              //                           fontFamily: AppFonts.inter,
              //                           color: AppColors.formLabel),
              //                     ),
              //                   ),
              //                   SizedBox(height: 15.h),
              //
              //                   Padding(
              //                     padding: EdgeInsets.only(left: 130.0.w),
              //                     child: Container(
              //                       height: 39.h,
              //                       width: 200.w,
              //                       decoration: BoxDecoration(
              //                           borderRadius: BorderRadius.circular(8.r),
              //                           color: AppColors.mainColors),
              //                       child: Padding(
              //                         padding: const EdgeInsets.all(8.0),
              //                         child: Text(
              //                           '😱😱😱😱😱 so beautiful',
              //                           style: TextStyle(
              //                               fontFamily: AppFonts.inter,
              //                               fontSize: 16.sp,
              //                               color: Colors.white),
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //
              //                   SizedBox(height: 20.h),
              //
              //                   Padding(
              //                     padding: EdgeInsets.only(right: 90.0.w),
              //                     child: Container(
              //                       height: 58.h,
              //                       width: 237.w,
              //                       decoration: BoxDecoration(
              //                           borderRadius: BorderRadius.circular(8.r),
              //                           color: AppColors.formLabel),
              //                       child: Padding(
              //                         padding: const EdgeInsets.all(8.0),
              //                         child: Text(
              //                           'You need to see it by yourself.\nWhen you come?',
              //                           style: TextStyle(
              //                             fontFamily: AppFonts.inter,
              //                             fontSize: 16.sp,
              //                           ),
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //
              //                   SizedBox(height: 100.h),
              //
              //                   ///Chat
              //
              //                   Padding(
              //                     padding: EdgeInsets.only(right: 90.0.w),
              //                     child: Container(
              //                       height: 58.h,
              //                       width: 237.w,
              //                       decoration: BoxDecoration(
              //                           borderRadius: BorderRadius.circular(8.r),
              //                           color: AppColors.formLabel),
              //                       child: Padding(
              //                         padding: const EdgeInsets.all(8.0),
              //                         child: Text(
              //                           'Hey,hey,hey...\nIts morning here in Tokyo ☺',
              //                           style: TextStyle(
              //                             fontFamily: AppFonts.inter,
              //                             fontSize: 16.sp,
              //                           ),
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //
              //                   SizedBox(height: 20.h),
              //
              //                   Padding(
              //                     padding: EdgeInsets.only(left: 130.0.w),
              //                     child: Container(
              //                       height: 39.h,
              //                       width: 200.w,
              //                       decoration: BoxDecoration(
              //                           borderRadius: BorderRadius.circular(8.r),
              //                           color: AppColors.mainColors),
              //                       child: Padding(
              //                         padding: const EdgeInsets.all(8.0),
              //                         child: Text(
              //                           'Send me some pictures',
              //                           style: TextStyle(
              //                               fontFamily: AppFonts.inter,
              //                               fontSize: 16.sp,
              //                               color: Colors.white),
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                   SizedBox(height: 15.h),
              //                   const Center(
              //                     child: Text(
              //                       '11:40',
              //                       style: TextStyle(
              //                           fontFamily: AppFonts.inter,
              //                           color: AppColors.formLabel),
              //                     ),
              //                   ),
              //                   SizedBox(height: 15.h),
              //
              //                   ///Images
              //                   Padding(
              //                     padding: EdgeInsets.symmetric(horizontal: 28.0.w),
              //                     child: Row(
              //                       children: [
              //                         Image(
              //                             height: 125.h,
              //                             width: 125.w,
              //                             image: const AssetImage(
              //                                 'images/first_chat_image.png')),
              //                         Image(
              //                             height: 125.h,
              //                             width: 125.w,
              //                             image: const AssetImage(
              //                                 'images/second_chat_image.png')),
              //                       ],
              //                     ),
              //                   ),
              //
              //                   SizedBox(height: 15.h),
              //                   const Center(
              //                     child: Text(
              //                       '11:43',
              //                       style: TextStyle(
              //                           fontFamily: AppFonts.inter,
              //                           color: AppColors.formLabel),
              //                     ),
              //                   ),
              //                   SizedBox(height: 15.h),
              //
              //                   Padding(
              //                     padding: EdgeInsets.only(left: 130.0.w),
              //                     child: Container(
              //                       height: 39.h,
              //                       width: 200.w,
              //                       decoration: BoxDecoration(
              //                           borderRadius: BorderRadius.circular(8.r),
              //                           color: AppColors.mainColors),
              //                       child: Padding(
              //                         padding: const EdgeInsets.all(8.0),
              //                         child: Text(
              //                           '😱😱😱😱😱 so beautiful',
              //                           style: TextStyle(
              //                               fontFamily: AppFonts.inter,
              //                               fontSize: 16.sp,
              //                               color: Colors.white),
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //
              //                   SizedBox(height: 20.h),
              //
              //                   Padding(
              //                     padding: EdgeInsets.only(right: 90.0.w),
              //                     child: Container(
              //                       height: 58.h,
              //                       width: 237.w,
              //                       decoration: BoxDecoration(
              //                           borderRadius: BorderRadius.circular(8.r),
              //                           color: AppColors.formLabel),
              //                       child: Padding(
              //                         padding: const EdgeInsets.all(8.0),
              //                         child: Text(
              //                           'You need to see it by yourself.\nWhen you come?',
              //                           style: TextStyle(
              //                             fontFamily: AppFonts.inter,
              //                             fontSize: 16.sp,
              //                           ),
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //
              //                   SizedBox(height: 100.h),
              //                 ],
              //               ),
              //             ),
              //
              //             ///Chat bar
              //             Padding(
              //               padding: EdgeInsets.only(top: 1121.0.h),
              //               child: Container(
              //                 decoration: const BoxDecoration(
              //                   color: AppColors.main2Colors,
              //                 ),
              //                 child: Row(
              //                   children: [
              //                     SizedBox(
              //                       width: 320.w,
              //                       height: 60.h,
              //                       child: Padding(
              //                         padding: EdgeInsets.only(left: 10.w, top: 11.h),
              //                         child: TextFormField(
              //                             decoration: InputDecoration(
              //                           border: InputBorder.none,
              //                           suffixIcon: IconButton(
              //                               onPressed: () {
              //                                 ///
              //                               },
              //                               icon: const Icon(Icons.send)),
              //                           hintText: 'Message',
              //                           hintStyle: const TextStyle(
              //                               fontFamily: AppFonts.inter,
              //                               color: Colors.white),
              //                         )),
              //                       ),
              //                     ),
              //                     Container(
              //                       height: 50.h,
              //                       width: 50.w,
              //                       decoration: BoxDecoration(
              //                         color: AppColors.mainColors,
              //                         borderRadius: BorderRadius.circular(50.r),
              //                       ),
              //                       child: IconButton(
              //                           onPressed: () {
              //                             //
              //                           },
              //                           icon: const Icon(
              //                             Icons.add,
              //                             color: Colors.white,
              //                           )),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ],
              //         )
              //       ],
              //     ),
              //     Container(
              //       height: 60.h,
              //       decoration: const BoxDecoration(color: AppColors.mainColors),
              //       child: Row(
              //         children: [
              //           IconButton(
              //             onPressed: () {
              //               ///
              //             },
              //             icon: const Icon(
              //               Icons.arrow_back_outlined,
              //               color: Colors.white,
              //             ),
              //           ),
              //           Text(
              //             'Back',
              //             style: TextStyle(
              //                 fontWeight: FontWeight.bold,
              //                 fontSize: 16.sp,
              //                 fontFamily: AppFonts.inter,
              //                 color: Colors.white),
              //           ),
              //           SizedBox(width: 60.w),
              //           Text(
              //             'Annette Black',
              //             style: TextStyle(
              //                 fontWeight: FontWeight.bold,
              //                 fontSize: 16.sp,
              //                 fontFamily: AppFonts.inter,
              //                 color: Colors.white),
              //           ),
              //           SizedBox(width: 70.w),
              //           Stack(
              //             children: [
              //               ///Image
              //               CircleAvatar(
              //                 radius: 25.r,
              //                 backgroundImage: const AssetImage(
              //                   'images/person.png',
              //                 ),
              //               ),
              //
              //               /// Online Point
              //               Padding(
              //                 padding: EdgeInsets.only(top: 38.0.h, left: 35.w),
              //                 child: Container(
              //                   height: 12.h,
              //                   width: 12.w,
              //                   decoration: BoxDecoration(
              //                       border: Border.all(color: Colors.white),
              //                       color: Colors.green,
              //                       borderRadius: BorderRadius.circular(50.r)),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              ),
    );
  }
}
