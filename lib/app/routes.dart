import 'package:flutter/material.dart';

import '../screens/splash/splash_screen.dart';
import '../screens/auth/welcome_screen.dart';
import '../screens/auth/signup_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/forgot_password_screen.dart';
import '../screens/onboarding/style_preferences_screen.dart';
import '../screens/onboarding/occasion_preferences_screen.dart';
import '../screens/onboarding/wardrobe_goal_screen.dart';
import '../screens/onboarding/add_wardrobe_screen.dart';

class AppRoutes {
  static const splash = '/';
  static const welcome = '/welcome';
  static const signup = '/signup';
  static const login = '/login';
  static const forgotPassword = '/forgot-password';

  static const stylePreferences = '/onboarding/style';
  static const occasionPreferences = '/onboarding/occasion';
  static const wardrobeGoal = '/onboarding/goal';
  static const addWardrobe = '/onboarding/wardrobe';

  static Map<String, WidgetBuilder> get routes => {
        splash: (_) => const SplashScreen(),
        welcome: (_) => const WelcomeScreen(),
        signup: (_) => const SignupScreen(),
        login: (_) => const LoginScreen(),
        forgotPassword: (_) => const ForgotPasswordScreen(),

        stylePreferences: (_) =>
            const StylePreferencesScreen(),
        occasionPreferences: (_) =>
            const OccasionPreferencesScreen(),
        wardrobeGoal: (_) =>
            const WardrobeGoalScreen(),
        addWardrobe: (_) =>
            const AddWardrobeScreen(),
      };
}