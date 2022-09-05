import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/screens/screen_controller.dart';
import 'app_state_manager.dart';
import 'app_theme.dart';
import 'package:shopping_app/screens/AppData.dart';

import 'navigation/app_router.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appStateManager = AppStateManager();
  late AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _appRouter = AppRouter(
      appStateManager: _appStateManager,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = app_theme.dark();
    return  MultiProvider(
        providers:[
        ChangeNotifierProvider<ItemsOnSale>(create: (context) => ItemsOnSale()),
        ChangeNotifierProvider(create: (context) => _appStateManager,)
    ],
    child: MaterialApp(
      title: 'SHOPPING APP',
      theme: theme,
      home: Router(
        routerDelegate: _appRouter,
        
      )
    ));
  }
}
