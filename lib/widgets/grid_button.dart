import 'package:flutter/material.dart';
import '../share/app_color.dart';
class GridButton extends StatelessWidget {
  final String label;
  final dynamic icon; // IconData 또는 Widget 타입 모두 지원
  final bool isSelected;
  final VoidCallback onTap;

  const GridButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppColors.purposeButtonGrey : AppColors.darkGray,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.lightGreen : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildIcon(), // 아이콘 또는 위젯을 렌더링
            SizedBox(height: 16),
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() {
    // 아이콘이 IconData 타입이면 Icon 위젯 생성, 아니면 그대로 반환
    if (icon is IconData) {
      return Icon(
        icon,
        size: 36,
        color: AppColors.white,
      );
    } else if (icon is Widget) {
      return icon; // 커스텀 위젯 반환 (Image, Svg 등)
    } else {
      throw ArgumentError('icon must be either IconData or a Widget');
    }
  }
}
