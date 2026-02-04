import 'package:flutter_labs/features/my_widgets/api_calls_widget.dart';
import 'package:flutter_labs/features/my_widgets/emoji_button_widget.dart';
import 'package:flutter_labs/features/my_widgets/expandable_area_widget.dart';
import 'package:flutter_labs/features/my_widgets/facial_collect_widget.dart';
import 'package:flutter_labs/models/widget_examples.dart';

class WidgetsList {
  static final List<WidgetExamples> items = [
    WidgetExamples(
      title: 'Botão de Emoji',
      page: const EmojiButton(),
    ),
    WidgetExamples(
        title: 'Texto Expansível',
        page: const ExpandableAreaWidget()
    ),
    WidgetExamples(
        title: 'Coleta Facial',
        page: const FacialCollectWidget()
    ),
    WidgetExamples(
        title: 'API calls',
        page: const ApiCallsWidget()
    ),
  ];
}
