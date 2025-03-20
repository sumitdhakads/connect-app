import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:connect/utils/app_color.dart';
import 'package:connect/utils/image_utils.dart';

class CreateEventPage extends StatefulWidget {
  const CreateEventPage({super.key});

  @override
  State<CreateEventPage> createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  bool isEventLive = false;
  int slots = 10;
  bool isPrepaid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar:AppBar(
        backgroundColor: const Color(0xFFFFDEBC), // Updated color
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Create Event',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.blackFontColor,
          ),
        ),
        leadingWidth: 70,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios,size: 20, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            // Event Name
            const Text(
              'Event Name',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.blackFontColor,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'E.g. Pilates Session',
                filled: true,
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.fontGreyColor,
                ),
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Color(0x52737373), // 32% opacity
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Color(0x52737373), // 32% opacity
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
            ),
            const SizedBox(height: 24),

            // Upload Images
            const Text(
              'Upload Images',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.blackFontColor,
              ),
            ),
            const SizedBox(height: 6),
            CustomPaint(
              painter: DashedBorderPainter(
                color: const Color(0xFFE3C3B8),
                strokeWidth: 1,
                gap: 5.0,
                radius: 8.0,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.secondaryColor
                        ),
                        child: SvgPicture.asset(
                          ImageUtils.uploadIcon,
                          height: 18,
                          width: 20,
                          colorFilter: const ColorFilter.mode(
                           Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Click to upload image',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.blackFontColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'SVG, PNG, JPG or GIF (max. 800×400px)',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.fontGreyColor,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Event Status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Event Status',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackFontColor,
                  ),
                ),
                Switch(
                  value: isEventLive,
                  onChanged: (value) {
                    setState(() {
                      isEventLive = value;
                    });
                  },
                  activeColor: Colors.green,
                  activeTrackColor: Colors.green.withOpacity(0.5),
                ),
              ],
            ),
            Text(
              'Make event live for users',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.fontGreyColor,
              ),
            ),

            const SizedBox(height: 24),

            // Aadhaar Card
            const Text(
              'Aadhaar Card',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.blackFontColor,
              ),
            ),
            const SizedBox(height: 6),
            CustomPaint(
              painter: DashedBorderPainter(
                color: const Color(0xFFE3C3B8),
                strokeWidth: 1,
                gap: 5.0,
                radius: 8.0,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.secondaryColor
                      ),
                      child: SvgPicture.asset(
                        ImageUtils.uploadIcon,
                        height: 18,
                        width: 20,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    SizedBox(width: 8,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Click to upload document',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.blackFontColor,
                          ),
                        ),
                        const Text(
                          'pdf, doc (max. 5MB)',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.fontGreyColor,
                            fontWeight: FontWeight.w400
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Pan Card
            const Text(
              'Pan Card',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.blackFontColor,
              ),
            ),
            const SizedBox(height: 6),
            CustomPaint(
              painter: DashedBorderPainter(
                color: const Color(0xFFE3C3B8),
                strokeWidth: 1,
                gap: 5.0,
                radius: 8.0,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 16),
                decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.secondaryColor
                      ),
                      child: SvgPicture.asset(
                        ImageUtils.uploadIcon,
                        height: 18,
                        width: 20,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    SizedBox(width: 8,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Click to upload document',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.blackFontColor,
                          ),
                        ),
                        const Text(
                          'pdf, doc (max. 5MB)',
                          style: TextStyle(
                              fontSize: 12,
                              color: AppColors.fontGreyColor,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Description
            const Text(
              'Description',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.blackFontColor,
              ),
            ),
            const SizedBox(height: 6),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter a description..',
                filled: true,
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.fontGreyColor,
                ),
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Color(0x52737373), // 32% opacity
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Color(0x52737373), // 32% opacity
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
              maxLines: 4,
            ),

            const SizedBox(height: 24),

            // Select Host
            const Text(
              'Select Host',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.blackFontColor,
              ),
            ),
            const SizedBox(height: 6),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.fontGreyColor,
                  width: 1,
                )
              ),
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  border: InputBorder.none,
                ),
                hint: const Text('--Select--'),
                isExpanded: true,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: <String>['Host 1', 'Host 2', 'Host 3'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {},
              ),
            ),

            const SizedBox(height: 24),

            // Skill Level
            const Text(
              'Skill Level',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.blackFontColor,
              ),
            ),
            const SizedBox(height: 6),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.fontGreyColor,
                  width: 1
                )
              ),
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  border: InputBorder.none,
                ),
                hint: const Text('--Select--'),
                isExpanded: true,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: <String>['Beginner', 'Intermediate', 'Advanced'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {},
              ),
            ),

            const SizedBox(height: 24),

            // Amount Per Attendee
            const Text(
              'Amount Per Attendee',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.blackFontColor,
              ),
            ),
            const SizedBox(height: 6),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 7.5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: AppColors.fontGreyColor, // Optional border for better visibility
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: '₹1000',
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomLeft: Radius.circular(8),
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColors.primaryBackground,
                            borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          '+ taxes',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
            const Text(
              'Number of Slots',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.blackFontColor,
              ),
            ),
            const SizedBox(height: 6),
            Container(
              width: 128,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 1,
                color: AppColors.fontGreyColor)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Row(
                  children: [
                    _slotButton('-', () {
                      setState(() {
                        if (slots > 0) slots--;
                      });
                    }),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        // border: Border.all(color: const Color(0xFFBFBFBF), width: 1),
                      ),
                      child: Text(
                        '$slots',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    _slotButton('+', () {
                      setState(() {
                        slots++;
                      });
                    }),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Things to Bring
            const Text(
              'Things to Bring',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.blackFontColor,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'E.g. Bring Water Bottle',
                filled: true,
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.fontGreyColor,
                ),
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Color(0x52737373), // 32% opacity
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Color(0x52737373), // 32% opacity
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () {},
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(Icons.add, size: 18, color: AppColors.blackFontColor),
                    const SizedBox(width: 4),
                    const Text(
                      'Add more',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackFontColor,
                      ),
                    ),
                  ],
                ),
            ),

            const SizedBox(height: 24),

            // Cancellation Policy
            const Text(
              'Cancellation Policy',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.blackFontColor,
              ),
            ),
            const SizedBox(height: 6),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter Cancellation Policy',
                filled: true,
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.fontGreyColor,
                ),
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Color(0x52737373), // 32% opacity
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Color(0x52737373), // 32% opacity
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
              maxLines: 4,
            ),

            const SizedBox(height: 20),

            // Payment Method
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Payment Method',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackFontColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Accept prepaid payment only',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.fontGreyColor,
                      ),
                    ),
                  ],
                ),
                Switch(
                  value: isPrepaid,
                  activeColor: Colors.green,
                  onChanged: (value) {
                    setState(() {
                      isPrepaid = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,bottom: 32),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 16.5),
          width: double.infinity,
          height: 52,
          decoration: BoxDecoration(
              color: Color(0xFFFFDEBC),
              borderRadius: BorderRadius.circular(12)
          ),
          child: Center(
            child: Text(
              "Confirm",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Custom painter to draw dashed borders
class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gap;
  final double radius;

  DashedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.gap,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    Path path = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        Radius.circular(radius),
      ));

    // Create a dash path
    Path dashPath = Path();
    double distance = 0.0;
    for (PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        dashPath.addPath(
          pathMetric.extractPath(distance, distance + 3), // Dash length
          Offset.zero,
        );
        distance += 3 + gap; // Dash length + gap
      }
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

Widget _slotButton(String label, VoidCallback onPressed) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.circular(8),
        // border: Border.all(color: const Color(0xFFBFBFBF), width: 1),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColors.fontGreyColor,
        ),
      ),
    ),
  );
}
