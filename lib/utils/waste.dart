// SizedBox(
//   height: 500,
//   child: PageView.builder(
//     controller: _pageController,
//     itemCount: carouselImages.length,
//     physics: const BouncingScrollPhysics(),
//     itemBuilder: (context, index) {
//       double scale = (1 - (currentPage - index).abs()).clamp(0.85, 1.0);
//       return AnimatedContainer(
//         duration: const Duration(milliseconds: 100),
//         margin: const EdgeInsets.symmetric(horizontal: 8),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16),
//         ),
//         transform: Matrix4.identity()..scale(scale),
//         child: PopularEventsCard(
//           imageUrl: carouselImages[index],
//           title: 'Studio Pilates Session',
//           organizerName: 'ABC Fitness Hub',
//           organizerLogo: ImageUtils.zumbaCardLogo,
//           eventTime: '2 March, 2025 10:00 AM',
//           eventLocation: 'SCO-253, Sec-10, Noida',
//           price: '₹299',
//           slotsLeft: '12',
//           interestedCount: '200',
//         ),
//       );
//     },
//   ),
// ),