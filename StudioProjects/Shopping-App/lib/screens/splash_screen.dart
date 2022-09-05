import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/navigation/shopping_pages.dart';

import '../app_state_manager.dart';

class SplashScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: ShoppingPages.splashPath,
      key: ValueKey(ShoppingPages.splashPath),
      child: const SplashScreen(),
    );
  }
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<AppStateManager>(context, listen: false).initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              height: 200,
              image: AssetImage('assets/wellcome.jpeg'),
            ),
            SizedBox(height: 10,),
            const Text('Happiness is not in money but in shopping...')
          ],
        ),
      ),
    );
  }
}
