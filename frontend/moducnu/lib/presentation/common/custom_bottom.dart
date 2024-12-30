import 'package:flutter/material.dart';
import 'bottom_sheet_buttons.dart';



class CustomBottomSheet extends StatelessWidget {
  final String location;
  final String details;

  CustomBottomSheet({required this.location, required this.details});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            location,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(details),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.directions),
                label: Text('출발'),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.navigation),
                label: Text('도착'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Divider(),
          SizedBox(height: 10),
          BottomSheetButtons(), // 버튼 위젯 연결
        ],
      ),
    );
  }
}
