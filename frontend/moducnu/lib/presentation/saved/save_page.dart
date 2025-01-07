import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moducnu/presentation/saved/componenet/saved_bottomsheet.dart';
import 'package:moducnu/presentation/saved/save_viewmodel.dart';
import 'package:moducnu/presentation/theme/color.dart';

class SavePage extends StatefulWidget {
  const SavePage({super.key});

  @override
  _SavePageState createState() => _SavePageState();
}

class _SavePageState extends State<SavePage> {
  final SaveViewmodel viewModel = GetIt.instance<SaveViewmodel>();

  @override
  void initState() {
    super.initState();
    viewModel.fetchSavedLocations(); // 저장된 장소 데이터 로드
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        title: const Text('나의 저장 장소'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.4),
          child: Container(
            color: kBordercolor, // 보더 색상
            height: 0.8, // 보더 두께
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: const Center(child: Text("지도")),
          ),
          SavedBottomsheet(),
        ],
      ),
    );
  }
}
