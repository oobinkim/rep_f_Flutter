import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // 배경색
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                // 이전 버튼 동작
              },
            ),
            GestureDetector(
              onTap: () {
                // "오늘" 드롭다운 누를 시 동작
                print("오늘 드롭다운 눌림");
              },
              child: Row(
                children: [
                  Icon(Icons.calendar_today, color: Colors.white, size: 16),
                  SizedBox(width: 8),
                  Text(
                    "오늘",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  Icon(Icons.arrow_drop_down, color: Colors.white),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
              onPressed: () {
                // 다음 버튼 동작
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              // 개체 등록 버튼 동작
            },
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
          SizedBox(height: 32),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: [
              _buildActionButton(Icons.water_drop, "물 줬어요"),
              _buildActionButton(Icons.fastfood, "밥 줬어요"),
              _buildActionButton(Icons.favorite, "메이팅 했어요"),
              _buildActionButton(Icons.pets, "배변 했어요"),
            ],
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

  // 버튼 빌더 함수
  Widget _buildActionButton(IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        // 버튼 클릭 동작
        print("$label 버튼 눌림");
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 40),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
