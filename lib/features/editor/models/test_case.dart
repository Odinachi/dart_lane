class TestResult {
  final TestCase testCase;
  final dynamic actualOutput;
  final bool passed;
  final String? errorMessage;
  final Duration executionTime;

  const TestResult({
    required this.testCase,
    required this.actualOutput,
    required this.passed,
    this.errorMessage,
    required this.executionTime,
  });
}

class TestRunResult {
  final TestSuite testSuite;
  final List<TestResult> results;
  final int passedCount;
  final int totalCount;
  final Duration totalExecutionTime;

  const TestRunResult({
    required this.testSuite,
    required this.results,
    required this.passedCount,
    required this.totalCount,
    required this.totalExecutionTime,
  });

  double get passRate => totalCount > 0 ? passedCount / totalCount : 0.0;
}

class TestCase {
  final String name;
  final List<dynamic> inputs;
  final dynamic expectedOutput;
  final String? description;

  const TestCase({
    required this.name,
    required this.inputs,
    required this.expectedOutput,
    this.description,
  });
}

class TestSuite {
  final String problemName;
  final String description;
  final String functionName;
  final List<TestCase> testCases;

  const TestSuite({
    required this.problemName,
    required this.functionName,
    required this.testCases,
    required this.description,  
  });
}
