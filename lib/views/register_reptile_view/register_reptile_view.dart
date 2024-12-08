import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../share/app_color.dart';
import '../../viewmodels/register_reptile_viewmodel.dart';

class RegisterReptileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterReptileViewModel(), // 로컬 Provider 등록
      child: Scaffold(
        backgroundColor: AppColors.black,
        appBar: AppBar(
          backgroundColor: AppColors.black,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: AppColors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "개체 등록",
            style: TextStyle(color: AppColors.white, fontSize: 18),
          ),
        ),
        body: Consumer<RegisterReptileViewModel>(
          builder: (context, viewModel, _) => SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 이미지 선택 영역
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 48,
                        backgroundColor: AppColors.darkGray,
                        child: Icon(Icons.image, size: 48, color: AppColors.lightGray),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            print("이미지 선택 버튼 눌림");
                          },
                          child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.edit, size: 20, color: AppColors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),

                // 이름 입력 필드
                TextField(
                  style: TextStyle(color: AppColors.white),
                  onChanged: viewModel.setName, // 이름 설정
                  decoration: InputDecoration(
                    labelText: "이름",
                    labelStyle: TextStyle(color: AppColors.lightGray),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.lightGray),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.white),
                    ),
                  ),
                ),
                SizedBox(height: 24),

                // 성별 선택 버튼
                Text(
                  "성별",
                  style: TextStyle(color: AppColors.lightGray, fontSize: 16),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    _buildGenderButton(context, viewModel, "암컷"),
                    SizedBox(width: 8),
                    _buildGenderButton(context, viewModel, "수컷"),
                    SizedBox(width: 8),
                    _buildGenderButton(context, viewModel, "미구분"),
                  ],
                ),
                SizedBox(height: 24),

                // 해칭일 필드
                TextField(
                  style: TextStyle(color: AppColors.white),
                  onChanged: (value) => viewModel.hatchDate = value, // 해칭일 설정
                  decoration: InputDecoration(
                    labelText: "해칭일",
                    labelStyle: TextStyle(color: AppColors.lightGray),
                    suffixIcon: Icon(Icons.calendar_today, color: AppColors.lightGray),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.lightGray),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.white),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Checkbox(
                      value: viewModel.isHatchUnknown,
                      onChanged: viewModel.toggleHatchUnknown, // 해칭일 모름
                      activeColor: AppColors.lightGray,
                    ),
                    Text("모름", style: TextStyle(color: AppColors.white)),
                  ],
                ),
                SizedBox(height: 24),

                // 마지막 메이팅일 필드
                TextField(
                  style: TextStyle(color: AppColors.white),
                  onChanged: (value) => viewModel.lastMatingDate = value, // 메이팅일 설정
                  decoration: InputDecoration(
                    labelText: "마지막 메이팅일",
                    labelStyle: TextStyle(color: AppColors.lightGray),
                    suffixIcon: Icon(Icons.calendar_today, color: AppColors.lightGray),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.lightGray),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: AppColors.white),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Checkbox(
                      value: viewModel.isMatingUnknown,
                      onChanged: viewModel.toggleMatingUnknown, // 메이팅일 모름
                      activeColor: AppColors.lightGray,
                    ),
                    Text("모름", style: TextStyle(color: AppColors.white)),
                    SizedBox(width: 16),
                    Checkbox(
                      value: viewModel.isMatingNotDone,
                      onChanged: viewModel.toggleMatingNotDone, // 메이팅 안했음
                      activeColor: AppColors.lightGray,
                    ),
                    Text("안 했음", style: TextStyle(color: AppColors.white)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGenderButton(BuildContext context, RegisterReptileViewModel viewModel, String gender) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => viewModel.setGender(gender), // 성별 설정
        style: ElevatedButton.styleFrom(
          backgroundColor: viewModel.gender == gender
              ? AppColors.lightGray
              : AppColors.darkGray,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          gender,
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
