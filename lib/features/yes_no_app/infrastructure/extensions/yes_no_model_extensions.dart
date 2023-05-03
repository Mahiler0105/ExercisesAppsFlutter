import 'package:exercises_apps/features/yes_no_app/domain/entities/message.dart';
import 'package:exercises_apps/features/yes_no_app/infrastructure/yes_no_model.dart';

extension YesNoModelExtensions on YesNoModel {
  Message toMessageEntity() {
    return Message(text: answer, fromWho: FromWho.hers, imageUrl: image);
  }
}
