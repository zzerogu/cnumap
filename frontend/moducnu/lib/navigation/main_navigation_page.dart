import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:moducnu/presentation/map/map_page.dart';
import 'package:moducnu/presentation/saved/save_page.dart';
import 'package:moducnu/presentation/school/school_page.dart';
import 'package:moducnu/presentation/theme/color.dart';
import 'package:moducnu/presentation/qa/qa_page.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _selectedIndex = 0;

  // 각 탭에서 보여줄 페이지 위젯 리스트
  final List<Widget> _pages = [
    const MapPage(),
    const SavePage(),
    const SchoolPage(),
    const QaPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex], // 현재 선택된 페이지 표시
      bottomNavigationBar: SafeArea(
        // SafeArea로 하단 영역 보호
        child: GNav(
          gap: 8,
          activeColor: kSelectedColor,
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index; // 선택된 탭의 인덱스를 업데이트
            });
          },
          tabs: const [
            GButton(
              icon: Icons.explore,
              text: '지도',
            ),
            GButton(
              icon: Icons.favorite,
              text: '저장',
            ),
            GButton(
              icon: Icons.school,
              text: '학교',
            ),
            GButton(
              icon: Icons.access_time_sharp,
              text: '문의',
            ),
          ],
        ),
      ),
    );
  }
}
