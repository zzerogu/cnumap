

import 'package:flutter/material.dart';
import 'package:moducnu/domain/model/Place.dart';
import 'package:moducnu/presentation/common/place_item.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('검색'),
      ),
      body: const Column(
        children: [
          PlaceItem(
            place: Place(
              placeName: '충남대학교 도서관',
              category: '도서관',
              address: '충남대학교 도서관',
              contact: '041-123-4567',
            ),
          ),
        ],
      ),
    );
  }
}
