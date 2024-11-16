import 'package:bw_machine_task2/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;

  const SearchField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: CupertinoTextField(
        controller: controller,
        placeholder: 'Search City Name',
        decoration: BoxDecoration(
          color: kGrey,
          borderRadius: kRadius12,
        ),
        suffix: GestureDetector(
          onTap: () {
            controller.clear();
          },
          child: const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              CupertinoIcons.xmark_circle_fill,
              color: iconG,
              size: 35,
            ),
          ),
        ),
        style: q18B,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
      ),
    );
  }
}