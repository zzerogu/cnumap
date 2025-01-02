import 'package:flutter/material.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const CategoryChip({
    Key? key,
    required this.label,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        decoration: BoxDecoration(
          color: isActive ? Colors.orange : Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: isActive ? Colors.orange : Colors.grey,
            width: 1.0,
          ),
          boxShadow: isActive
              ? [
            BoxShadow(
              color: Colors.orange.withOpacity(0.4),
              blurRadius: 6.0,
              offset: const Offset(0, 2),
            ),
          ]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isActive) ...[
              const Icon(Icons.check_sharp, color: Colors.white, size: 16),
              const SizedBox(width: 4),
            ],
            Text(
              label,
              style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.normal,
                color: isActive ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// '내 장소' 고정된 카테고리 디자인
class MyPlaceCategoryChip extends StatelessWidget {
  final bool isActive;
  final VoidCallback onTap;

  const MyPlaceCategoryChip({
    super.key,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isActive ? Colors.orange : Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(
            color: isActive ? Colors.orange : Colors.orange,
            width: 1.0,
          ),
          boxShadow: isActive
              ? [
            BoxShadow(
              color: Colors.orange.withOpacity(0.4),
              blurRadius: 6.0,
              offset: const Offset(0, 2),
            ),
          ]
              : [],
        ),
        child: Row(
          children: [
             Icon(
              Icons.favorite,
              size: 16.0,
              color: isActive? Colors.white : Colors.orange,
            ),
            const SizedBox(width: 4.0), // 아이콘과 텍스트 사이 간격
            Text(
              '내 장소',
              style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.normal,
                color: isActive ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
