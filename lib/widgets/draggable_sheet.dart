import 'package:connect/utils/app_color.dart';
import 'package:connect/utils/image_utils.dart';
import 'package:connect/widgets/categories_tag.dart';
import 'package:connect/widgets/custom_divider.dart';
// import 'package:connect/widgets/popular_eventscard.dart';
import 'package:connect/widgets/upcoming_eventcard.dart';
import 'package:flutter/material.dart';

class DraggableBottomSheet extends StatefulWidget {
  const DraggableBottomSheet({super.key});

  @override
  State<DraggableBottomSheet> createState() => _DraggableBottomSheetState();
}

class _DraggableBottomSheetState extends State<DraggableBottomSheet> {
  final DraggableScrollableController _bottomSheetController =
  DraggableScrollableController();

  late PageController _pageController;
  double currentPage = 0;


  List<String> carouselImages = [
    ImageUtils.carouselImage2,
    ImageUtils.carouselImage1,
    ImageUtils.carouselImage3,
    ImageUtils.carouselImage1,
    ImageUtils.carouselImage2,
  ];

  List<String> categoriesImages = [
    ImageUtils.categoriesImages1,
    ImageUtils.categoriesImages2,
    ImageUtils.categoriesImages3,
    ImageUtils.categoriesImages4,
    ImageUtils.categoriesImages5,
    ImageUtils.categoriesImages6,
    ImageUtils.categoriesImages7
  ];

  List<String> categoriesNames = [
    "Yoga",
    "Mat Pilates",
    "Aqua Fitness",
    "Spa events",
    "Meditation sessions",
    "Wellness workshops",
    "Nutrition seminars"
  ];


  @override
  void initState() {
    super.initState();

    _pageController = PageController(viewportFraction: 0.85)
      ..addListener(() {
        setState(() {
          currentPage = _pageController.page ?? 0;
        });
      });

    _bottomSheetController.addListener(() {
      if (_bottomSheetController.size <= 0.08) {
        _bottomSheetController.animateTo(
          0.13,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOut, // Smooth animation on close
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _bottomSheetController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: DraggableScrollableSheet(
        initialChildSize: 0.13,
        minChildSize: 0.08,
        maxChildSize: 0.9,
        controller: _bottomSheetController,
        // snap: true,
        builder: (context, scrollController) {
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(0, -1),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Container(
                    width: 70,
                    height: 5,
                    margin: const EdgeInsets.only(top: 8), // Add margin to position it correctly
                    decoration: BoxDecoration(
                      color: const Color(0xFFE2E2E2),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    padding: const EdgeInsets.only(top: 8, bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Center(
                        //   child: Container(
                        //     width: 70,
                        //     height: 5,
                        //     decoration: BoxDecoration(
                        //       color: const Color(0xFFE2E2E2),
                        //       borderRadius: BorderRadius.circular(100),
                        //     ),
                        //   ),
                        // ),
                        const SizedBox(height: 12),
                        // Search Bar - with paddings
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            height: 56,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: const Color(0x99737373),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                  size: 24,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Search for events',
                                      hintStyle: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 16,
                                      ),
                                      border: InputBorder.none,
                                      isDense: true,
                                      contentPadding:
                                      const EdgeInsets.symmetric(vertical: 14),
                                    ),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Section titles - with paddings
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Text(
                                'Upcoming',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Event',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFE3C3B8),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Upcoming event card - with paddings
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: UpcomingEventCard(
                              imageUrl: ImageUtils.upcomingEventImage1,
                              eventName: "Zumba Dance WorkOut",
                              organizerName: "ABC Fitness Hub",
                              organizerLogo: ImageUtils.zumbaCardLogo,
                              eventTime: "Tomorrow, 10:00 AM",
                              eventLocation: "SCO-253, Sec-10, Noida"),
                        ),
                        const SizedBox(height: 24),
                        // Divider - with paddings
                         Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomDivider(),
                        ),
                        const SizedBox(height: 24),
                        // Categories title - with paddings
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text("Categories",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.blackFontColor)),
                        ),
                        const SizedBox(height: 16),
                        // Categories list - NO horizontal padding for container, only for first item
                        SizedBox(
                          height: 40, // Height for the category list
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal, // Horizontal scrolling
                            itemCount: categoriesNames.length,
                            padding: const EdgeInsets.only(left: 20), // Left padding only for first item
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 8), // Space between items
                                child: CategoriesTag(
                                  image: categoriesImages[index],
                                  title: categoriesNames[index],
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Divider - with paddings
                        Padding(
                          padding:const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomDivider(),
                        ),
                        const SizedBox(height: 24),
                        // Popular events title - with paddings
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Text(
                                'Popular',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Events',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFFE3C3B8),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                    SizedBox(
                      height: 500,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: carouselImages.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          double scale = (1 - (currentPage - index).abs()).clamp(0.85, 1.0);
                          double opacity = (1 - (currentPage - index).abs()).clamp(0.3, 1.0);
                          double zIndex = (currentPage - index).abs();
                  
                          return Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..translate(0.0, zIndex * 20.0, -zIndex * 100.0) // Back-to-front scaling
                              ..scale(scale),
                            child: Opacity(
                              opacity: opacity,
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeOut,
                                margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 8,
                                      offset: Offset(0, 10),
                                      spreadRadius: 1,
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    // Background Image Scaling Animation
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.asset(
                                        carouselImages[index],
                                        height: 400,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                  
                                    // Growing Content Animation from Behind
                                    Positioned(
                                      left: 0,
                                      right: 0,
                                      bottom: -140 * (1 - scale),
                                      child: AnimatedContainer(
                                        duration: const Duration(milliseconds: 300),
                                        height: 160,
                                        padding: const EdgeInsets.all(16),
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.vertical(
                                            bottom: Radius.circular(16),
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            // Title and Price
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'Studio Pilates Session',
                                                  style: TextStyle(
                                                    fontSize: 16 * scale,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                Text(
                                                  '₹299',
                                                  style: TextStyle(
                                                    fontSize: 14 * scale,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 4),
                  
                                            // Organizer and Slots
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    const CircleAvatar(
                                                      backgroundImage: AssetImage(ImageUtils.zumbaCardLogo),
                                                      radius: 12,
                                                    ),
                                                    const SizedBox(width: 4),
                                                    Text(
                                                      'ABC Fitness Hub',
                                                      style: TextStyle(
                                                        fontSize: 12 * scale,
                                                        fontWeight: FontWeight.w500,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: '12',
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 12 * scale,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: ' slots left',
                                                        style: TextStyle(
                                                          fontSize: 12 * scale,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 4),
                  
                                            // Event Time and Location
                                            Row(
                                              children: [
                                                Icon(Icons.access_time, size: 16 * scale, color: Colors.grey),
                                                const SizedBox(width: 4),
                                                Text(
                                                  '2 March, 2025 10:00 AM',
                                                  style: TextStyle(
                                                    fontSize: 12 * scale,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 4),
                                            Row(
                                              children: [
                                                Icon(Icons.location_on_outlined, size: 16 * scale, color: Colors.grey),
                                                const SizedBox(width: 4),
                                                Expanded(
                                                  child: Text(
                                                    'SCO-253, Sec-10, Noida',
                                                    style: TextStyle(
                                                      fontSize: 12 * scale,
                                                      color: Colors.grey,
                                                    ),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 4),
                  
                                            // Interested Count
                                            Row(
                                              children: [
                                                Icon(Icons.group_outlined, size: 16 * scale, color: Colors.grey),
                                                const SizedBox(width: 4),
                                                RichText(
                                                  text: TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: '200',
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 12 * scale,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: ' interested',
                                                        style: TextStyle(
                                                          fontSize: 12 * scale,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 80),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}