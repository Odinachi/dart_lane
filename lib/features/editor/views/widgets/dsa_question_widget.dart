
import 'package:dartcoder/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:markdown_widget/widget/markdown.dart';

class DsaQuestionWidget extends StatefulWidget {
  const DsaQuestionWidget({super.key, this.text});
  final String? text;
//   static const String questionMarkdown = '''
// # 1. Two Sum
// **Difficulty:** Easy

// ## Problem Description

// Given an array of integers `nums` and an integer `target`, return indices of the two numbers such that they add up to target.

// You may assume that each input would have exactly one solution, and you may not use the same element twice.

// You can return the answer in any order.

// ## Examples

// ### Example 1:
// ```
// Input: nums = [2,7,11,15], target = 9
// Output: [0,1]
// Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
// ```

// ### Example 2:
// ```
// Input: nums = [3,2,4], target = 6
// Output: [1,2]
// ```

// ### Example 3:
// ```
// Input: nums = [3,3], target = 6
// Output: [0,1]
// ```

// ## Constraints

// - `2 ≤ nums.length ≤ 10⁴`
// - `-10⁹ ≤ nums[i] ≤ 10⁹`
// - `-10⁹ ≤ target ≤ 10⁹`
// - Only one valid answer exists.

// ''';

//   // Test suite for the Two Sum problem
//   static final TestSuite testSuite = TestSuite(
//     description: "",
//     functionName: "twoSum",
//     testCases: [
//       TestCase(
//         name: "Example 1",
//         inputs: [
//           [2, 7, 11, 15],
//           9
//         ],
//         expectedOutput: [0, 1],
//         description: "Basic test case with solution at the beginning",
//       ),
//       TestCase(
//         name: "Example 2",
//         inputs: [
//           [3, 2, 4],
//           6
//         ],
//         expectedOutput: [1, 2],
//         description: "Test case with solution in the middle",
//       ),
//       TestCase(
//         name: "Example 3",
//         inputs: [
//           [3, 3],
//           6
//         ],
//         expectedOutput: [0, 1],
//         description: "Test case with duplicate numbers",
//       ),
//       TestCase(
//         name: "Negative numbers",
//         inputs: [
//           [-1, -2, -3, -4, -5],
//           -8
//         ],
//         expectedOutput: [2, 4],
//         description: "Test case with negative numbers",
//       ),
//       TestCase(
//         name: "Mixed positive and negative",
//         inputs: [
//           [-3, 4, 3, 90],
//           0
//         ],
//         expectedOutput: [0, 2],
//         description: "Test case with mixed positive and negative numbers",
//       ),
//       TestCase(
//         name: "Large numbers",
//         inputs: [
//           [1000000000, 999999999, 1],
//           1999999999
//         ],
//         expectedOutput: [0, 1],
//         description: "Test case with large numbers near the constraint limit",
//       ),
//     ],
//   );

  @override
  State<DsaQuestionWidget> createState() => _DsaQuestionWidgetState();
}

class _DsaQuestionWidgetState extends State<DsaQuestionWidget> {
  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   setFunc();
    // });
    super.initState();
  }

//   void setFunc() async {
//     try {
//       await FirebaseFirestore.instance.collection('DSA').add({
//         "description":
//             "Given an array of integers nums, return true if any value appears at least twice in the array, and return false if every element is distinct.",
//         "difficulty": "Easy",
//         "problem_name": "Contains Duplicate",
//       }).then((doc) {
//         doc.collection("problem").add({
//           "answer": """
// void main() {
//   print("Hello, Dartic!");
//   print(containsDuplicate([1, 2, 3, 1]));
// }

// bool containsDuplicate(List<int> nums) {
//   Set<int> seen = {};

//   for (int num in nums) {
//     if (seen.contains(num)) {
//       return true;
//     }
//     seen.add(num);
//   }

//   return false;
// }
// """,
//           "question": """
// # Contains Duplicate
// **Difficulty:** Easy

// ## Problem Description

// Given an integer array `nums`, return `true` if any value appears at least twice in the array, and return `false` if every element is distinct.

// ## Examples

// ### Example 1:
// ```
// Input: nums = [1,2,3,1]
// Output: true
// Explanation: The element 1 occurs at indices 0 and 3.
// ```

// ### Example 2:
// ```
// Input: nums = [1,2,3,4]
// Output: false
// Explanation: All elements are distinct.
// ```

// ### Example 3:
// ```
// Input: nums = [1,1,1,3,3,4,3,2,4,2]
// Output: true
// Explanation: Multiple elements appear more than once.
// ```

// ## Constraints

// - `1 ≤ nums.length ≤ 10⁵`
// - `-10⁹ ≤ nums[i] ≤ 10⁹`""",
//           "function_name": "containsDuplicate",
//           "test_cases": [
//             json.encode({
//               "name": "Example 1",
//               "inputs": [
//                 [1, 2, 3, 1]
//               ],
//               "expected_output": true,
//               "description": "Duplicate at different positions"
//             }),
//             json.encode({
//               "name": "Example 2",
//               "inputs": [
//                 [1, 2, 3, 4]
//               ],
//               "expected_output": false,
//               "description": "All distinct elements"
//             }),
//             json.encode({
//               "name": "Example 3",
//               "inputs": [
//                 [1, 1, 1, 3, 3, 4, 3, 2, 4, 2]
//               ],
//               "expected_output": true,
//               "description": "Multiple duplicates"
//             }),
//             json.encode({
//               "name": "Single element",
//               "inputs": [
//                 [1]
//               ],
//               "expected_output": false,
//               "description": "Array with one element"
//             }),
//             json.encode({
//               "name": "Two identical elements",
//               "inputs": [
//                 [5, 5]
//               ],
//               "expected_output": true,
//               "description": "Minimum duplicate case"
//             }),
//             json.encode({
//               "name": "Two different elements",
//               "inputs": [
//                 [5, 6]
//               ],
//               "expected_output": false,
//               "description": "Two distinct elements"
//             }),
//             json.encode({
//               "name": "Negative numbers with duplicate",
//               "inputs": [
//                 [-1, -2, -3, -1]
//               ],
//               "expected_output": true,
//               "description": "Negative numbers containing duplicates"
//             }),
//             json.encode({
//               "name": "Negative numbers all distinct",
//               "inputs": [
//                 [-1, -2, -3, -4]
//               ],
//               "expected_output": false,
//               "description": "All distinct negative numbers"
//             }),
//             json.encode({
//               "name": "Mixed positive and negative",
//               "inputs": [
//                 [-5, 0, 5, -5, 10]
//               ],
//               "expected_output": true,
//               "description": "Mixed signs with duplicate"
//             }),
//             json.encode({
//               "name": "All zeros",
//               "inputs": [
//                 [0, 0, 0]
//               ],
//               "expected_output": true,
//               "description": "Multiple zeros"
//             }),
//             json.encode({
//               "name": "Large numbers",
//               "inputs": [
//                 [1000000000, -1000000000, 999999999, 1000000000]
//               ],
//               "expected_output": true,
//               "description": "Large values at constraint boundaries"
//             }),
//             json.encode({
//               "name": "Large distinct array",
//               "inputs": [List.generate(1000, (i) => i)],
//               "expected_output": false,
//               "description": "Large array with all distinct elements"
//             }),
//             json.encode({
//               "name": "Large array with duplicate at end",
//               "inputs": [List.generate(1000, (i) => i)..add(500)],
//               "expected_output": true,
//               "description": "Large array with duplicate at the end"
//             }),
//             json.encode({
//               "name": "Consecutive duplicates",
//               "inputs": [
//                 [1, 1, 2, 3, 4]
//               ],
//               "expected_output": true,
//               "description": "Duplicate elements next to each other"
//             }),
//             json.encode({
//               "name": "Duplicate at start and end",
//               "inputs": [
//                 [7, 2, 3, 4, 5, 7]
//               ],
//               "expected_output": true,
//               "description": "Same element at first and last position"
//             })
//           ]
//         });
//       });
//     } catch (e) {
//       // Handle error
//     }
//   }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: MarkdownWidget(
          data: widget.text ?? "",
          selectable: true,
          config: config,
        ),
      ),
    );
  }
}




// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:dartcoder/features/editor/models/test_case.dart';
// import 'package:dartcoder/shared/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:markdown_widget/widget/markdown.dart';

// class DsaQuestionWidget extends StatefulWidget {
//   const DsaQuestionWidget({super.key});

//   static const String questionMarkdown = '''
// # 1. Two Sum
// **Difficulty:** Easy

// ## Problem Description

// Given an array of integers `nums` and an integer `target`, return indices of the two numbers such that they add up to target.

// You may assume that each input would have exactly one solution, and you may not use the same element twice.

// You can return the answer in any order.

// ## Examples

// ### Example 1:
// ```
// Input: nums = [2,7,11,15], target = 9
// Output: [0,1]
// Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
// ```

// ### Example 2:
// ```
// Input: nums = [3,2,4], target = 6
// Output: [1,2]
// ```

// ### Example 3:
// ```
// Input: nums = [3,3], target = 6
// Output: [0,1]
// ```

// ## Constraints

// - `2 ≤ nums.length ≤ 10⁴`
// - `-10⁹ ≤ nums[i] ≤ 10⁹`
// - `-10⁹ ≤ target ≤ 10⁹`
// - Only one valid answer exists.

// ''';

//   // Test suite for the Two Sum problem
//   static final TestSuite testSuite = TestSuite(
//     description: "",
//     problemName: "Two Sum",
//     functionName: "twoSum",
//     testCases: [
//       TestCase(
//         name: "Example 1",
//         inputs: [
//           [2, 7, 11, 15],
//           9
//         ],
//         expectedOutput: [0, 1],
//         description: "Basic test case with solution at the beginning",
//       ),
//       TestCase(
//         name: "Example 2",
//         inputs: [
//           [3, 2, 4],
//           6
//         ],
//         expectedOutput: [1, 2],
//         description: "Test case with solution in the middle",
//       ),
//       TestCase(
//         name: "Example 3",
//         inputs: [
//           [3, 3],
//           6
//         ],
//         expectedOutput: [0, 1],
//         description: "Test case with duplicate numbers",
//       ),
//       TestCase(
//         name: "Negative numbers",
//         inputs: [
//           [-1, -2, -3, -4, -5],
//           -8
//         ],
//         expectedOutput: [2, 4],
//         description: "Test case with negative numbers",
//       ),
//       TestCase(
//         name: "Mixed positive and negative",
//         inputs: [
//           [-3, 4, 3, 90],
//           0
//         ],
//         expectedOutput: [0, 2],
//         description: "Test case with mixed positive and negative numbers",
//       ),
//       TestCase(
//         name: "Large numbers",
//         inputs: [
//           [1000000000, 999999999, 1],
//           1999999999
//         ],
//         expectedOutput: [0, 1],
//         description: "Test case with large numbers near the constraint limit",
//       ),
//     ],
//   );

//   @override
//   State<DsaQuestionWidget> createState() => _DsaQuestionWidgetState();
// }

// class _DsaQuestionWidgetState extends State<DsaQuestionWidget> {
//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       sjjsjsj();
//     });
//     super.initState();
//   }

//   void sjjsjsj() async {
//     try {
//       await FirebaseFirestore.instance
//           .collection('DSA')
//           .doc('lJUJQEIwoPDQHyqXNi9S')
//           .collection("problem")
//           .add({
//         "answer": """
// void main() {
//   print("Hello, Dartic!");
//   print(twoSum([2, 7, 11, 15], 9));
//   }
  
// List<int> twoSum(List<int> nums, int target) {
//   Map<int, int> numToIndex = {};
  
//   for (int i = 0; i < nums.length; i++) {
//     int complement = target - nums[i];
  
//     if (numToIndex.containsKey(complement)) {
//       return [numToIndex[complement]!, i];
//     }

//     numToIndex[nums[i]] = i;
//   }

// }
  
// """,
//         "question": """
// # 1. Two Sum
// **Difficulty:** Easy

// ## Problem Description

// Given an array of integers `nums` and an integer `target`, return indices of the two numbers such that they add up to target.

// You may assume that each input would have exactly one solution, and you may not use the same element twice.

// You can return the answer in any order.

// ## Examples

// ### Example 1:
// ```
// Input: nums = [2,7,11,15], target = 9
// Output: [0,1]
// Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
// ```

// ### Example 2:
// ```
// Input: nums = [3,2,4], target = 6
// Output: [1,2]
// ```

// ### Example 3:
// ```
// Input: nums = [3,3], target = 6
// Output: [0,1]
// ```

// ## Constraints

// - `2 ≤ nums.length ≤ 10⁴`
// - `-10⁹ ≤ nums[i] ≤ 10⁹`
// - `-10⁹ ≤ target ≤ 10⁹`
// - Only one valid answer exists.""",
//         "function_name": "twoSum",
//         "test_cases": [
//           {
//             "name": "Example 1",
//             "inputs": [
//               [2, 7, 11, 15],
//               9
//             ],
//             "expected_output": [0, 1],
//             "description": "Basic test case with solution at the beginning"
//           }
//         ]
//       });
//     } catch (e) {}
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20.w),
//         child: MarkdownWidget(
//           data: DsaQuestionWidget.questionMarkdown,
//           selectable: true,
//           config: config,
//         ),
//       ),
//     );
//   }
// }
