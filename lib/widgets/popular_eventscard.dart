import 'package:connect/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:connect/utils/app_color.dart';

class PopularEventsCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String organizerName;
  final String organizerLogo;
  final String eventTime;
  final String eventLocation;
  final String price;
  final String slotsLeft;
  final String interestedCount;

  const PopularEventsCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.organizerName,
    required this.organizerLogo,
    required this.eventTime,
    required this.eventLocation,
    required this.price,
    required this.slotsLeft,
    required this.interestedCount,
  });

  @override
  State<PopularEventsCard> createState() => _PopularEventsCardState();
}

class _PopularEventsCardState extends State<PopularEventsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(right: 20, bottom: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 50,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            spreadRadius: 0,
            offset: const Offset(0, 5), // Secondary lift effect
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Event Image with Icon Overlay
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.asset(
                widget.imageUrl,
                width: double.infinity,
                height: 320,
                fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Image(
                    image: AssetImage(ImageUtils.volumeOff),
                    // height: 16,
                    width: 13,
                  )
                ),
              ),
            ],
          ),

          // Event Details
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Event Title
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.blackFontColor,
                      ),
                    ),
                    Text(widget.price,
                    style: const TextStyle(fontWeight: FontWeight.w800,
                    fontSize: 16,
                    color: Color(0xFFE3C3B8)),)
                  ],
                ),
                const SizedBox(height: 4),

                // Organizer Info
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(widget.organizerLogo),
                          radius: 12,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          widget.organizerName,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.fontGreyColor,
                          ),
                        ),
                      ],
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: widget.slotsLeft,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              color: AppColors.blackFontColor,
                            ),
                          ),
                          const TextSpan(
                            text: ' slots left',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColors.blackFontColor,
                            ),
                          ),
                        ],
                      ),
                    )

                  ],
                ),
                const SizedBox(height: 8),

                // Event Time and Location
                Row(
                  children: [
                    const Icon(Icons.access_time, size: 16,
                        color: AppColors.fontGreyColor),
                    const SizedBox(width: 4),
                    Text(
                      widget.eventTime,
                      style:const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackFontColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 16,
                        color: AppColors.fontGreyColor),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        widget.eventLocation,
                        style:const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.blackFontColor,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),

                // Interested Count
                Row(
                  children: [
                    const Icon(Icons.group_outlined,
                      size: 16,color: AppColors.fontGreyColor,),
                    const SizedBox(width: 4),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: widget.interestedCount,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12,
                              color: AppColors.blackFontColor,
                            ),
                          ),
                          const TextSpan(
                            text: ' interested',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: AppColors.blackFontColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
