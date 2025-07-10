import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class SocialLoginButton extends StatelessWidget {
  final String text;
  final String iconPath;
  final VoidCallback onPressed;

  const SocialLoginButton({
    super.key,
    required this.text,
    required this.iconPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          side: BorderSide(color: AppColors.lightGray),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon placeholder - in a real app, you'd use Image.asset() or SvgPicture
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: _getIconColor(),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Icon(
                _getIconData(),
                size: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.darkerGray,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getIconColor() {
    if (iconPath.contains('google')) {
      return const Color(0xFF4285F4); // Google blue
    } else if (iconPath.contains('apple')) {
      return Colors.black; // Apple black
    }
    return AppColors.primaryBlue;
  }

  IconData _getIconData() {
    if (iconPath.contains('google')) {
      return Icons.g_mobiledata; // Google icon approximation
    } else if (iconPath.contains('apple')) {
      return Icons.apple; // Apple icon
    }
    return Icons.login;
  }
}
