import 'package:dartcoder/shared/app_string.dart';
import 'package:dartcoder/shared/constants.dart';
import 'package:dartcoder/shared/navigation/router.dart';
import 'package:dartcoder/shared/theme.dart';
import 'package:dartcoder/features/courses/views/course_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CoursesListScreen extends StatefulWidget {
  const CoursesListScreen({super.key, this.title});
  final String? title;

  @override
  State<CoursesListScreen> createState() => _CoursesListScreenState();
}

class _CoursesListScreenState extends State<CoursesListScreen> {
  final coursesMap = AppData.courses;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? AppString.dartCourse),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 20.h),
        child: SingleChildScrollView(
          child: Column(
            children: coursesMap.entries.map((e) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(e.key,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10.h),
                  ListView.builder(
                      itemBuilder: (_, i) {
                        final course = e.value[i];
                        return GestureDetector(
                          onTap: () {
                            AppRouter.push(AppRouter.courseDetails,
                                arg: CourseDetailsArgs(course: course));
                          },
                          child: Container(
                            margin: EdgeInsets.only(
                                bottom: 10.h, left: 5.w, right: 5.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: Theme.of(context).scaffoldBackgroundColor,
                              border: Border.all(
                                  color: AppColors.grey.withValues(alpha: .1)),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.grey.withValues(alpha: .05),
                                  blurRadius: 8,
                                  spreadRadius: 2,
                                  offset: const Offset(0, 4),
                                ),
                                BoxShadow(
                                  color: AppColors.grey.withValues(alpha: .01),
                                  blurRadius: 4,
                                  spreadRadius: 1,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Text(course.title ?? '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                subtitle: course.desc != null
                                    ? Text(course.desc!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(fontSize: 12))
                                    : null,
                              ),
                            ),
                          ),
                        );
                      },
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: e.value.length)
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
