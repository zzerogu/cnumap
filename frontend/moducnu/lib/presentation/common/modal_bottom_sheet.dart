import 'package:flutter/material.dart';
import 'package:moducnu/presentation/theme/color.dart';

// 모달 바텀시트 위젯 정의
class ModalBottomSheet extends StatelessWidget {
  final String title; // 제목
  final String subtitle; // 부제목

  // 생성자: 필수 매개변수로 제목과 부제목을 받음
  const ModalBottomSheet({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  // 모달 바텀시트 표시 메서드
  static Future<void> showModal(
      BuildContext context, String title, String subtitle) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // 화면 크기 조절 가능
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)), // 상단 모서리 둥글게
      ),
      builder: (context) => ModalBottomSheet(
        title: title,
        subtitle: subtitle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          color: kbackgroundColor, // 배경색
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12, // 그림자 색상
              blurRadius: 10, // 흐림 정도
              spreadRadius: 5, // 확산 정도
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 제목 및 닫기 버튼
            _buildHeader(context),
            const SizedBox(height: 16),
            // 출발 및 도착 버튼
            _buildActionButtons(),
            const SizedBox(height: 16),
            // 추가 기능 버튼 (문의, 저장, 길찾기, 공유)
            _buildAdditionalOptions(),
          ],
        ),
      ),
    );
  }

  // 헤더 부분: 제목과 닫기 버튼
  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
        IconButton(
          icon: Image.asset('assets/icons/Close.png'),
          onPressed: () => Navigator.pop(context), // 닫기 버튼 기능
        ),
      ],
    );
  }

  // 출발 및 도착 버튼 구성
  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildElevatedButton(
          iconPath: 'assets/icons/Wheelchair user.png',
          label: '출발',
          onPressed: () {},
          isPrimary: false,
        ),
        _buildElevatedButton(
          iconPath: 'assets/icons/Place Marker.png',
          label: '도착',
          onPressed: () {},
          isPrimary: true,
        ),
      ],
    );
  }

  // 추가 기능 버튼 구성 (문의, 저장, 길찾기, 공유)
  Widget _buildAdditionalOptions() {
    final options = [
      {'icon': 'assets/icons/Phone.png', 'label': '문의'},
      {'icon': 'assets/icons/Favorite.png', 'label': '저장'},
      {'icon': 'assets/icons/Route.png', 'label': '길찾기'},
      {'icon': 'assets/icons/Share Rounded.png', 'label': '공유'},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: options.map((option) => _buildIconButton(option)).toList(),
    );
  }

  // 개별 아이콘 버튼 구성
  Widget _buildIconButton(Map<String, String> option) {
    return Column(
      children: [
        IconButton(
          icon: Image.asset(option['icon']!),
          onPressed: () {},
        ),
        Text(option['label']!),
      ],
    );
  }

  // 버튼 위젯 생성
  Widget _buildElevatedButton({
    required String iconPath,
    required String label,
    required VoidCallback onPressed,
    required bool isPrimary,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Image.asset(iconPath, width: 20),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        foregroundColor: isPrimary ? Colors.white : kButtonColor,
        backgroundColor: isPrimary ? kButtonColor : Colors.white,
        side: isPrimary
            ? null
            : const BorderSide(color: kButtonColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
