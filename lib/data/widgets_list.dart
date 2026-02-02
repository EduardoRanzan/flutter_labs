import 'package:flutter_labs/models/widget_examples.dart';
import 'package:flutter_labs/widgets/emoji_button_widget.dart';
import 'package:flutter_labs/widgets/expandable_area_widget.dart';
import 'package:flutter_labs/widgets/facial_collect_widget.dart';

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
        page: const FacialCollectWidget())
  ];
}
