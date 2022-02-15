import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotifyver1/theme.dart';
import 'package:spotifyver1/themechanger.dart';
import 'package:spotifyver1/widget/widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ChangeNotifierProvider(
      create: (context) => ThemeChanger(), child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Spotify ver1",
      themeMode: context.watch<ThemeChanger>().darktheme
          ? ThemeMode.dark
          : ThemeMode.light,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.dartTheme,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  SideMenu(),
                  Expanded(
                    child: Container(),
                  )
                ],
              ),
            ),
            Container(
              width: double.maxFinite,
              height: 60.0,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
