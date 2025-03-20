import 'package:connect/utils/app_color.dart';
import 'package:connect/utils/image_utils.dart';
import 'package:connect/widgets/custom_divider.dart';
import 'package:connect/widgets/skill_indicator.dart';
import 'package:flutter/material.dart';

class PastEventDetails extends StatefulWidget {
  const PastEventDetails({super.key});

  @override
  State<PastEventDetails> createState() => _PastEventDetailsState();
}

class _PastEventDetailsState extends State<PastEventDetails> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  List<String> carouselImages = [
    ImageUtils.pastEventCarouselImage1,
    ImageUtils.pastEventCarouselImage1,
    ImageUtils.pastEventCarouselImage1,
  ];


  final List<String> images = [
    ImageUtils.profile1,
    ImageUtils.profile2,
    ImageUtils.profile3,
    ImageUtils.profile4,
    ImageUtils.profile5,
    ImageUtils.profile6,
  ];

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // **Carousel Section**
              Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 300,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            // **Carousel**
                            PageView.builder(
                              controller: _pageController,
                              itemCount: carouselImages.length,
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Image.asset(
                                  carouselImages[index],
                                  height: 280,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                );
                              },
                            ),

                            // **Logo Placement (Profile Picture)**


                            // **Dots Indicator**
                            Positioned(
                              bottom: 12,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(
                                  carouselImages.length,
                                      (i) => AnimatedContainer(
                                    duration: const Duration(milliseconds: 300),
                                    margin: const EdgeInsets.symmetric(horizontal: 4),
                                    width: i == currentPage ? 12 : 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: i == currentPage
                                          ? Colors.white
                                          : Colors.white.withOpacity(0.5),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            // **Back Button**
                            Positioned(
                              top: 15,
                              left: 12,
                              child: GestureDetector(
                                onTap: () => Navigator.pop(context),
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                  child: const Icon(Icons.arrow_back_ios_new_rounded,
                                      color: Colors.white,
                                  size: 16,),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 23,)
                    ],
                  ),
                  const Positioned(
                    left: 23,
                    bottom: 2,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(ImageUtils.theramoveLogo),
                      radius: 36,
                      backgroundColor: Colors.white,
                    ),
                  ),
                ],
              ),

        
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // **Event Details Section**
                     Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Theramove",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.fontGreyColor,
                                    ),
                                  ),
                                  Text(
                                    "₹299",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800,
                                      color: Color(0xFFE3C3B8),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Studio Pilates Session",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.blackFontColor,
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '12',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12,
                                            color: AppColors.blackFontColor,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' slots left',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.blackFontColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(Icons.access_time, size: 13,
                                      color: AppColors.fontGreyColor),
                                  SizedBox(width: 3),
                                  Text(
                                    "2 March, 2025 - 10:00 AM",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.blackFontColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    // **Event Description**
                    RichText(
                      text:const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Experience a full-body workout that enhances strength, flexibility, and posture. Our expert-led Pilates sessions focus on controlled movements, core...',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: AppColors.blackFontColor,
                              wordSpacing: 0.9
                            ),
                          ),
                          TextSpan(
                            text: ' read more',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFE3C3B8),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // **Location**
                    const Row(
                      children: [
                        Icon(Icons.location_on_outlined, size: 16,
                            color: AppColors.fontGreyColor),
                        SizedBox(width: 4),
                        Text(
                          "SCO-253, Sec-10, Noida",
                          style: TextStyle(fontSize: 14, color: AppColors.blackFontColor,
                          fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    // **Map Section**
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        ImageUtils.mapImage,
                        height: 140,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(height: 24),
                    CustomDivider(color: AppColors.secondaryColor,),
                    const SizedBox(height: 24),

                    // **Host Details**
                    const Text(
                      "Host Details",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.blackFontColor,
                      ),
                    ),

                    const SizedBox(height: 16),

                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(ImageUtils.theramoveLogo),
                                radius: 22,
                                backgroundColor: Colors.white,
                              ),
                              SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Theramove",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color:  Color(0xFFE3C3B8),
                                      ),
                                    ),
                                    Text(
                                      "+91 898563345",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.fontGreyColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12,),
                          CustomDivider(color: AppColors.secondaryColor,),
                          SizedBox(height: 12,),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Instructor: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    color: AppColors.blackFontColor,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Mr. Rajeev Sharma',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.blackFontColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 4,),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Workout Type: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    color: AppColors.blackFontColor,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Pilates',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.blackFontColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),


                    const SizedBox(height: 24),
                    CustomDivider(color: AppColors.secondaryColor,),
                    const SizedBox(height: 24),
                    Text("Attendees",style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.w700),),
                    const SizedBox(height: 16),
                Container(
                  color: const Color(0xFFFFF2E5), // Background color
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          // Overlapping attendee images using Stack
                          SizedBox(
                            height: 48,
                            width: 200, // Adjust width to control number of visible avatars
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                for (int i = 0; i < images.length; i++)
                                  Positioned(
                                    left: i * 40, // Adjust the overlap distance
                                    child: CircleAvatar(
                                      radius: 26,
                                      backgroundImage: AssetImage(images[i]),
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 70),
                          // +20 more section (positioned correctly)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                '+20 more',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                  const SizedBox(height: 24),
                  CustomDivider(color: AppColors.secondaryColor,),
                   const SizedBox(height: 24),
                    Text("Skill Level Indicator",style: TextStyle(fontSize: 16,
                        fontWeight: FontWeight.w700),),
                    const SizedBox(height: 16),
                    SkillLevelIndicator(progress: 0.3),
                    const SizedBox(height: 24),
                    CustomDivider(color: AppColors.secondaryColor,),
                    const SizedBox(height: 24),
                    const Text(
                      'Things to bring',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.blackFontColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...[
                      'Workout Clothes – Fitted & stretchy',
                      'Grip Socks – For stability & hygiene',
                      'Water Bottle – Stay hydrated',
                      'Towel – Wipe off sweat',
                      'Hair Ties – Keep hair out of the way',
                      'Mat – If not provided',
                      'Optional: Resistance bands, face wipes, light snack.'
                    ].map((item) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Row(
                        children: [
                          Container(
                            height: 16,
                              width: 16,
                              decoration: BoxDecoration(
                                color: Color(0xFFE3C3B8),
                                shape: BoxShape.circle
                              ),
                              child: const Icon(Icons.check, size: 10,
                                color: Colors.black,)),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.blackFontColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                    const SizedBox(height: 24),
                    CustomDivider(color: AppColors.secondaryColor,),
                    const SizedBox(height: 24),
                    // Cancellation Policy section
                    const Text(
                      'Cancellation Policy',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.blackFontColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...[
                      '24+ Hours Notice: Full refund or reschedule.',
                      'Less Than 24 Hours: No refund, but rescheduling may be allowed (studio discretion).',
                      'No-Show: Full session fee charged.',
                      'Late Arrival: Entry may be denied; session fee applies.'
                    ].map((item) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '• ',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                          Expanded(
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                                color: AppColors.blackFontColor,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                    SizedBox(height: 50,),
                  ],
                ),
              ),
            ],
          ),
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
              "Book Now",
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
