import 'package:flutter/material.dart';
import 'package:moducnu/presentation/theme/color.dart';

class RouteFinderModal extends StatelessWidget {
  final String title;

  const RouteFinderModal({
    Key? key,
    required this.title,
  }) : super(key: key);

  static Future<void> showModal(
      BuildContext context, String title) async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => RouteFinderModal(
        title: title
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
            _buildRouteInputs(),
            const SizedBox(height: 16),
            _buildGuideButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.close, size: 24, color: Colors.grey),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }

  Widget _buildRouteInputs() {
    return Column(
      children: [
        _buildInputField(
          icon: Icons.accessible,
          hintText: '출발지 입력',
          isActive: false,
        ),
        const SizedBox(height: 8),
        _buildInputField(
          icon: Icons.location_on,
          hintText: '도착지 입력',
          isActive: true,
        ),
      ],
    );
  }

  Widget _buildInputField({
    required IconData icon,
    required String hintText,
    required bool isActive,
  }) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: isActive ? Colors.blue : Colors.grey),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey.shade400),
        suffixIcon: const Icon(Icons.search, color: Colors.orange),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildGuideButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: kButtonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          child: Text(
            '안내 받기',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
