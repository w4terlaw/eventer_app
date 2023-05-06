import 'package:eventer_app/common/app_colors.dart';
import 'package:eventer_app/common/localization.dart';
import 'package:flutter/material.dart';

class MySearchWidget extends StatelessWidget {
  final Function(String) onSubmitted;

  const MySearchWidget({Key? key, required this.onSubmitted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Theme.of(context)
          .textTheme
          .headlineLarge!
          .copyWith(fontWeight: FontWeight.w500),
      cursorColor: AppColors.secondaryColor,
      decoration: InputDecoration(
        // filled: true,
        // fillColor: Colors.black,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(bottom: 2.0),
          child: IconButton(
            icon: Image.asset(
              'assets/icons/search.png',
              width: 24.0,
              color: AppColors.secondaryColor,
            ),
            onPressed: null,
          ),
        ),
        hintText: L10n.search,
        hintStyle: Theme.of(context)
            .textTheme
            .headlineLarge
            ?.copyWith(color: AppColors.secondaryTextColor),

        // const TextStyle(
        //   fontSize: 24.0,
        //   fontWeight: FontWeight.w300,
        //   color: AppColors.secondaryTextColor,
        // ),
      ),
      onSubmitted: (value) => onSubmitted(value),
    );
  }
}
