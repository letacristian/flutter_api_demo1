import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_api_demo1/themes.dart';
import 'package:flutter_api_demo1/utils/user_preferences.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter_api_demo1/widgets/list_widget.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String title = 'User Profile';

  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    return ThemeProvider(
        initTheme: user.condition ? MyThemes.darkTheme : MyThemes.lightTheme,
        child: Builder(
          builder: (context) => const MaterialApp(
            debugShowCheckedModeBanner: false,
            title: title,
            home: MyStatelessWidget(),
          ),
        ));
  }
}

class MyStatelessWidget extends StatefulWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  State<MyStatelessWidget> createState() => _MyStatelessWidgetState();
}

class _MyStatelessWidgetState extends State<MyStatelessWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Floating Action Button'),
      ),
      drawer: const Drawer(),
      body: const ListWidget(),
    );
  }
}
