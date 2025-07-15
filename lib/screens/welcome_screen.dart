import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/handyman_illustration.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.blueGradient,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Hero Image Section
                      Container(
                        width: double.infinity,
                        height: 280,
                        margin: const EdgeInsets.only(bottom: 40),
                        child: const HandymanIllustration(),
                      ),

                      // Content Card
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(32),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.cardShadow,
                              blurRadius: 20,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            // Title
                            Text(
                              'Ready to Fix Your Home with HandyHub',
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColors.darkestGray,
                                height: 1.3,
                              ),
                              textAlign: TextAlign.center,
                            ),

                            const SizedBox(height: 16),

                            // Description
                            Text(
                              'Connect with skilled professionals for all your home repair and maintenance needs. Quick, reliable, and trusted service at your fingertips.',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppColors.darkGray,
                                height: 1.5,
                              ),
                              textAlign: TextAlign.center,
                            ),

                            const SizedBox(height: 32),

                            // Get Started Button
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/login');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryOrange,
                                  foregroundColor: Colors.white,
                                  elevation: 8,
                                  shadowColor: AppColors.buttonShadow,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  padding: const EdgeInsets.symmetric(vertical: 18),
                                ),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    gradient: AppColors.orangeGradient,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Get Started',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 24),

                            // Login Link
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/login');
                              },
                              child: Text(
                                'Already have an account? Log in',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: AppColors.textGray,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Bottom Safe Area
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
