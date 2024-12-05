import 'package:flutter/material.dart';
import '../../share/app_color.dart';
import '../../widgets/grid_button.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black, // 배경색
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 이전, 오늘, 다음 버튼 영역
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white),
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
                      Icon(Icons.calendar_today, color: Colors.white, size: 16),
                      SizedBox(width: 8),
                      Text(
                        "오늘",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(Icons.arrow_drop_down, color: Colors.white),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
                  onPressed: () {
                    print("다음 버튼 눌림");
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              print("개체 등록 버튼 눌림");
            },
            child: Container(
              padding: EdgeInsets.all(16), // 내부 여백
              decoration: BoxDecoration(
                color:AppColors.darkGray, // 배경색 지정
                borderRadius: BorderRadius.circular(12), // 둥근 모서리
              ),
              child: Column(
                children: [
                  Icon(Icons.add_circle, color: Colors.white, size: 40),
                  SizedBox(height: 8),
                  Text(
                    "개체를 먼저 등록해주세요",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 32),
          Expanded(
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                GridButton(
                  label: "물 줬어요",
                  icon: Icons.water_drop,
                  isSelected: false,
                  onTap: () => print("물 줬어요 버튼 눌림"),
                ),
                GridButton(
                  label: "밥 줬어요",
                  icon: Icons.fastfood,
                  isSelected: false,
                  onTap: () => print("밥 줬어요 버튼 눌림"),
                ),
                GridButton(
                  label: "메이팅 했어요",
                  icon: Icons.favorite,
                  isSelected: false,
                  onTap: () => print("메이팅 했어요 버튼 눌림"),
                ),
                GridButton(
                  label: "배변 했어요",
                  icon: Icons.pets,
                  isSelected: false,
                  onTap: () => print("배변 했어요 버튼 눌림"),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
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
