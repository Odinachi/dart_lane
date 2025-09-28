# Functions in Dart

Imagine you have a **magic recipe book** 📖✨!

Each recipe has:

- A **name** (like "Make Chocolate Cake" 🎂)
- **Ingredients** you need to bring (like flour, eggs, sugar)
- **Step-by-step instructions** to follow
- A **delicious result** you get at the end!

👉 **Functions** in Dart work exactly like these magic recipes:

> A function is a **named set of instructions** that takes some **ingredients** (parameters), follows the **recipe** (code), and gives you a **result**!

---

## 🍰 The Problem: Repetitive Cooking

```dart
void main() {
  // ❌ Making cakes the hard way - lots of repetition!
  print('Step 1: Mix flour and sugar');
  print('Step 2: Add eggs and butter');
  print('Step 3: Bake for 30 minutes');
  print('🎂 Chocolate cake is ready!');

  print('Step 1: Mix flour and sugar');
  print('Step 2: Add eggs and butter');
  print('Step 3: Bake for 30 minutes');
  print('🎂 Vanilla cake is ready!');

  print('Step 1: Mix flour and sugar');
  print('Step 2: Add eggs and butter');
  print('Step 3: Bake for 30 minutes');
  print('🎂 Strawberry cake is ready!');

  // Imagine making 50 cakes this way! 😵
}
```

**Problems:**

- Too much repeated code! 📝
- What if we want to change the recipe? We'd have to update it everywhere! 😰
- Hard to read and maintain 🤯

---

## ✅ The Solution: Magic Recipe Functions!

```dart
void makeCake(String flavor) {
  print('👩‍🍳 Starting to make a $flavor cake...');
  print('Step 1: Mix flour and sugar');
  print('Step 2: Add eggs and butter');
  print('Step 3: Add $flavor flavoring');
  print('Step 4: Bake for 30 minutes');
  print('🎂 Delicious $flavor cake is ready!');
  print('');
}

void main() {
  print('🏠 Welcome to Sarah\'s Bakery!\n');

  makeCake('Chocolate');
  makeCake('Vanilla');
  makeCake('Strawberry');

  print('🎉 All cakes are done! Time for the party!');
}
```

**Output:**

```
🏠 Welcome to Sarah's Bakery!

👩‍🍳 Starting to make a Chocolate cake...
Step 1: Mix flour and sugar
Step 2: Add eggs and butter
Step 3: Add Chocolate flavoring
Step 4: Bake for 30 minutes
🎂 Delicious Chocolate cake is ready!

👩‍🍳 Starting to make a Vanilla cake...
Step 1: Mix flour and sugar
Step 2: Add eggs and butter
Step 3: Add Vanilla flavoring
Step 4: Bake for 30 minutes
🎂 Delicious Vanilla cake is ready!

👩‍🍳 Starting to make a Strawberry cake...
Step 1: Mix flour and sugar
Step 2: Add eggs and butter
Step 3: Add Strawberry flavoring
Step 4: Bake for 30 minutes
🎂 Delicious Strawberry cake is ready!

🎉 All cakes are done! Time for the party!
```

**Amazing!** One recipe, many different cakes! 🎂✨

---

## 🏗️ Function Anatomy: Breaking Down the Recipe

```dart
void makeCake(String flavor) {
//│    │        │      │
//│    │        │      └── Parameter (ingredient needed)
//│    │        └─────────── Parameter type (what kind of ingredient)
//│    └──────────────────── Function name (recipe name)
//└───────────────────────── Return type (what you get back)

  // Function body (the actual recipe steps)
  print('Making $flavor cake...');

} // ← End of function
```

### 📋 Function Parts Explained:

| Part              | Purpose                      | Example                                           |
| ----------------- | ---------------------------- | ------------------------------------------------- |
| **Return Type**   | What the function gives back | `void` (nothing), `String` (text), `int` (number) |
| **Function Name** | What you call it             | `makeCake`, `sayHello`, `calculateArea`           |
| **Parameters**    | Ingredients/inputs needed    | `String flavor`, `int age`, `double price`        |
| **Function Body** | The actual instructions      | Everything between `{ }`                          |

---

## 🎁 Functions That Give Back Results

### Simple Return Function

```dart
String createGreeting(String name) {
  return '🌟 Hello there, $name! Welcome to our app! 🌟';
}

int addNumbers(int a, int b) {
  return a + b;
}

void main() {
  // Functions that return values
  String greeting = createGreeting('Emma');
  print(greeting);

  int sum = addNumbers(15, 27);
  print('📊 15 + 27 = $sum');

  // Use directly without storing
  print(createGreeting('Alex'));
  print('📊 10 + 5 = ${addNumbers(10, 5)}');
}
```

**Output:**

```
🌟 Hello there, Emma! Welcome to our app! 🌟
📊 15 + 27 = 42
🌟 Hello there, Alex! Welcome to our app! 🌟
📊 10 + 5 = 15
```

---

## 🎮 Interactive Gaming Examples

### Character Creation System

```dart
void createCharacter(String name, String type, int level) {
  print('✨ Creating new character...');
  print('👤 Name: $name');
  print('🎭 Type: $type');
  print('📊 Level: $level');
  print('💪 Health: ${level * 20}');
  print('⚔️ Attack Power: ${level * 5}');
  print('🛡️ $name the $type is ready for adventure!');
  print('═' * 40);
}

String getCharacterStatus(String name, int health, int level) {
  if (health > 75) {
    return '$name (Level $level) is feeling great! 💪';
  } else if (health > 25) {
    return '$name (Level $level) is getting tired... 😓';
  } else {
    return '$name (Level $level) needs help immediately! 🆘';
  }
}

int calculateDamage(int attackPower, String weaponType) {
  int baseDamage = attackPower;

  if (weaponType == 'sword') {
    return baseDamage + 10;
  } else if (weaponType == 'magic') {
    return baseDamage + 15;
  } else if (weaponType == 'bow') {
    return baseDamage + 8;
  } else {
    return baseDamage + 2; // bare hands
  }
}

void main() {
  print('🎮 WELCOME TO ADVENTURE WORLD! 🎮\n');

  // Create some characters
  createCharacter('Luna', 'Wizard', 5);
  createCharacter('Thor', 'Warrior', 7);
  createCharacter('Aria', 'Archer', 4);

  // Check character status
  print('📋 CHARACTER STATUS REPORT:');
  print(getCharacterStatus('Luna', 85, 5));
  print(getCharacterStatus('Thor', 45, 7));
  print(getCharacterStatus('Aria', 15, 4));
  print('');

  // Calculate battle damage
  print('⚔️ BATTLE CALCULATIONS:');
  print('Luna attacks with magic: ${calculateDamage(25, 'magic')} damage! 🔥');
  print('Thor attacks with sword: ${calculateDamage(35, 'sword')} damage! ⚔️');
  print('Aria attacks with bow: ${calculateDamage(20, 'bow')} damage! 🏹');
}
```

**Output:**

```
🎮 WELCOME TO ADVENTURE WORLD! 🎮

✨ Creating new character...
👤 Name: Luna
🎭 Type: Wizard
📊 Level: 5
💪 Health: 100
⚔️ Attack Power: 25
🛡️ Luna the Wizard is ready for adventure!
════════════════════════════════════════
✨ Creating new character...
👤 Name: Thor
🎭 Type: Warrior
📊 Level: 7
💪 Health: 140
⚔️ Attack Power: 35
🛡️ Thor the Warrior is ready for adventure!
════════════════════════════════════════
✨ Creating new character...
👤 Name: Aria
🎭 Type: Archer
📊 Level: 4
💪 Health: 80
⚔️ Attack Power: 20
🛡️ Aria the Archer is ready for adventure!
════════════════════════════════════════

📋 CHARACTER STATUS REPORT:
Luna (Level 5) is feeling great! 💪
Thor (Level 7) is getting tired... 😓
Aria (Level 4) needs help immediately! 🆘

⚔️ BATTLE CALCULATIONS:
Luna attacks with magic: 40 damage! 🔥
Thor attacks with sword: 45 damage! ⚔️
Aria attacks with bow: 28 damage! 🏹
```

---

## 🛒 Shopping Cart System

```dart
void addToCart(String item, double price, int quantity) {
  double totalCost = price * quantity;
  print('🛒 Added to cart:');
  print('   📦 Item: $item');
  print('   💰 Price: \$${price.toStringAsFixed(2)} each');
  print('   📊 Quantity: $quantity');
  print('   💵 Total: \$${totalCost.toStringAsFixed(2)}');
  print('   ✅ Added successfully!\n');
}

double calculateTotal(List<double> itemPrices) {
  double total = 0;
  for (double price in itemPrices) {
    total += price;
  }
  return total;
}

String applyCoupon(double total, String couponCode) {
  double discount = 0;

  if (couponCode == 'SAVE10') {
    discount = total * 0.1; // 10% off
    return 'Applied $couponCode: -\$${discount.toStringAsFixed(2)} (10% off)';
  } else if (couponCode == 'WELCOME20') {
    discount = total * 0.2; // 20% off
    return 'Applied $couponCode: -\$${discount.toStringAsFixed(2)} (20% off)';
  } else {
    return 'Invalid coupon code: $couponCode';
  }
}

void processOrder(String customerName, double total) {
  print('📋 ORDER SUMMARY FOR ${customerName.toUpperCase()}:');
  print('   💳 Total Amount: \$${total.toStringAsFixed(2)}');
  print('   📅 Order Date: ${DateTime.now().toString().substring(0, 10)}');
  print('   🚚 Estimated Delivery: 3-5 business days');
  print('   📧 Confirmation sent to your email!');
  print('   🎉 Thank you for your order!');
}

void main() {
  print('🛍️ WELCOME TO TECH STORE! 🛍️\n');

  // Customer shopping
  addToCart('Gaming Mouse', 49.99, 1);
  addToCart('Mechanical Keyboard', 129.99, 1);
  addToCart('USB-C Cable', 12.99, 2);

  // Calculate totals
  List<double> cartItems = [49.99, 129.99, 25.98]; // 2 cables = 12.99 * 2
  double subtotal = calculateTotal(cartItems);

  print('💰 CART TOTALS:');
  print('   Subtotal: \$${subtotal.toStringAsFixed(2)}');

  // Apply coupon
  String couponResult = applyCoupon(subtotal, 'WELCOME20');
  print('   $couponResult');

  double finalTotal = subtotal * 0.8; // After 20% discount
  print('   Final Total: \$${finalTotal.toStringAsFixed(2)}\n');

  // Process the order
  processOrder('Sarah Johnson', finalTotal);
}
```

**Output:**

```
🛍️ WELCOME TO TECH STORE! 🛍️

🛒 Added to cart:
   📦 Item: Gaming Mouse
   💰 Price: $49.99 each
   📊 Quantity: 1
   💵 Total: $49.99
   ✅ Added successfully!

🛒 Added to cart:
   📦 Item: Mechanical Keyboard
   💰 Price: $129.99 each
   📊 Quantity: 1
   💵 Total: $129.99
   ✅ Added successfully!

🛒 Added to cart:
   📦 Item: USB-C Cable
   💰 Price: $12.99 each
   📊 Quantity: 2
   💵 Total: $25.98
   ✅ Added successfully!

💰 CART TOTALS:
   Subtotal: $205.96
   Applied WELCOME20: -$41.19 (20% off)
   Final Total: $164.77

📋 ORDER SUMMARY FOR SARAH JOHNSON:
   💳 Total Amount: $164.77
   📅 Order Date: 2024-01-15
   🚚 Estimated Delivery: 3-5 business days
   📧 Confirmation sent to your email!
   🎉 Thank you for your order!
```

---

## 🏫 School Grade Calculator

```dart
void displayStudentInfo(String name, int age, String grade) {
  print('📚 STUDENT INFORMATION:');
  print('   👤 Name: $name');
  print('   🎂 Age: $age years old');
  print('   🎓 Grade: $grade');
  print('   📅 School Year: 2024-2025');
  print('');
}

double calculateAverage(List<int> scores) {
  if (scores.isEmpty) return 0.0;

  int total = 0;
  for (int score in scores) {
    total += score;
  }
  return total / scores.length;
}

String getLetterGrade(double average) {
  if (average >= 90) {
    return 'A+ (Excellent! 🌟)';
  } else if (average >= 80) {
    return 'B+ (Good work! 👍)';
  } else if (average >= 70) {
    return 'C+ (Keep trying! 💪)';
  } else if (average >= 60) {
    return 'D (Need improvement 📚)';
  } else {
    return 'F (See teacher for help 🆘)';
  }
}

void generateReport(String student, List<String> subjects, List<int> scores) {
  print('📊 REPORT CARD FOR ${student.toUpperCase()}:');
  print('=' * 40);

  for (int i = 0; i < subjects.length; i++) {
    String subject = subjects[i].padRight(15);
    String score = scores[i].toString().padLeft(3);
    print('   $subject: $score%');
  }

  double average = calculateAverage(scores);
  String letterGrade = getLetterGrade(average);

  print('=' * 40);
  print('   📈 Overall Average: ${average.toStringAsFixed(1)}%');
  print('   🎯 Letter Grade: $letterGrade');

  if (average >= 80) {
    print('   🏆 Great job! Keep up the excellent work!');
  } else if (average >= 70) {
    print('   💪 Good effort! A little more study will help!');
  } else {
    print('   📚 Consider getting extra help or tutoring.');
  }

  print('');
}

void main() {
  print('🏫 WASHINGTON ELEMENTARY SCHOOL 🏫\n');

  // Student 1
  displayStudentInfo('Emma Rodriguez', 10, '5th Grade');

  List<String> subjects1 = ['Math', 'Science', 'English', 'History', 'Art'];
  List<int> scores1 = [95, 88, 92, 85, 97];

  generateReport('Emma Rodriguez', subjects1, scores1);

  // Student 2
  displayStudentInfo('Marcus Johnson', 11, '5th Grade');

  List<String> subjects2 = ['Math', 'Science', 'English', 'History', 'Art'];
  List<int> scores2 = [76, 82, 79, 85, 88];

  generateReport('Marcus Johnson', subjects2, scores2);

  // Student 3
  displayStudentInfo('Lily Chen', 10, '5th Grade');

  List<String> subjects3 = ['Math', 'Science', 'English', 'History', 'Art'];
  List<int> scores3 = [64, 58, 67, 72, 69];

  generateReport('Lily Chen', subjects3, scores3);
}
```

**Output:**

```
🏫 WASHINGTON ELEMENTARY SCHOOL 🏫

📚 STUDENT INFORMATION:
   👤 Name: Emma Rodriguez
   🎂 Age: 10 years old
   🎓 Grade: 5th Grade
   📅 School Year: 2024-2025

📊 REPORT CARD FOR EMMA RODRIGUEZ:
========================================
   Math           :  95%
   Science        :  88%
   English        :  92%
   History        :  85%
   Art            :  97%
========================================
   📈 Overall Average: 91.4%
   🎯 Letter Grade: A+ (Excellent! 🌟)
   🏆 Great job! Keep up the excellent work!

📚 STUDENT INFORMATION:
   👤 Name: Marcus Johnson
   🎂 Age: 11 years old
   🎓 Grade: 5th Grade
   📅 School Year: 2024-2025

📊 REPORT CARD FOR MARCUS JOHNSON:
========================================
   Math           :  76%
   Science        :  82%
   English        :  79%
   History        :  85%
   Art            :  88%
========================================
   📈 Overall Average: 82.0%
   🎯 Letter Grade: B+ (Good work! 👍)
   🏆 Great job! Keep up the excellent work!

📚 STUDENT INFORMATION:
   👤 Name: Lily Chen
   🎂 Age: 10 years old
   🎓 Grade: 5th Grade
   📅 School Year: 2024-2025

📊 REPORT CARD FOR LILY CHEN:
========================================
   Math           :  64%
   Science        :  58%
   English        :  67%
   History        :  72%
   Art            :  69%
========================================
   📈 Overall Average: 66.0%
   🎯 Letter Grade: D (Need improvement 📚)
   📚 Consider getting extra help or tutoring.
```

---

## 🎨 Creative Functions: Art and Patterns

```dart
void drawPattern(String symbol, int width, int height) {
  print('🎨 Drawing ${width}x${height} pattern with "$symbol":');

  for (int row = 0; row < height; row++) {
    String line = '';
    for (int col = 0; col < width; col++) {
      line += '$symbol ';
    }
    print('   $line');
  }
  print('');
}

void drawTriangle(String symbol, int size) {
  print('🔺 Drawing triangle with "$symbol" (size $size):');

  for (int row = 1; row <= size; row++) {
    String spaces = ' ' * (size - row);
    String symbols = symbol * row;
    print('   $spaces$symbols');
  }
  print('');
}

String createBorder(String text, String borderChar) {
  int textLength = text.length;
  String topBottom = borderChar * (textLength + 4);

  return '$topBottom\n$borderChar $text $borderChar\n$topBottom';
}

void displayAsciiArt() {
  print('🎭 ASCII ART GALLERY:');
  print('');

  // Simple house
  print('   🏠 House:');
  print('      /\\   ');
  print('     /  \\  ');
  print('    /_  _\\ ');
  print('     |  |  ');
  print('     |__|  ');
  print('');

  // Simple tree
  print('   🌲 Tree:');
  print('       *    ');
  print('      ***   ');
  print('     *****  ');
  print('       |    ');
  print('       |    ');
  print('');

  // Simple cat
  print('   🐱 Cat:');
  print('     /\\_/\\  ');
  print('    ( o.o ) ');
  print('     > ^ <  ');
  print('');
}

void main() {
  print('🎨 WELCOME TO THE ART STUDIO! 🎨\n');

  // Draw various patterns
  drawPattern('⭐', 8, 3);
  drawPattern('🌸', 6, 2);
  drawPattern('💎', 5, 4);

  // Draw triangles
  drawTriangle('▲', 5);
  drawTriangle('♦', 4);
  drawTriangle('●', 6);

  // Create bordered text
  print('📋 BORDERED MESSAGES:');
  print(createBorder('WELCOME!', '*'));
  print('');
  print(createBorder('Hello World', '#'));
  print('');
  print(createBorder('Dart is Fun!', '='));
  print('');

  // Display ASCII art
  displayAsciiArt();
}
```

**Output:**

```
🎨 WELCOME TO THE ART STUDIO! 🎨

🎨 Drawing 8x3 pattern with "⭐":
   ⭐ ⭐ ⭐ ⭐ ⭐ ⭐ ⭐ ⭐
   ⭐ ⭐ ⭐ ⭐ ⭐ ⭐ ⭐ ⭐
   ⭐ ⭐ ⭐ ⭐ ⭐ ⭐ ⭐ ⭐

🎨 Drawing 6x2 pattern with "🌸":
   🌸 🌸 🌸 🌸 🌸 🌸
   🌸 🌸 🌸 🌸 🌸 🌸

🎨 Drawing 5x4 pattern with "💎":
   💎 💎 💎 💎 💎
   💎 💎 💎 💎 💎
   💎 💎 💎 💎 💎
   💎 💎 💎 💎 💎

🔺 Drawing triangle with "▲" (size 5):
       ▲
      ▲▲
     ▲▲▲
    ▲▲▲▲
   ▲▲▲▲▲

🔺 Drawing triangle with "♦" (size 4):
      ♦
     ♦♦
    ♦♦♦
   ♦♦♦♦

🔺 Drawing triangle with "●" (size 6):
        ●
       ●●
      ●●●
     ●●●●
    ●●●●●
   ●●●●●●

📋 BORDERED MESSAGES:
**********
* WELCOME! *
**********

############
# Hello World #
############

===============
= Dart is Fun! =
===============

🎭 ASCII ART GALLERY:

   🏠 House:
      /\
     /  \
    /_  _\
     |  |
     |__|

   🌲 Tree:
       *
      ***
     *****
       |
       |

   🐱 Cat:
     /\_/\
    ( o.o )
     > ^ <
```

---

## 🧮 Math Helper Functions

```dart
int factorial(int n) {
  if (n <= 1) return 1;
  return n * factorial(n - 1);
}

bool isPrime(int number) {
  if (number < 2) return false;

  for (int i = 2; i <= number ~/ 2; i++) {
    if (number % i == 0) return false;
  }
  return true;
}

double calculateCircleArea(double radius) {
  return 3.14159 * radius * radius;
}

double calculateCircleCircumference(double radius) {
  return 2 * 3.14159 * radius;
}

String mathFacts(int number) {
  List<String> facts = [];

  facts.add('Number: $number');
  facts.add('Is Even: ${number % 2 == 0}');
  facts.add('Is Prime: ${isPrime(number)}');
  facts.add('Factorial: ${factorial(number)}');
  facts.add('Square: ${number * number}');
  facts.add('Cube: ${number * number * number}');

  return facts.join('\n   ');
}

void solveMathProblems() {
  print('🧮 MATH PROBLEM SOLVER 🧮\n');

  // Circle calculations
  print('⭕ CIRCLE CALCULATIONS:');
  double radius = 5.0;
  print('   Radius: $radius units');
  print('   Area: ${calculateCircleArea(radius).toStringAsFixed(2)} square units');
  print('   Circumference: ${calculateCircleCircumference(radius).toStringAsFixed(2)} units');
  print('');

  // Number facts
  print('🔢 NUMBER FACTS:');

  List<int> numbersToCheck = [5, 7, 12, 17];

  for (int num in numbersToCheck) {
    print('📊 Facts about $num:');
    print('   ${mathFacts(num)}');
    print('');
  }

  // Prime number finder
  print('✨ PRIME NUMBERS (1-20):');
  String primes = '';
  for (int i = 1; i <= 20; i++) {
    if (isPrime(i)) {
      primes += '$i ';
    }
  }
  print('   $primes');
}

void main() {
  solveMathProblems();
}
```

**Output:**

```
🧮 MATH PROBLEM SOLVER 🧮

⭕ CIRCLE CALCULATIONS:
   Radius: 5.0 units
   Area: 78.54 square units
   Circumference: 31.42 units

🔢 NUMBER FACTS:
📊 Facts about 5:
   Number: 5
   Is Even: false
   Is Prime: true
   Factorial: 120
   Square: 25
   Cube: 125

📊 Facts about 7:
   Number: 7
   Is Even: false
   Is Prime: true
   Factorial: 5040
   Square: 49
   Cube: 343

📊 Facts about 12:
   Number: 12
   Is Even: true
   Is Prime: false
   Factorial: 479001600
   Square: 144
   Cube: 1728

📊 Facts about 17:
   Number: 17
   Is Even: false
   Is Prime: true
   Factorial: 355687428096000
   Square: 289
   Cube: 4913

✨ PRIME NUMBERS (1-20):
   2 3 5 7 11 13 17 19
```

---

## 🔧 Function Types Summary

### 1. **Void Functions** (No Return Value)

```dart
void sayHello() {
  print('Hello! 👋');
}

void displayInfo(String name, int age) {
  print('Name: $name, Age: $age');
}
```

### 2. **Return Functions** (Give Back a Value)

```dart
String getMessage() {
  return 'Hello World!';
}

int multiply(int a, int b) {
  return a * b;
}

bool isAdult(int age) {
  return age >= 18;
}
```

### 3. **Arrow Functions** (Short Form)

```dart
// Instead of:
int add(int a, int b) {
  return a + b;
}

// You can write:
int add(int a, int b) => a + b;

// More examples:
String greet(String name) => 'Hello, $name!';
double square(double x) => x * x;
bool isEven(int n) => n % 2 == 0;
```

---

## 📊 Quick Reference Guide

### Function Template

```dart
ReturnType functionName(ParameterType parameterName) {
  // Function body
  return value; // Only if ReturnType is not void
}
```

### Common Function Patterns

| Pattern        | Example                           | When to Use                           |
| -------------- | --------------------------------- | ------------------------------------- |
| **Action**     | `void printMessage()`             | Do something without returning        |
| **Calculator** | `int add(int a, int b)`           | Perform calculation and return result |
| **Checker**    | `bool isValid(String input)`      | Test something and return true/false  |
| **Converter**  | `String toUpperCase(String text)` | Transform input and return new value  |
| **Generator**  | `String createId()`               | Create something new and return it    |

---

## 🎯 When to Use Functions

**✅ Create functions when:**

- You repeat the same code multiple times
- You want to organize complex logic into smaller pieces
- You need to reuse code in different parts of your program
- You want to make your code easier to read and understand
- You want to test specific pieces of functionality

**🔄 Benefits:**

- **DRY Principle**: Don't Repeat Yourself
- **Modularity**: Break big problems into smaller pieces
- **Reusability**: Use the same function many times
- **Maintainability**: Change code in one place instead of many
- **Readability**: Functions have descriptive names that explain what they do

---

## 🚀 Practice Challenges

Try creating these functions:

1. **Weather Function**: `String getWeatherAdvice(int temperature, bool isRaining)`
2. **Password Checker**: `bool isStrongPassword(String password)`
3. **Age Calculator**: `int calculateAge(int birthYear)`
4. **Text Formatter**: `String formatPhoneNumber(String digits)`
5. **Game Scorer**: `int calculateTotalScore(List<int> levelScores)`

---

## 🎉 Remember This!

Functions are like **LEGO instruction sets** 🧱:

- **📖 Instructions**: Step-by-step guide (function body)
- **🧩 Pieces Needed**: What you bring to build (parameters)
- **🏗️ Final Creation**: What you get when done (return value)
- **🔄 Reusable**: Use the same instructions to build many things!

**The Magic**: Once you write a function, you can use it over and over again - just like having a robot assistant that knows exactly how to do specific jobs for you! 🤖✨

Functions make your code **cleaner**, **faster to write**, and **easier to fix**. They're one of the most important tools in programming! 🚀
