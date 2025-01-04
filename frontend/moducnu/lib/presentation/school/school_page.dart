import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:moducnu/presentation/common/custom_search_bar.dart';
import 'package:moducnu/presentation/school/component/building_info_section.dart';
import 'package:moducnu/presentation/school/component/chacha_info_section.dart';
import 'package:moducnu/presentation/school/component/construction_news.dart';
import 'package:moducnu/presentation/theme/color.dart';
import 'package:sizing/sizing.dart';

class SchoolPage extends StatelessWidget {
  const SchoolPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: const Text('우리 학교 장소'),
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.4),
          child: Container(
            color: kBordercolor, // 보더 색상
            height: 0.8, // 보더 두께
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(0.04.sw),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              ConstructionNews(),
              SizedBox(height: 16),
              ChaChaInfoSection(),
              SizedBox(height: 20),
              CustomSearchBar(hasShadow: false, readOnly: true),
              SizedBox(height: 20),
              BuildingInfoSection(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
