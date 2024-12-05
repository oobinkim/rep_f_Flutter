import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/registration_viewmodel.dart';
import '../../widgets/bar_button.dart';
import '../../widgets/outlined_textField.dart';
import '../../share/app_color.dart';

class PersonalInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<RegistrationViewModel>(context);
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
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
          SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "이름",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: 8),
              OutlinedTextField(
                placeholder: "이름",
                allowNumbers: false,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                onChanged: (value) {
                  viewModel.name = value;
                  viewModel.notifyListeners();
                },
              ),
            ],
          ),
          SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "주민등록번호",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: OutlinedTextField(
                      placeholder: "생년월일 앞 6자리",
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      allowNumbers: true,
                      maxLength: 6,
                      onChanged: (value) {
                        viewModel.birthDate = value;
                        viewModel.notifyListeners();
                      },
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "-",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(width: 8),
                  SizedBox(
                    width: 36,
                    child: OutlinedTextField(
                      placeholder: "",
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      allowNumbers: true,
                      maxLength: 1,
                      onChanged: (value) {
                        if (value == "1" || value == "3") {
                          viewModel.gender = "M";
                        } else if (value == "2" || value == "4") {
                          viewModel.gender = "F";
                        } else {
                          viewModel.gender = "";
                        }
                        viewModel.notifyListeners();
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Row(
                    children: List.generate(6, (_) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: CircleAvatar(
                          radius: 5,
                          backgroundColor: AppColors.white,
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ],
          ),
          Spacer(flex: 5),
          BarButton(
            text: "다음",
            isEnabled: viewModel.name.isNotEmpty &&
                viewModel.birthDate.length == 6 &&
                viewModel.gender.isNotEmpty,
            onPressed: viewModel.name.isNotEmpty &&
                viewModel.birthDate.length == 6 &&
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
}
