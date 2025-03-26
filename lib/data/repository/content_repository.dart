import 'package:oriflame/data/content.dart';
import 'package:oriflame/data/model/content_model.dart';

class ContentRepository {
  const ContentRepository();

  fetchQuickShareContents() {
    return Contents.fromJson(contents);
  }
}