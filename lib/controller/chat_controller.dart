import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';



class ChatController extends GetxController {
  TextEditingController textController = TextEditingController();

  @override
  void onInit() {
    textController = TextEditingController();
    super.onInit();
  }

  final supabase = Supabase.instance.client;

  Future<void> sendMessage(String contact_name) async {
    final response =
        await supabase.from('contacts').insert({'contact_name': contact_name});
    if (response.error != null) {
      print('No Error');
    }
  }

// Future<String> _getUserTo() async {
//   final response = await _supabase
//       .from('contact')
//       .select('id')
//       .not('id', 'eq', getCurrentUserId())
//       .execute();
//
//   return response.data[0]['id'];
// }
//
// Stream<List<Message>> getMessages() {
//   return _supabase
//       .from('message')
//       .stream(primaryKey: ['id'])
//       .order('created_at')
//       .execute()
//       .map((maps) => maps
//           .map((item) => Message.fromJson(item, getCurrentUserId()))
//           .toList());
// }
//
// Future<void> saveMessage(String content) async {
//   final userTo = await _getUserTo();
//
//   final message = Message.create(
//       content: content, userFrom: getCurrentUserId(), userTo: userTo);
//
//   await _supabase.from('message').insert(message.toMap()).execute();
// }
//
// Future<void> markAsRead(String messageId) async {
//   await _supabase
//       .from('message')
//       .update({'mark_as_read': true})
//       .eq('id', messageId)
//       .execute();
// }
//
// bool isAuthentificated() => _supabase.auth.currentUser != null;
//
// String getCurrentUserId() =>
//     isAuthentificated() ? _supabase.auth.currentUser!.id : '';
//
// String getCurrentUserEmail() =>
//     isAuthentificated() ? _supabase.auth.currentUser!.email ?? '' : '';
}
