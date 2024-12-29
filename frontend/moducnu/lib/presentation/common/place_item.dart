import 'package:flutter/material.dart';
import 'package:moducnu/domain/model/Place.dart'; // Import the Place model

class PlaceItem extends StatelessWidget {
  final Place place;

  // Constructor to initialize the properties
  const PlaceItem({
    super.key,
    required this.place,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300, // Border color
            width: 1.0, // Border width
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Left side: Place Name and Category
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Place Name and Category
                  Row(
                    children: [
                      Text(
                        place.placeName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Text(
                        place.category,
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4.0),
                  // Address
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 18, color: Colors.red),
                      const SizedBox(width: 4.0),
                      Text(
                        place.address,
                        style: const TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  // Contact
                  Row(
                    children: [
                      const Icon(Icons.phone, size: 18, color: Colors.blue),
                      const SizedBox(width: 4.0),
                      Text(
                        place.contact,
                        style: const TextStyle(fontSize: 14, color: Colors.blue),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Right side: Right Arrow Icon
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios, size: 20),
              onPressed: () {
                // Define the action when the right arrow is tapped
                print("Right arrow clicked for ${place.placeName}");
              },
            ),
          ],
        ),
      ),
    );
  }
}
