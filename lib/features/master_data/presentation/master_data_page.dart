import 'package:flutter/material.dart';
import 'package:flutter_labs/core/widgets/app_text.dart';
import 'package:flutter_labs/features/master_data/my_widgets/entity/my_widgets_dto.dart';
import 'package:flutter_labs/l10n/app_localizations.dart';

class MasterDataPage extends StatefulWidget {
  const MasterDataPage({super.key});

  @override
  State<MasterDataPage> createState() => _MasterDataPage();
}

class _MasterDataPage extends State<MasterDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: _buildBody(),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 5,
        children: [
          _buildItemHeader(AppLocalizations.of(context)?.widgets ?? ''),
          _buildItemContent(_getWidgets()),
          Divider(),
          _buildItemHeader(AppLocalizations.of(context)?.master_data ?? ''),
          _buildItemContent([]),
          Divider(),
        ],
      ),
    );
  }

  Widget _buildItemHeader(String title) {
    return AppText.title(context, title);
  }

  Widget _buildItemContent(List<MyWidgetsDto> widgets) {
    return SizedBox(
      height: 150,
      child: CarouselView(
        shrinkExtent: 150,
        scrollDirection: Axis.horizontal,
        itemExtent: 150,
        children: widgets.map((widget) {
          return Card(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: SizedBox.expand(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.icon,
                  AppText.titleOnSecondary(
                    context,
                    widget.label,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }).toList(),
        onTap: (index) {
          Navigator.pushNamed(context, widgets[index].route);
        },
      ),
    );
  }

  List<MyWidgetsDto> _getWidgets() {
    return [
      MyWidgetsDto(
        route: '/master-data/widgets/emoji-buton',
        label: AppLocalizations.of(context)?.emoji_button ?? '',
        icon: Icon(
          Icons.emoji_emotions_outlined,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
      MyWidgetsDto(
        route: '/master-data/widgets/facial-collect',
        label: AppLocalizations.of(context)?.facial_collect ?? '',
        icon: Icon(
          Icons.camera_alt_outlined,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
      MyWidgetsDto(
        route: '/master-data/widgets/expandable-area',
        label: AppLocalizations.of(context)?.expandable_area ?? '',
        icon: Icon(
          Icons.wrap_text_outlined,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
    ];
  }
}
