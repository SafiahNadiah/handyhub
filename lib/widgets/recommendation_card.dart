import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class RecommendationCard extends StatelessWidget {
  final String title;
  final String provider;
  final double rating;
  final String price;
  final String imageUrl;

  const RecommendationCard({
    super.key,
    required this.title,
    required this.provider,
    required this.rating,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle recommendation selection
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Selected $title')),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.cardShadow,
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Service Image
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.lightGray,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  _getServiceIcon(),
                  size: 30,
                  color: AppColors.primaryBlue,
                ),
              ),

              const SizedBox(width: 16),

              // Service Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkestGray,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      provider,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.textGray,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 16,
                          color: AppColors.primaryYellow,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          rating.toString(),
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkGray,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          price,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryOrange,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getServiceIcon() {
    if (title.toLowerCase().contains('electrical')) {
      return Icons.electrical_services;
    } else if (title.toLowerCase().contains('plumb') || title.toLowerCase().contains('faucet')) {
      return Icons.plumbing;
    } else if (title.toLowerCase().contains('ac') || title.toLowerCase().contains('air')) {
      return Icons.ac_unit;
    } else {
      return Icons.home_repair_service;
    }
  }
}
