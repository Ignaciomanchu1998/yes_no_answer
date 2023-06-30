import 'package:chat/domain/entities/message.dart';
import 'package:chat/infrastructure/models/yes_no_model.dart';
import 'package:dio/dio.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get("https://yesno.wtf/api");

    final yesNoModel = YesNoModel.fromJson(response.data);

    return yesNoModel.toHerMessage();
  }
}
