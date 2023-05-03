import 'package:exercises_apps/features/yes_no_app/config/get_yes_no_answer.dart';
import 'package:flutter/cupertino.dart';
import '../../domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final scrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [];

  Future<void> sendMessage(String text) async {
    if(text.isNotEmpty){
      if(text.endsWith("?")){
        herReply();
      }

      messageList.add(Message(text: text, fromWho: FromWho.mine));
      notifyListeners();
      moveScrollToBottom();
    }
  }

  Future herReply () async {
    final herAnswer = await getYesNoAnswer.getAnswers();
    messageList.add(herAnswer);
    notifyListeners();
    moveScrollToBottom();
  }

  void moveScrollToBottom() {
    Future.delayed(const Duration(milliseconds: 400), () {
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    });
  }
}
