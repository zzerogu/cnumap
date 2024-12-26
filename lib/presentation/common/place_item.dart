import 'package:flutter/material.dart';
import 'package:moducnu/domain/model/Place.dart';


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
            color: Colors.grey.shade300, // Adjust the color as needed
            width: 1.0, // Border width
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
            const SizedBox(height: 8.0),
            // Address
            Row(
              children: [
                const Icon(Icons.location_on, size: 18, color: Colors.red),
                const SizedBox(width: 4.0),
                Text(place.address, style: const TextStyle(fontSize: 14, color: Colors.black)),
              ],
            ),
            const SizedBox(height: 8.0),
            // Contact
            Row(
              children: [
                const Icon(Icons.phone, size: 18, color: Colors.blue),
                const SizedBox(width: 4.0),
                Text(place.contact, style: const TextStyle(fontSize: 14, color: Colors.blue)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
