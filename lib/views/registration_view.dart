import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/registration_viewmodel.dart';
import '../widgets/bar_button.dart';
import '../widgets/outlined_textField.dart';
import 'package:flutter/services.dart';
import '../share/app_color.dart';

class RegistrationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegistrationViewModel(),
      child: Consumer<RegistrationViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.black,
              elevation: 0,
              leading: viewModel.currentStep > 0
                  ? IconButton(
                icon: Icon(Icons.arrow_back, color: AppColors.white),
                onPressed: viewModel.previousStep,
              )
                  : null,
            ),
            backgroundColor: AppColors.black,
            body: PageView(
              controller: viewModel.pageController,
              physics: NeverScrollableScrollPhysics(), // 스크롤 방지
              children: [
                buildPersonalInfoStep(context, viewModel), // Step 1: 본인 확인
                buildPhoneNumberStep(context, viewModel), // Step 2: 휴대폰 번호 입력
                buildAuthCodeStep(context, viewModel), // Step 3: 인증번호 입력
                buildCompletionStep(context, viewModel), // Step 4: 완료 화면
              ],
            ),
          );
        },
      ),
    );
  }

  // Step 1: 본인 확인
  Widget buildPersonalInfoStep(BuildContext context, RegistrationViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            "본인 확인이 필요해요",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
          SizedBox(height: 24),

          // 이름 입력 섹션
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "이름",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: 8),
              OutlinedTextField(
                placeholder: "이름", // 이름 플레이스홀더
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  viewModel.name = value; // 이름 저장
                  viewModel.notifyListeners(); // 상태 갱신
                },
              ),
            ],
          ),
          SizedBox(height: 24),

          // 주민등록번호 입력 섹션
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "주민등록번호",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // 생년월일 텍스트 필드
                  Expanded(
                    flex: 2,
                    child: OutlinedTextField(
                      placeholder: "생년월일 앞 6자리", // 주민등록번호 앞 6자리 플레이스홀더
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                      onChanged: (value) {
                        viewModel.idNumber = value;
                        viewModel.notifyListeners(); // 상태 갱신
                      },
                    ),
                  ),
                  SizedBox(width: 8),

                  // "-" 텍스트
                  Text(
                    "-",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(width: 8),

                  // 주민등록번호 뒤 1자리 텍스트 필드
                  SizedBox(
                    width: 36,
                    child: OutlinedTextField(
                      placeholder: "", // 플레이스홀더 없음
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      onChanged: (value) {
                        if (value == "1" || value == "3") {
                          viewModel.gender = "M";
                        } else if (value == "2" || value == "4") {
                          viewModel.gender = "F";
                        } else {
                          viewModel.gender = "";
                        }
                        viewModel.notifyListeners(); // 상태 갱신
                      },
                    ),
                  ),
                  SizedBox(width: 16),

                  Row(
                    children: List.generate(6, (_) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: CircleAvatar(
                          radius: 5, // 동그라미 크기
                          backgroundColor: AppColors.white, // 동그라미 색상
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ],
          ),
          Spacer(flex: 5),

          // 다음 버튼
          BarButton(
            text: "다음",
            isEnabled: viewModel.name.isNotEmpty &&
                viewModel.idNumber.length == 6 &&
                viewModel.gender.isNotEmpty,
            onPressed: viewModel.name.isNotEmpty &&
                viewModel.idNumber.length == 6 &&
                viewModel.gender.isNotEmpty
                ? viewModel.nextStep
                : null,
            enabledColor: AppColors.lightGreen,
            disabledColor: AppColors.darkGreen,
            enabledTextColor: AppColors.black,
            disabledTextColor: AppColors.black,
          ),
          Spacer(flex: 1),
        ],
      ),
    );
  }

// Step 2: 휴대폰 번호 입력
  Widget buildPhoneNumberStep(BuildContext context, RegistrationViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            "휴대폰 번호를 입력해주세요",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 24),
          TextField(
            decoration: InputDecoration(
              labelText: "휴대폰 번호",
              labelStyle: TextStyle(color: Colors.grey),
              border: UnderlineInputBorder(),
            ),
            onChanged: (value) => viewModel.phoneNumber = value,
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCarrierOption(viewModel, "SKT"),
              _buildCarrierOption(viewModel, "KT"),
              _buildCarrierOption(viewModel, "LG U+"),
              _buildCarrierOption(viewModel, "알뜰폰"),
            ],
          ),
          Spacer(),
          ElevatedButton(
            onPressed: viewModel.phoneNumber.isNotEmpty && viewModel.carrier.isNotEmpty
                ? () => viewModel.nextStep()
                : null,
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 48),
              backgroundColor: viewModel.phoneNumber.isNotEmpty && viewModel.carrier.isNotEmpty
                  ? Colors.black
                  : Colors.grey[300],
              foregroundColor: Colors.white,
            ),
            child: Text("다음"),
          ),
        ],
      ),
    );
  }

  // 통신사 선택 버튼
  Widget _buildCarrierOption(RegistrationViewModel viewModel, String carrier) {
    final isSelected = viewModel.carrier == carrier;
    return GestureDetector(
      onTap: () {
        viewModel.carrier = carrier;
        viewModel.notifyListeners();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: isSelected ? Colors.black : Colors.grey),
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? Colors.black : Colors.white,
        ),
        child: Text(
          carrier,
          style: TextStyle(color: isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }

  // Step 3: 인증번호 입력
  Widget buildAuthCodeStep(BuildContext context, RegistrationViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            "인증번호를 입력해주세요",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 24),
          TextField(
            decoration: InputDecoration(
              labelText: "6자리 코드",
              labelStyle: TextStyle(color: Colors.grey),
              border: UnderlineInputBorder(),
            ),
            onChanged: (value) => viewModel.authCode = value,
          ),
          Spacer(),
          ElevatedButton(
            onPressed: viewModel.authCode.isNotEmpty
                ? () => viewModel.nextStep()
                : null,
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 48),
              backgroundColor: viewModel.authCode.isNotEmpty ? Colors.black : Colors.grey[300],
              foregroundColor: Colors.white,
            ),
            child: Text("다음"),
          ),
        ],
      ),
    );
  }

  // Step 4: 완료 화면
  Widget buildCompletionStep(BuildContext context, RegistrationViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.celebration, size: 100, color: Colors.orange),
          SizedBox(height: 24),
          Text(
            "인증에 성공했습니다!",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(
            "함께하기 전에 몇 가지만 알려주시면 서비스 이용에 도움이 됩니다.",
            style: TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              // 프로필 설정 화면으로 이동
              Navigator.pushReplacementNamed(context, '/profile');
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 48),
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
            ),
            child: Text("1분만에 프로필 설정하기"),
          ),
        ],
      ),
    );
  }
}