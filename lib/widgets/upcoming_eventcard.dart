import 'package:connect/utils/app_color.dart';
import 'package:flutter/material.dart';

class UpcomingEventCard extends StatelessWidget {
  final String imageUrl;
  final String eventName;
  final String organizerName;
  final String organizerLogo;
  final String eventTime;
  final String eventLocation;

  const UpcomingEventCard({
    super.key,
    required this.imageUrl,
    required this.eventName,
    required this.organizerName,
    required this.organizerLogo,
    required this.eventTime,
    required this.eventLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Event Image
          Image.asset(
            imageUrl,
            width: 88,
            height: 88,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 12),

          // Event Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Organizer Name + Logo
                Row(
                  children: [
                    // Organizer Logo
                    Container(
                      height: 20,
                      width: 20,
                      decoration:const BoxDecoration(
                        shape: BoxShape.circle
                      ),
                      child: Image.asset(
                        organizerLogo,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      organizerName,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0x99737373),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                // Event Name
                Text(
                  eventName,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.blackFontColor,
                  ),
                ),
                const SizedBox(height: 4),

                // Event Time
                Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      size: 13,
                      color: AppColors.fontGreyColor,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      eventTime,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackFontColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                // Event Location
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 14,
                      color: AppColors.fontGreyColor,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        eventLocation,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.blackFontColor,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
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
