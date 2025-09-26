import 'package:dartcoder/shared/app_string.dart';
import 'package:dartcoder/shared/constants.dart';
import 'package:dartcoder/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedBottomNav extends StatefulWidget {
  final bool isVisible;
  final VoidCallback onPrevious;
  final VoidCallback onEditor;
  final VoidCallback onQuiz;
  final VoidCallback onNext;

  const AnimatedBottomNav({
    super.key,
    required this.isVisible,
    required this.onPrevious,
    required this.onEditor,
    required this.onNext,
    required this.onQuiz,
  });

  @override
  State<AnimatedBottomNav> createState() => _AnimatedBottomNavState();
}

class _AnimatedBottomNavState extends State<AnimatedBottomNav> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      offset: widget.isVisible ? Offset.zero : const Offset(0, 1),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 450),
        opacity: widget.isVisible ? 1.0 : 0.0,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: 10.h,
          ),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        onTap: widget.onPrevious,
                        text: AppString.previous,
                        backgroundColor:
                            AppColors.appBlue.withValues(alpha: 0.2),
                        textColor: AppColors.appBlue,
                      ),
                    ),
                    SizedBox(width: 15.w),
                    Expanded(
                      child: AppButton(
                        onTap: widget.onNext,
                        text: AppString.nextCourse,
                        textColor: AppColors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        backgroundColor:
                            AppColors.appBlue.withValues(alpha: 0.2),
                        textColor: AppColors.appBlue,
                        onTap: widget.onEditor,
                        text: AppString.practice,
                      ),
                    ),
                    SizedBox(width: 15.w),
                    Expanded(
                      child: AppButton(
                        backgroundColor: AppColors.grey.withValues(alpha: 0.2),
                        textColor: AppColors.grey,
                        onTap: widget.onQuiz,
                        text: AppString.takeQuiz,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
