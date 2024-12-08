import 'package:flutter/material.dart';
import '../../widgets/grid_button.dart';
import '../../share/app_color.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0; // 현재 선택된 탭의 인덱스

  /// 화면 전환 메서드
  void navigateToRegisterReptile(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/register_reptile');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                //TODO: 포트폴리오 화면
                print("포트폴리오 눌림");
              },
              child: Text(
                "포트폴리오 +",
                style: TextStyle(
                  color: AppColors.lightGray,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0), // 가로 여백 유지
        child: Column(
          children: [
            // 이전, 오늘, 다음 버튼 영역
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: AppColors.white),
                  onPressed: () {
                    print("이전 버튼 눌림");
                  },
                ),
                GestureDetector(
                  onTap: () {
                    print("오늘 드롭다운 눌림");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.calendar_today, color: AppColors.white, size: 16),
                      SizedBox(width: 4),
                      Text(
                        "오늘",
                        style: TextStyle(
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      Icon(Icons.arrow_drop_down, color: AppColors.white),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios, color: AppColors.white),
                  onPressed: () {
                    print("다음 버튼 눌림");
                  },
                ),
              ],
            ),
            SizedBox(height: 16),

            // 개체 추가 버튼
            GestureDetector(
              onTap: () {
                navigateToRegisterReptile(context); // 화면 전환 호출
              },
              child: Container(
                width: double.infinity,
                height: 176,
                padding: EdgeInsets.all(16), // 내부 여백 조정
                decoration: BoxDecoration(
                  color: AppColors.darkGray,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icon/plus_circle.png',
                      width: 48, // 아이콘 크기
                      height: 48,
                    ),
                    SizedBox(height: 12), // 아이콘과 텍스트 사이 간격
                    Text(
                      "개체를 먼저 등록해주세요",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 20, // 텍스트 크기
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),

            // Grid 버튼 영역
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // 2열로 배치
                mainAxisSpacing: 24, // 버튼 간 세로 간격 증가
                crossAxisSpacing: 24, // 버튼 간 가로 간격 증가
                childAspectRatio: 1.0, // 정사각형으로 설정
                children: [
                  GridButton(
                    label: "물 줬어요",
                    icon: Image.asset(
                      'assets/icon/water.png',
                      width: 48, // 아이콘 크기
                      height: 48,
                    ),
                    isSelected: false,
                    onTap: () {
                      print("물 줬어요 버튼 눌림");
                    },
                  ),
                  GridButton(
                    label: "먹이 줬어요",
                    icon: Image.asset(
                      'assets/icon/feed.png',
                      width: 48, // 아이콘 크기
                      height: 48,
                    ),
                    isSelected: false,
                    onTap: () {
                      print("먹이 줬어요 버튼 눌림");
                    },
                  ),
                  GridButton(
                    label: "메이팅 했어요",
                    icon: Image.asset(
                      'assets/icon/mating.png',
                      width: 48, // 아이콘 크기
                      height: 48,
                    ),
                    isSelected: false,
                    onTap: () {
                      print("메이팅 했어요 버튼 눌림");
                    },
                  ),
                  GridButton(
                    label: "배변 했어요",
                    icon: Image.asset(
                      'assets/icon/poop.png',
                      width: 48, // 아이콘 크기
                      height: 48,
                    ),
                    isSelected: false,
                    onTap: () {
                      print("배변 했어요 버튼 눌림");
                    },
                  ),
                  GridButton(
                    label: "탈피 했어요",
                    icon: Image.asset(
                      'assets/icon/skin.png',
                      width: 48, // 아이콘 크기
                      height: 48,
                    ),
                    isSelected: false,
                    onTap: () {
                      print("탈피 했어요 버튼 눌림");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.black,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.lightGray,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "홈",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "분양",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: "샵 찾기",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "마이",
          ),
        ],
      ),
    );
  }
}
