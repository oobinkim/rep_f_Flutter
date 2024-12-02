import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/profile_viewmodel.dart';
import '../../share/app_color.dart';
import '../../widgets/bar_button.dart';

class SpeciesSelectionStep extends StatelessWidget {
  final List<String> speciesList = [
    "크레스티드 게코", "레오파드 게코", "펫테일 게코", "리키 에너스", "가고일 게코", "그외 게코",
    "볼 파이톤", "그외 파이톤", "콘/킹 스네이크", "콜루브리드", "육지 거북", "수생 거북",
    "박스 터틀", "살라만다", "뉴트", "프록", "토드"
  ]; // "아직 없어요"는 제외

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ProfileViewModel>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Progress Bar
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              height: 6,
              child: Row(
                children: [
                  Expanded(flex: 3, child: Container(color: AppColors.lightGreen)),
                  Expanded(flex: 1, child: Container(color: AppColors.darkGray)),
                ],
              ),
            ),
          ),
          SizedBox(height: 24),

          // Title
          Text(
            "주로 브리딩하는 종이 있나요?",
            style: TextStyle(color: AppColors.white, fontSize: 24),
          ),
          SizedBox(height: 32),

          // Species Selection Buttons
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: speciesList.map((species) {
              final isSelected = viewModel.selectedSpecies == species;
              return GestureDetector(
                onTap: () {
                  if (isSelected) {
                    viewModel.updateSelectedSpecies("");
                  } else {
                    viewModel.updateSelectedSpecies(species);
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.white : AppColors.darkGray,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    species,
                    style: TextStyle(
                      color: isSelected ? AppColors.black : AppColors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 48),

          Align(
            alignment: Alignment.centerLeft, // 왼쪽 정렬
            child: GestureDetector(
              onTap: () {
                if (viewModel.selectedSpecies == "아직 없어요") {
                  viewModel.updateSelectedSpecies("");
                } else {
                  viewModel.updateSelectedSpecies("아직 없어요");
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: viewModel.selectedSpecies == "아직 없어요"
                      ? AppColors.white
                      : AppColors.darkGray,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "아직 없어요",
                  style: TextStyle(
                    color: viewModel.selectedSpecies == "아직 없어요"
                        ? AppColors.black
                        : AppColors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
          Spacer(),

          // Next Button
          BarButton(
            text: "다음",
            isEnabled: viewModel.selectedSpecies.isNotEmpty,
            onPressed: viewModel.selectedSpecies.isNotEmpty
                ? () {
              viewModel.nextStep();
              print("선택된 주종목: ${viewModel.selectedSpecies}");
            }
                : null,
            enabledColor: AppColors.lightGreen,
            disabledColor: AppColors.darkGreen,
            enabledTextColor: AppColors.black,
            disabledTextColor: AppColors.black,
          ),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}
