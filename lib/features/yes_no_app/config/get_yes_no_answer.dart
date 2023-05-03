import 'package:dio/dio.dart';
import 'package:exercises_apps/features/yes_no_app/infrastructure/extensions/yes_no_model_extensions.dart';
import '../domain/entities/message.dart';
import '../infrastructure/yes_no_model.dart';

class GetYesNoAnswer{
  final _dio = Dio();

  Future<Message> getAnswers() async {
    final response = await _dio.get("https://yesno.wtf/api");
    return YesNoModel.fromJsonMap(response.data).toMessageEntity();
  }
}
