import 'dart:async';
import 'package:flutter/material.dart';

class HomeTab{
  static const int explore = 0;
  static const int favorites = 1;
  static const int my_cart = 2;
  static const int my_profile = 3;
}

class AppStateManager extends ChangeNotifier {

  // App state variables that defines the app's state
  bool _initialized = false;
  bool _loggedIn = false;
  bool _onboardingComplete = false;
  int _selectedTab = HomeTab.explore;

  // getters to for unidirectional flow architecture
  bool get isInitialized => _initialized;
  bool get isLoggedIn => _loggedIn;
  bool get isOnboardingComplete => _onboardingComplete;
  int get getSelectedTab => _selectedTab;

  // App state functions
void initializeApp() {
  Timer(const Duration(milliseconds: 2500), () {
    _initialized = true;
    notifyListeners();
  } );
}

  void login(String username, String password) {
    _loggedIn = true;
    notifyListeners();
  }

  void completeOnboarding() {
    _onboardingComplete = true;
    notifyListeners();
  }

  void goToHomeTab(index) {
    _selectedTab = index;
    notifyListeners();
  }

  void logout() {
    _loggedIn = false;
    _onboardingComplete = false;
    _initialized = false;
    _selectedTab = 0;
    initializeApp();
    notifyListeners();
  }

}