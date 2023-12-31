import 'package:eventer_app/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/widgets/space_widgets.dart';

class MiniTab extends StatelessWidget {
  final String? iconPath;
  final String title;
  final String subTitle;

  const MiniTab(
      {Key? key, this.iconPath, required this.title, required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        (iconPath != null)
            ? Row(
                children: [
                  Container(
                      width: 48.w,
                      height: 48.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.secondaryColor.withOpacity(0.1),
                      ),
                      padding: const EdgeInsets.all(9),
                      child: Image.asset(iconPath!,
                          color: AppColors.secondaryColor)),
                  const HorizontalSpace(14),
                ],
              )
            : const SizedBox(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const VerticalSpace(4),
            Text(
              subTitle,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppColors.secondaryText2Color,
                    fontWeight: FontWeight.bold,
                  ),
            )
          ],
        ),
      ],
    );
  }
}
