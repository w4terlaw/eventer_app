import 'package:eventer_app/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MyPrgoresIndicatorWidget extends StatelessWidget {
  final double size;

  const MyPrgoresIndicatorWidget({super.key, this.size = 45});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.fourRotatingDots(
      color: AppColors.secondaryColor,
      size: size,
    );
  }
}
