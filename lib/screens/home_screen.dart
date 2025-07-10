import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../widgets/service_category_card.dart';
import '../widgets/recommendation_card.dart';
import '../widgets/promotional_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Container(
                decoration: const BoxDecoration(
                  gradient: AppColors.blueGradient,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // User Greeting and Profile
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Good Morning,',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.white.withOpacity(0.8),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Sarah Johnson',
                                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.white.withOpacity(0.2),
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Search Bar
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'What service do you need?',
                            hintStyle: TextStyle(color: AppColors.textGray),
                            prefixIcon: Icon(
                              Icons.search,
                              color: AppColors.textGray,
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Promotional Banner
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: PromotionalBanner(),
              ),

              const SizedBox(height: 32),

              // Service Categories Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Our Services',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkestGray,
                      ),
                    ),
                    const SizedBox(height: 16),
                    
                    // Service Categories Grid
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 1.1,
                      children: const [
                        ServiceCategoryCard(
                          title: 'Electrical',
                          icon: Icons.electrical_services,
                          color: AppColors.primaryYellow,
                        ),
                        ServiceCategoryCard(
                          title: 'Plumbing',
                          icon: Icons.plumbing,
                          color: AppColors.primaryBlue,
                        ),
                        ServiceCategoryCard(
                          title: 'Air Conditioning',
                          icon: Icons.ac_unit,
                          color: AppColors.primaryOrange,
                        ),
                        ServiceCategoryCard(
                          title: 'Installations',
                          icon: Icons.build,
                          color: AppColors.secondaryBlue,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Recommendations Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recommended for You',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.darkestGray,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Handle see all
                          },
                          child: Text(
                            'See All',
                            style: TextStyle(
                              color: AppColors.primaryBlue,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    
                    // Recommendations List
                    const Column(
                      children: [
                        RecommendationCard(
                          title: 'Home Electrical Inspection',
                          provider: 'ElectricPro Services',
                          rating: 4.8,
                          price: '\$85',
                          imageUrl: '',
                        ),
                        SizedBox(height: 12),
                        RecommendationCard(
                          title: 'Kitchen Faucet Repair',
                          provider: 'PlumbMaster Solutions',
                          rating: 4.9,
                          price: '\$65',
                          imageUrl: '',
                        ),
                        SizedBox(height: 12),
                        RecommendationCard(
                          title: 'AC Unit Maintenance',
                          provider: 'CoolAir Specialists',
                          rating: 4.7,
                          price: '\$120',
                          imageUrl: '',
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.primaryBlue,
          unselectedItemColor: AppColors.textGray,
          currentIndex: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border),
              label: 'Bookings',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
