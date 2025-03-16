import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  String selectedCity = 'Delhi'; // Default city
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      color: const Color(0xFFFFF2E5), // AppBar background color
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Location Section with Dropdown
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    DropdownButton<String>(
                      value: selectedCity,
                      dropdownColor: Colors.white,
                      underline: const SizedBox(), // Remove default underline
                      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black, size: 20),
                      items: ['Delhi',].map((String city) {
                        return DropdownMenuItem<String>(
                          value: city,
                          child: Text(
                            city,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            selectedCity = newValue;
                          });
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  'Rajeev Chowk, Metro Station...',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF1F1F1F), // Updated color
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            // Profile Avatar Section
            Container(
                height: 36,
                width: 36,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/images/profile-connect.png')
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
