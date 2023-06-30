import 'package:flutter/material.dart';

class MessageFieldBoxWidget extends StatelessWidget {
  const MessageFieldBoxWidget({
    Key? key,
    required this.onSubmitted,
  }) : super(key: key);

  final ValueChanged<String> onSubmitted;

  @override
  Widget build(BuildContext context) {
    final outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: const BorderSide(
        color: Colors.transparent,
      ),
    );

    final textController = TextEditingController();
    final focusNode = FocusNode();

    return TextFormField(
      controller: textController,
      focusNode: focusNode,
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      decoration: InputDecoration(
        border: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        hintText: 'Type a message',
        filled: true,
        suffixIcon: IconButton(
          onPressed: () {
            final message = textController.text;
            onSubmitted(message);
            textController.clear();
          },
          icon: const Icon(Icons.send),
        ),
      ),
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();
        onSubmitted(value);
      },
    );
  }
}
