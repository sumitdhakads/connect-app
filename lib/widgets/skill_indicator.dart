import 'package:connect/utils/app_color.dart';
import 'package:flutter/material.dart';

class SkillLevelIndicator extends StatelessWidget {
  final double progress; // Progress value (0.0 to 1.0)

  const SkillLevelIndicator({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFF2E5), // Background color
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              // Background progress bar
              Container(
                height: 16,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.orange, width: 1.5),
                ),
              ),
              // Filled progress bar
              Container(
                height: 16,
                width: 250 * progress, // Adjust width based on progress
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              // Circular handle at the end of progress
              Positioned(
                left: 250 * progress - 12, // Center handle over progress bar
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Beginner',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.blackFontColor,
            ),
          ),
        ],
      ),
    );
  }
}
