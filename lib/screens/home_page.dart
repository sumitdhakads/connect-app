import 'package:connect/screens/manage_eventspage.dart';
import 'package:connect/screens/pastevent_detail.dart';
import 'package:connect/utils/app_color.dart';
import 'package:connect/widgets/custom_appbar.dart';
import 'package:connect/widgets/custom_eventcard.dart';
import 'package:connect/widgets/draggable_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:connect/utils/image_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  PageController _pageController = PageController(viewportFraction: 0.85);

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.85);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    if (index == 3) {
      // Navigate to the ManageEventPage when Events tab is clicked
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  ManageEventPage()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }


  List<String> carouselImages = [ImageUtils.carouselImage1, ImageUtils.carouselImage2,
    ImageUtils.carouselImage3, ImageUtils.carouselImage1,ImageUtils.carouselImage2];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: Stack(
        children: [
          // Added SingleChildScrollView here to make the Column scrollable
          SingleChildScrollView(
            child: Column(
              children: [
                // Custom AppBar Section
                const CustomAppBar(),
                const SizedBox(height: 32),

                // Title Section
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Text(
                        'Past Events',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Around You',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFE3C3B8),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Animated Carousel Section
                SizedBox(
                  height: 475,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: carouselImages.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return AnimatedBuilder(
                        animation: _pageController,
                        builder: (context, child) {
                          double value = 0.0;
                          if (_pageController.position.haveDimensions) {
                            value = index - (_pageController.page ?? 0);
                            value = (1 - (value.abs() * 0.2)).clamp(0.8, 1.0);
                          }

                          return Transform.scale(
                            scale: value, // Scale animation
                            child: Opacity(
                              opacity: value, // Fade effect
                              child: CustomEventCard(
                                imageUrl: carouselImages[index],
                                title: 'Studio Pilates Session',
                                subtitle: 'ABC Fitness Hub',
                                onTap: () {
                                  // print('Card $index tapped');
                               Navigator.push(context,
                                   MaterialPageRoute(builder: (context) => PastEventDetails()));
                                },
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),


                const SizedBox(height: 16),
                const SizedBox(height: 80),
              ],
            ),
          ),

          // Bottom Sheet
          const DraggableBottomSheet()
        ],
      ),
      bottomNavigationBar: Container(
          height: 75,
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, -1),
              ),
            ],
          ),
          child: Container(
            height: 80,
            decoration: const BoxDecoration(
              color: Color(0xFF1F1F1F),
            ),
            child: BottomNavigationBar(
              iconSize: 28,
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              selectedItemColor: const Color(0xFFDEBC00),
              unselectedItemColor: Colors.white,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              elevation: 0, // Remove default shadow
              selectedLabelStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Color(0xFFDEBC00),
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              items: [
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          if (_selectedIndex == 0)
                            Container(
                              width: 50,
                              height: 40,
                              decoration: BoxDecoration(
                                border: const Border(
                                    top: BorderSide(
                                        color: Color(0xFFDEBC00),
                                        width: 4
                                    )
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    const Color(0xFFDEBC00).withOpacity(0.3),
                                    Colors.transparent,
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                            ),
                          SvgPicture.asset(
                            ImageUtils.homeIcon,
                            width: 28,
                            height: 28,
                            colorFilter: ColorFilter.mode(
                              _selectedIndex == 0 ? const Color(0xFFDEBC00) : Colors.white,
                              BlendMode.srcIn,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          if (_selectedIndex == 1)
                            Container(
                              width: 50,
                              height: 40,
                              decoration: BoxDecoration(
                                border: const Border(
                                    top: BorderSide(
                                        color: Color(0xFFDEBC00),
                                        width: 4
                                    )
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    const Color(0xFFDEBC00).withOpacity(0.3),
                                    Colors.transparent,
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                            ),
                          SvgPicture.asset(
                            ImageUtils.workoutIcon,
                            width: 28,
                            height: 28,
                            colorFilter: ColorFilter.mode(
                              _selectedIndex == 1 ? const Color(0xFFDEBC00) : Colors.white,
                              BlendMode.srcIn,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  label: 'Workout',
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          if (_selectedIndex == 2)
                            Container(
                              width: 50,
                              height: 40,
                              decoration: BoxDecoration(
                                border:  const Border(
                                    top: BorderSide(
                                        color: Color(0xFFDEBC00),
                                        width: 4
                                    )
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    const Color(0xFFDEBC00).withOpacity(0.3),
                                    Colors.transparent,
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                            ),
                          SvgPicture.asset(
                            ImageUtils.wellnessIcon,
                            width: 28,
                            height: 28,
                            colorFilter: ColorFilter.mode(
                              _selectedIndex == 2 ? const Color(0xFFDEBC00) : Colors.white,
                              BlendMode.srcIn,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  label: 'Wellness',
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          if (_selectedIndex == 3)
                            Container(
                              width: 50,
                              height: 40,
                              decoration: BoxDecoration(
                                border:  const Border(
                                    top: BorderSide(
                                        color: Color(0xFFDEBC00),
                                        width: 4
                                    )
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    const Color(0xFFDEBC00).withOpacity(0.3),
                                    Colors.transparent,
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                            ),
                          SvgPicture.asset(
                            ImageUtils.eventIcon,
                            width: 28,
                            height: 28,
                            colorFilter: ColorFilter.mode(
                              _selectedIndex == 3 ? const Color(0xFFDEBC00) : Colors.white,
                              BlendMode.srcIn,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  label: 'Events',
                ),
              ],
            ),
          )
      ),
    );
  }
}