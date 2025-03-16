import 'package:connect/utils/app_color.dart';
import 'package:flutter/material.dart';

  class CategoriesTag extends StatelessWidget {
    final String image;
    final String title;

    const CategoriesTag({
      super.key,
      required this.image,
      required this.title,
    });


    @override
    Widget build(BuildContext context) {
      return Container(
        padding:const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppColors.primaryBackground,
          border: Border.all(
            color: AppColors.secondaryColor, // 1px border with secondary color
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              image,
              width: 30,
              height: 24,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 6,),
            Text(title,style: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500),)
          ],
        ),
      );
    }
  }
