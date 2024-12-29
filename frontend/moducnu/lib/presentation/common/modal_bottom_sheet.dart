import 'package:flutter/material.dart';
import 'package:moducnu/presentation/theme/color.dart';

class ModalBottomSheet extends StatelessWidget {
  final String title;
  final String subtitle;

  const ModalBottomSheet({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  static Future<void> showModal(
      BuildContext context, String title, String subtitle) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
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
          color: kbackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            const SizedBox(height: 16),
            _buildActionButtons(),
            const SizedBox(height: 16),
            _buildAdditionalOptions(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
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
          icon: Image.asset('assets/icons/Close.png', width: 20, height: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildElevatedButton(
          iconPath: 'assets/icons/WheelchairUser.png',
          label: '출발',
          onPressed: () {},
          isPrimary: false,
        ),
        _buildElevatedButton(
          iconPath: 'assets/icons/PlaceMarker.png',
          label: '도착',
          onPressed: () {},
          isPrimary: true,
        ),
      ],
    );
  }

  Widget _buildAdditionalOptions() {
    final options = [
      {'icon': 'assets/icons/Phone.png', 'label': '문의'},
      {'icon': 'assets/icons/Favorite.png', 'label': '저장'},
      {'icon': 'assets/icons/Route.png', 'label': '길찾기'},
      {'icon': 'assets/icons/ShareRounded.png', 'label': '공유'},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: options.map((option) => _buildIconButton(option)).toList(),
    );
  }

  Widget _buildIconButton(Map<String, String> option) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Image.asset(option['icon']!, width: 24, height: 24),
          onPressed: () {},
        ),
        Text(option['label']!),
      ],
    );
  }

  Widget _buildElevatedButton({
    required String iconPath,
    required String label,
    required VoidCallback onPressed,
    required bool isPrimary,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Image.asset(iconPath, width: 16, height: 16),
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
