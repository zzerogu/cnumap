import 'package:flutter/material.dart';
import 'package:moducnu/presentation/school/component/construction_news.dart';
import 'package:moducnu/presentation/theme/color.dart';

class ConstructionNewsDetail extends StatefulWidget {
  const ConstructionNewsDetail({Key? key}) : super(key: key);

  @override
  State<ConstructionNewsDetail> createState() => _ConstructionNewsDetailState();
}

class _ConstructionNewsDetailState extends State<ConstructionNewsDetail> {
  // 현재 페이지 인덱스 관리
  int _currentPage = 0;

  // 페이지 컨트롤러 정의
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor, // 배경색 설정
      appBar: _buildAppBar(context), // 상단 앱 바 구성
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLocationSection(), // 공사 위치 섹션
              const SizedBox(height: 40),
              _buildPhotoSection(), // 현장 제보 사진 섹션
            ],
          ),
        ),
      ),
    );
  }

  // 상단 앱 바 생성
  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('공사 소식 안내'),
      backgroundColor: kBackgroundColor, 
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context), // 뒤로 가기 버튼
      ),
    );
  }

  // 공사 위치 섹션 생성
  Widget _buildLocationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '🌐 공사 위치',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
        ),
        const SizedBox(height: 10),
        Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.grey.shade300), // 회색 테두리 적용
          ),
        ),
      ],
    );
  }

  // 현장 제보 사진 섹션 생성
  Widget _buildPhotoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '📸 현장 제보 사진',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
        ),
        const SizedBox(height: 10),
        _buildPhotoCarousel(), // 사진 캐러셀 위젯
        const SizedBox(height: 10),
        _buildIndicator(), // 페이지 인디케이터
      ],
    );
  }

  // 사진 캐러셀 구성
  Widget _buildPhotoCarousel() {
    return SizedBox(
      height: 250, // 사진 크기
      child: PageView.builder(
        controller: _pageController,
        itemCount: 3, // 이미지 개수
        onPageChanged: (index) {
          setState(() {
            _currentPage = index; // 페이지 변경 시 상태 업데이트
          });
        },
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: const DecorationImage(
                image: AssetImage('assets/images/construction_news.png'), // 이미지 경로
                fit: BoxFit.cover, // 이미지 크기 조절
              ),
            ),
          );
        },
      ),
    );
  }

  // 페이지 인디케이터 생성
  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3, // 이미지 개수
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          width: _currentPage == index ? 12.0 : 8.0, // 현재 페이지 크기 강조
          height: 8.0,
          decoration: BoxDecoration(
            color: _currentPage == index ? Colors.orange : Colors.grey, // 강조 색상 적용
            borderRadius: BorderRadius.circular(4.0),
          ),
        ),
      ),
    );
  }
}