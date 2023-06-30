import 'dart:async';

import 'package:chat/domain/entities/message.dart';
import 'package:flutter/material.dart';

import '../../config/helpers/get_yes_no_answer.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    messageList.add(Message(text: text, fromWho: FromWho.me));

    if (text.endsWith('?')) {
      herReply();
    }
    notifyListeners();
    scrollToBottom();
  }

  Future<void> herReply() async {
    final answer = await getYesNoAnswer.getAnswer();

    messageList.add(answer);
    notifyListeners();
    scrollToBottom();
  }

  Future<void> scrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.bounceInOut,
    );
  }
}
