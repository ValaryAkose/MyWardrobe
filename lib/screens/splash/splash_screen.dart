import 'dart:async';

import 'package:flutter/material.dart';

import '../../app/routes.dart';
import '../../app/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () {
      if (!mounted) return;

      Navigator.pushReplacementNamed(
        context,
        AppRoutes.welcome,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyWardrobeColors.background,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 78,
                height: 78,
                decoration: BoxDecoration(
                  color: MyWardrobeColors.text,
                  borderRadius: BorderRadius.circular(22),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'MW',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -1,
                  ),
                ),
              ),

              const SizedBox(height: 22),

              const Text(
                'MY WARDROBE',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 3,
                  color: MyWardrobeColors.text,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Your wardrobe. Your style. Your AI stylist.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: MyWardrobeColors.secondaryText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
