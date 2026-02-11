import 'package:flutter/cupertino.dart';
import 'package:flutter_labs/features/auth/presentation/auth_page.dart';
import 'package:flutter_labs/features/master_data/my_widgets/presentation/emoji_button_widget.dart';
import 'package:flutter_labs/features/master_data/my_widgets/presentation/expandable_area_widget.dart';
import 'package:flutter_labs/features/master_data/my_widgets/presentation/facial_collect_widget.dart';
import 'package:flutter_labs/features/master_data/presentation/master_data_page.dart';
import 'package:flutter_labs/features/presentation/main_home_page.dart';
import 'package:flutter_labs/features/splash/presentation/splash_page.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> initRoutes() {
    return {
      '/splash': (context) => const SplashPage(),
      '/home': (context) => const MainHomePage(),
      '/login': (context) => const AuthPage(),
      '/master-data': (context) => const MasterDataPage(),
      '/master-data/widgets/emoji-buton': (context) => const EmojiButton(),
      '/master-data/widgets/facial-collect': (context) => const FacialCollectWidget(),
      '/master-data/widgets/expandable-area': (context) => const ExpandableAreaWidget(),
    };
  }
}