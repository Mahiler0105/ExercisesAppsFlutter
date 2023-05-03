import 'package:flutter/material.dart';

class MessageFieldBox extends StatefulWidget {
  final ValueChanged<String> onChange;
  final VoidCallback onTap;

  const MessageFieldBox({
    super.key,
    required this.onChange,
    required this.onTap,
  });

  @override
  State<MessageFieldBox> createState() => _MessageFieldBoxState();
}

class _MessageFieldBoxState extends State<MessageFieldBox> {
  final _textController = TextEditingController();
  final _focusNode = FocusNode();
  bool _enabled = false;

  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      setState(() {
        _enabled = _textController.value.text.isNotEmpty;
      });
    });

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        widget.onTap();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final outLineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(30));

    var inputDecoration = InputDecoration(
        enabledBorder: outLineInputBorder,
        focusedBorder: outLineInputBorder,
        hintText: 'End your message with "?"',
        filled: true,
        border: InputBorder.none,
        suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: _enabled
              ? () => sendMessage(_textController.value.text)
              : null,
        ));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.always,
        focusNode: _focusNode,
        controller: _textController,
        decoration: inputDecoration,
        onTapOutside: (event) => _focusNode.unfocus(),
        onFieldSubmitted: (value) => sendMessage(value),
      ),
    );
  }

  void sendMessage(String value) {
    widget.onChange(value);
    _textController.clear();
    _focusNode.requestFocus();
  }
}
