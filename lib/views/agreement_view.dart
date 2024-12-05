import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/bar_button.dart';
import '../share/app_color.dart';
import '../viewmodels/agreement_viewmodel.dart';

class AgreementView extends StatefulWidget {
  @override
  _AgreementViewState createState() => _AgreementViewState();
}

class _AgreementViewState extends State<AgreementView> {
  bool allChecked = false;
  bool termsChecked = false;
  bool privacyChecked = false;

  void updateAllChecked(bool value) {
    setState(() {
      allChecked = value;
      termsChecked = value;
      privacyChecked = value;
    });
  }

  void updateIndividualCheck(bool? value, String type) {
    setState(() {
      if (type == "terms") termsChecked = value!;
      if (type == "privacy") privacyChecked = value!;
      allChecked = termsChecked && privacyChecked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AgreementViewModel(),
      child: Consumer<AgreementViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            backgroundColor: AppColors.black,
            appBar: AppBar(
              backgroundColor: AppColors.black,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  viewModel.navigateToSplash(context); // 스플래시 화면으로 이동
                },
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "서비스 이용을 위해\n이용약관 동의가 필요합니다.",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 24),
                  BarButton(
                    text: "모두 동의합니다.",
                    isEnabled: true,
                    onPressed: () {
                      setState(() {
                        allChecked = !allChecked;
                        updateAllChecked(allChecked);
                      });
                    },
                    enabledColor: allChecked ? AppColors.lightGray : AppColors.darkGray,
                    disabledColor: AppColors.darkGray,
                    enabledTextColor: AppColors.white,
                    disabledTextColor: AppColors.black,
                  ),
                  const SizedBox(height: 24),
                  CheckboxListTile(
                    activeColor: AppColors.lightGreen,
                    checkColor: AppColors.black,
                    title: const Text(
                      "서비스 이용 약관 (필수)",
                      style: TextStyle(color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: termsChecked,
                    onChanged: (value) => updateIndividualCheck(value, "terms"),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.borderGray,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "본 이용약관(이하 “이용약관”)은 랩프 앱 및 관련하여 제공하는 프로그램, 소프트웨어 등(이하 “서비스” 또는 “랩프”) 및 본 이용약관의 적용을 받으며 랩프 앱에서 업로드 및 다운로드, 공유되는 모든 정보 및 텍스트, 그래픽, 사진, 기타 자료(이하 통칭 “콘텐츠”)에 대한 접근 및 이용에 관한 사항을 규정합니다. 본 이용약관에 동의하지 않는 경우 랩프를 이용할 수 없습니다.",
                      style: TextStyle(color: AppColors.textGray,
                          fontSize: 14,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  CheckboxListTile(
                    activeColor: AppColors.lightGreen,
                    checkColor: AppColors.black,
                    title: const Text(
                      "개인정보 처리방침 (필수)",
                      style: TextStyle(color: AppColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: privacyChecked,
                    onChanged: (value) => updateIndividualCheck(value, "privacy"),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.borderGray,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "수집하는 개인정보 이용자는 회원가입을 하지 않아도 랩프 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 피드, 채팅 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 랩프는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.",
                      style: TextStyle(color: AppColors.textGray,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(height: 52),
                  BarButton(
                    text: "다음",
                    isEnabled: termsChecked && privacyChecked,
                    onPressed: termsChecked && privacyChecked
                        ? () {
                      viewModel.navigateToRegistration(context); // 회원가입 화면으로 이동
                    }
                        : null,
                    enabledColor: AppColors.lightGreen,
                    disabledColor: AppColors.darkGreen,
                    enabledTextColor: AppColors.black,
                    disabledTextColor: AppColors.black,
                  ),
                  Spacer(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
