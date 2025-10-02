import 'package:dartcoder/features/editor/models/test_case.dart';
import 'package:dartcoder/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markdown_widget/widget/markdown.dart';

class DsaQuestionWidget extends StatelessWidget {
  const DsaQuestionWidget({super.key});

  static const String questionMarkdown = '''
# 1. Two Sum
**Difficulty:** Easy

## Problem Description

Given an array of integers `nums` and an integer `target`, return indices of the two numbers such that they add up to target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

You can return the answer in any order.

## Examples

### Example 1:
```
Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
```

### Example 2:
```
Input: nums = [3,2,4], target = 6
Output: [1,2]
```

### Example 3:
```
Input: nums = [3,3], target = 6
Output: [0,1]
```

## Constraints

- `2 ≤ nums.length ≤ 10⁴`
- `-10⁹ ≤ nums[i] ≤ 10⁹`
- `-10⁹ ≤ target ≤ 10⁹`
- Only one valid answer exists.

''';

  // Test suite for the Two Sum problem
  static final TestSuite testSuite = TestSuite(
    description: "",
    problemName: "Two Sum",
    functionName: "twoSum",
    testCases: [
      TestCase(
        name: "Example 1",
        inputs: [
          [2, 7, 11, 15],
          9
        ],
        expectedOutput: [0, 1],
        description: "Basic test case with solution at the beginning",
      ),
      TestCase(
        name: "Example 2",
        inputs: [
          [3, 2, 4],
          6
        ],
        expectedOutput: [1, 2],
        description: "Test case with solution in the middle",
      ),
      TestCase(
        name: "Example 3",
        inputs: [
          [3, 3],
          6
        ],
        expectedOutput: [0, 1],
        description: "Test case with duplicate numbers",
      ),
      TestCase(
        name: "Negative numbers",
        inputs: [
          [-1, -2, -3, -4, -5],
          -8
        ],
        expectedOutput: [2, 4],
        description: "Test case with negative numbers",
      ),
      TestCase(
        name: "Mixed positive and negative",
        inputs: [
          [-3, 4, 3, 90],
          0
        ],
        expectedOutput: [0, 2],
        description: "Test case with mixed positive and negative numbers",
      ),
      TestCase(
        name: "Large numbers",
        inputs: [
          [1000000000, 999999999, 1],
          1999999999
        ],
        expectedOutput: [0, 1],
        description: "Test case with large numbers near the constraint limit",
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: MarkdownWidget(
          data: questionMarkdown,
          selectable: true,
          config: config,
        ),
      ),
    );
  }
}
