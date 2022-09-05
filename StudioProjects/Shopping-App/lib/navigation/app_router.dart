import 'package:flutter/material.dart';
import 'package:shopping_app/navigation/shopping_pages.dart';
import 'package:shopping_app/screens/login_screen.dart';
import 'package:shopping_app/screens/screen_controller.dart';
import 'package:shopping_app/screens/splash_screen.dart';
import 'package:shopping_app/screens/welcome_screen.dart';

import '../app_state_manager.dart';


class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  final AppStateManager appStateManager;

  AppRouter({
    required this.appStateManager,

  })
      : navigatorKey = GlobalKey<NavigatorState>() {
    //  Adding Listeners
    appStateManager.addListener(notifyListeners);
  }

  //  Dispose listeners
  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Navigator(

      key: navigatorKey,
      // TODO: Add onPopPage
      onPopPage: _handlePopPage,

      pages: [
        // logic for SplashScreen
        if (!appStateManager.isInitialized) SplashScreen.page(),
        // logic for LoginScreen
        if (appStateManager.isInitialized && !appStateManager.isLoggedIn)
          LoginScreen.page(),
        // logic for OnboardingScreen
        if (appStateManager.isLoggedIn &&
            !appStateManager.isOnboardingComplete)
          WelcomeScreen.page(),
        // logic for Home
        if (appStateManager.isOnboardingComplete)
          ScreenController.page(appStateManager.getSelectedTab),
        
        // TODO: Create new item
        // TODO: Select GroceryItemScreen
        // TODO: Add Profile Screen
        // TODO: Add WebView Screen
      ],
    );
  }

  // TODO: Add _handlePopPage
  bool _handlePopPage(

      Route<dynamic> route,

      result) {

    if (!route.didPop(result)) {

      return false;
    }


    // Handles Onboarding and splash
    if (route.settings.name == ShoppingPages.welcomePath) {
      appStateManager.logout();
    }

    // TODO: Handle state when user closes grocery item screen
    // TODO: Handle state when user closes profile screen
    // TODO: Handle state when user closes WebView screen

    return true;
  }


  @override
  Future<void> setNewRoutePath(configuration) async => null;
}
