import 'package:connect/screens/create_event.dart';
import 'package:connect/utils/app_color.dart';
import 'package:connect/utils/image_utils.dart';
import 'package:connect/widgets/manage_eventcard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ManageEventPage extends StatefulWidget {
  const ManageEventPage({super.key});

  @override
  State<ManageEventPage> createState() => _ManageEventPageState();
}

class _ManageEventPageState extends State<ManageEventPage> {
  int selectedDateIndex = 1; // 12th Feb is pre-selected

  final List<String> dates = [
    '11th Feb\nSunday',
    '12th Feb\nMonday',
    '13th Feb\nTuesday',
    '14th Feb\nWednesday',
    '15th Feb\nThursday',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFDEBC),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Manage Event',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        leadingWidth: 70,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Date Scroller
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dates.length,
                itemBuilder: (context, index) {
                  final isSelected = index == selectedDateIndex;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDateIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xFFFFE8D0) : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          width: 1,
                          color: isSelected
                              ? const Color(0xFFFFDEBC)
                              : const Color(0xFFBFBFBF),
                        ),
                      ),
                      child: Text(
                        dates[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: isSelected ? Colors.black : Colors.grey[600],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),

            // Conditional Rendering of Content
            Expanded(
              child: selectedDateIndex == 1
                  ? ListView(
                children: [
                  ManageEventCard(
                    image: ImageUtils.carouselImage1,
                    title: 'Pilates',
                    description:
                    'Maximize Gains, Minimize Fatigue: The Smart Approach to Split Strength Training',
                    instructor: 'Mr. Rajeev Sharma',
                    workoutType: 'Pilates',
                    dateTime: '12 Feb | 04:45 PM',
                    onEdit: () {},
                  ),
                  ManageEventCard(
                    image: ImageUtils.carouselImage1,
                    title: 'Yoga',
                    description:
                    'Maximize Gains, Minimize Fatigue: The Smart Approach to Split Strength Training',
                    instructor: 'Mr. Rajeev Sharma',
                    workoutType: 'Pilates',
                    dateTime: '12 Feb | 04:45 PM',
                    onEdit: () {},
                  ),
                  ManageEventCard(
                    image: ImageUtils.carouselImage1,
                    title: 'Aerobics',
                    description:
                    'Maximize Gains, Minimize Fatigue: The Smart Approach to Split Strength Training',
                    instructor: 'Mr. Rajeev Sharma',
                    workoutType: 'Pilates',
                    dateTime: '12 Feb | 04:45 PM',
                    onEdit: () {},
                  ),
                ],
              )
                  : _buildNoEventsView(),
            ),
          ],
        ),
      ),
      floatingActionButton: InkResponse(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateEventPage()),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(100),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(ImageUtils.addIcon),
              const SizedBox(width: 8),
              const Text(
                "Create Event",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Method to Show No Events Found View
  Widget _buildNoEventsView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Asset Image (Use your image path here)
          Image.asset(ImageUtils.noEventsFound, // Use correct asset path
            height: 361,
            width: 300,
          ),
          const SizedBox(height: 12),
          const Text(
            'No events found!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.blackFontColor,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: const Text(
              'There are no events created yet. Kindly create one.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.fontGreyColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
