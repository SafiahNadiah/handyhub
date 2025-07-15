import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class HandymanIllustration extends StatelessWidget {
  const HandymanIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primaryBlue.withOpacity(0.3),
            AppColors.secondaryBlue.withOpacity(0.5),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Handyman Icon
          Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              color: AppColors.primaryOrange,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.handyman,
              size: 40,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 16),

          // Title
          Text(
            'Expert Handyman',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.darkBlue,
            ),
          ),

          const SizedBox(height: 8),

          // Tools Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildToolIcon(Icons.build),
              const SizedBox(width: 12),
              _buildToolIcon(Icons.electrical_services),
              const SizedBox(width: 12),
              _buildToolIcon(Icons.plumbing),
              const SizedBox(width: 12),
              _buildToolIcon(Icons.home_repair_service),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildToolIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        icon,
        size: 20,
        color: AppColors.darkBlue,
      ),
    );
  }
}
