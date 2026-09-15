
import 'package:flutter/material.dart';

import '../screens/splash/splash_screen.dart';
import '../screens/auth/welcome_screen.dart';
import '../screens/auth/signup_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/forgot_password_screen.dart';

class AppRoutes {
  static const splash = '/';
  static const welcome = '/welcome';
  static const signup = '/signup';
  static const login = '/login';
  static const forgotPassword = '/forgot-password';

  static Map<String, WidgetBuilder> get routes => {
        splash: (_) => const SplashScreen(),
        welcome: (_) => const WelcomeScreen(),
        signup: (_) => const SignupScreen(),
        login: (_) => const LoginScreen(),
        forgotPassword: (_) => const ForgotPasswordScreen(),
      };
}