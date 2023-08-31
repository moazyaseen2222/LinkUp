// import 'package:flutter/material.dart';
//
// class FinalExamScreenState extends StatefulWidget {
//   const FinalExamScreenState({super.key});
//
//   @override
//   State<FinalExamScreenState> createState() => _FinalExamScreenStateState();
// }
//
// class _FinalExamScreenStateState extends State<FinalExamScreenState> {
//   bool _isMarried = false;
//
//   List<String> _hobbies = ['Reading', 'Cooking'];
//
//   bool isDark = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//         data: isDark ? ThemeData.dark() : ThemeData.light(),
//         child: Scaffold(
//             appBar: AppBar(
//               title: const Text('Final Exam Screen'),
//             ),
//             body: Column(children: [
//               CheckboxListTile(
//                   title: const Text("DarkMode"),
//                   value: isDark,
//                   onChanged: (x) {
//                     setState(() {
//                       isDark = !isDark;
//                     });
//                   }),
//               Row(
//                 children: [
//                   const Text('Married: '),
//                   ...[true, false].map((x) {
//                     return Expanded(
//                       child: RadioListTile(
//                           title: Text(x ? "Yes" : "No"),
//                           value: x,
//                           groupValue: _isMarried,
//                           onChanged: (v) {
//                             setState(() {
//                               _isMarried = x;
//                             });
//                           }),
//                     );
//                   })
//                 ],
//               ),
//               Text(
//                 'Hobbies: ${_hobbies.join(", ")}',
//                 style: const TextStyle(fontSize: 20),
//               ),
//               ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       _hobbies.add("newHobby");
//                     });
//                   },
//                   child: const Text('Add Hobby'))
//             ])));
//   }
// }
