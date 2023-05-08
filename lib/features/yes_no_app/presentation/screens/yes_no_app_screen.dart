import 'package:exercises_apps/features/yes_no_app/presentation/providers/chat_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/entities/message.dart';
import '../widgets/index.dart';

class YesNoAppScreen extends StatelessWidget {
  static const String name = "yes_no_app_screen";

  const YesNoAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Row(
          children: const [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://i1.sndcdn.com/avatars-nJIbMNZZpcLqAj1O-9YfmnA-t500x500.jpg'),
            ),
            SizedBox(width: 10),
            Text("Carawoon"),
          ],
        ),
      ),
      body: const ChatView(),
    );
  }
}

class ChatView extends StatelessWidget {
  const ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    controller: provider.scrollController,
                    itemCount: provider.messageList.length,

                    itemBuilder: (context, index) {
                      final message = provider.messageList[index];
                      if (message.fromWho == FromWho.mine) {
                        return MyMessage(message: message.text);
                      } else {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HerMessage(message: message.text),
                            GifMessage(imageUrl: message.imageUrl!),
                          ],
                        );
                      }
                    })),
            MessageFieldBox(
                onChange: provider.sendMessage,
                onTap: provider.moveScrollToBottom),
          ],
        ),
      ),
    );
  }
}
