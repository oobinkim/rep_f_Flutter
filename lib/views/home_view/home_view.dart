import 'package:flutter/material.dart';
import '../../share/app_color.dart';
import '../../widgets/grid_button.dart'; // GridButton을 임포트

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0; // 현재 선택된 탭의 인덱스

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
                print("포트폴리오 버튼 눌림");
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
        padding: const EdgeInsets.all(16.0),
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
            // 개체 등록 버튼
            GestureDetector(
              onTap: () {
                print("개체 등록 버튼 눌림");
              },
              child: Container(
                width: double.infinity,
                height: 200, // 세로 길이를 늘림
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.darkGray,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_circle, color: AppColors.white, size: 40),
                    SizedBox(height: 8),
                    Text(
                      "개체를 먼저 등록해주세요",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 32),
            // Grid 버튼 영역
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  GridButton(
                    label: "물 줬어요",
                    icon: Icons.water_drop,
                    isSelected: false,
                    onTap: () {
                      print("물 줬어요 버튼 눌림");
                    },
                  ),
                  GridButton(
                    label: "먹이 줬어요",
                    icon: Icons.fastfood,
                    isSelected: false,
                    onTap: () {
                      print("먹이 줬어요 버튼 눌림");
                    },
                  ),
                  GridButton(
                    label: "메이팅 했어요",
                    icon: Icons.favorite,
                    isSelected: false,
                    onTap: () {
                      print("메이팅 했어요 버튼 눌림");
                    },
                  ),
                  GridButton(
                    label: "배변 했어요",
                    icon: Icons.pets,
                    isSelected: false,
                    onTap: () {
                      print("배변 했어요 버튼 눌림");
                    },
                  ),
                  GridButton(
                    label: "탈피 했어요",
                    icon: Icons.change_circle,
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
        type: BottomNavigationBarType.fixed, // 고정 타입 설정
        backgroundColor: AppColors.black, // 배경색 검정으로 설정
        selectedItemColor: AppColors.white, // 선택된 아이템 색상
        unselectedItemColor: AppColors.lightGray, // 선택되지 않은 아이템 색상
        currentIndex: _currentIndex, // 현재 선택된 탭의 인덱스
        onTap: (int index) {
          setState(() {
            _currentIndex = index; // 선택된 인덱스를 업데이트
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
