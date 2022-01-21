import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/theme_color.dart';
import '../../../../core/theme/themes.dart';

class ChangeThemeSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const ChangeThemeSwitch({
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        value == false ? onChanged(true) : onChanged(false);
      },
      child: AnimatedContainer(
        duration: kAnimationDuration,
        curve: kAnimationCurve,
        width: 80.0.w,
        height: 40.0.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0.r),
          color: !value ? kLightPlaceholderText : kDarkPlaceholderText,
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 4.0.w,
              ),
              child: AnimatedAlign(
                duration: kAnimationDuration,
                curve: kAnimationCurve,
                alignment: value ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: 28.0.w,
                  height: 28.0.w,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: const AnimatedSwitcher(
                    duration: kAnimationDuration,
                    switchInCurve: kAnimationCurve,
                    reverseDuration: Duration.zero,
                    
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
