import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:namaz_time/core/theme/theme_bloc/theme_bloc.dart';
import 'package:namaz_time/core/theme/theme_color.dart';
import 'package:namaz_time/core/theme/themes.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return AnimatedContainer(
          duration: kAnimationDuration,
          curve: kAnimationCurve,
          child: IconButton(
            onPressed: () {
              BlocProvider.of<ThemeBloc>(context).add(
                ToggleTheme(),
              );
            },
            icon: state.currentTheme == kAppThemeData[AppTheme.dark]!
                ? SvgPicture.asset(
                    'assets/images/svg/sun1.svg',
                    color: kDarkTextColor,
                  )
                : SvgPicture.asset(
                    'assets/images/svg/moon1.svg',
                  ),
          ),
        );
      },
    );
  }
}
