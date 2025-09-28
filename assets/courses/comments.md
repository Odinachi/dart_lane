# Comments in Dart

Imagine you're writing a **secret diary** 📔✨!

You want to leave notes for yourself:

- 💭 "Remember to feed the cat tomorrow"
- 📝 "This is where I keep my favorite recipes"
- 🤔 "Why did I write this weird code again?"

But you don't want these notes to be read out loud when someone reads your diary!

👉 **Comments** in Dart work exactly like these secret notes:

> They're messages for **humans** (including future you!) that the computer completely **ignores** when running your code!

---

## 🤖 The Problem: Mysterious Code

```dart
void main() {
  // ❌ Without comments, code can be confusing!
  int x = 25;
  int y = x * 2 + 10;
  double z = y / 3.5;
  print(z);
}
```

**Problems:**

- What do x, y, and z represent? 🤷‍♀️
- Why these specific numbers? 🤔
- What is this calculation for? 😵

---

## ✅ The Solution: Clear Comments

```dart
void main() {
  // 🍕 Pizza calculation for the school party
  int students = 25;                    // Number of students in our class
  int totalSlices = students * 2 + 10;  // 2 slices per student + 10 extra
  double pizzasNeeded = totalSlices / 3.5;  // Each pizza has 3.5 slices on average

  print('We need $pizzasNeeded pizzas for the party! 🍕');
}
```

**Output:**

```
We need 17.14285714285714 pizzas for the party! 🍕
```

**Amazing!** Now everyone understands what the code does! 🎉

---

## 📝 Types of Comments

### 1. Single-Line Comments (`//`)

Perfect for quick notes and explanations:

```dart
void main() {
  // This is a single-line comment
  print('Hello World!'); // This comment is at the end of a line

  // You can stack multiple single-line comments
  // to create longer explanations
  // like this multi-line note!

  int age = 12; // Student's age in years
}
```

### 2. Multi-Line Comments (`/* */`)

Great for longer explanations:

```dart
void main() {
  /*
   * This is a multi-line comment!
   * It can span several lines and is perfect for
   * detailed explanations, instructions, or
   * temporarily disabling large blocks of code.
   */

  print('This code will run!');

  /*
  print('This code is commented out');
  print('So it will NOT run');
  */
}
```

### 3. Documentation Comments (`///`)

Special comments for documenting functions and classes:

```dart
/// Calculates the area of a rectangle
///
/// Takes [width] and [height] as parameters
/// Returns the calculated area as a double
double calculateArea(double width, double height) {
  return width * height;
}

void main() {
  double area = calculateArea(5.0, 3.0);
  print('Area: $area square units');
}
```

---

## 🎮 Gaming Example: Player Stats

```dart
void main() {
  print('🎮 EPIC ADVENTURE GAME 🎮\n');

  // ========================================
  // PLAYER CHARACTER SETUP
  // ========================================

  String playerName = 'DragonSlayer2024';  // Player's chosen username
  int playerLevel = 15;                    // Current character level
  int experience = 2450;                   // Total XP earned
  int health = 85;                         // Current HP (out of 100)
  int mana = 60;                          // Current MP for spells

  // ========================================
  // INVENTORY ITEMS
  // ========================================

  int coins = 1250;        // Gold coins collected
  int healthPotions = 3;   // Red potions for healing
  int manaPotions = 5;     // Blue potions for mana
  bool hasSword = true;    // Legendary sword equipped
  bool hasShield = false;  // No shield currently

  /*
   * GAME MECHANICS NOTES:
   * - Health potions restore 50 HP each
   * - Mana potions restore 30 MP each
   * - Legendary sword increases attack by 25
   * - Player needs 3000 XP to reach level 16
   */

  // ========================================
  // DISPLAY PLAYER STATUS
  // ========================================

  print('⚔️ Player: $playerName');
  print('📊 Level: $playerLevel');
  print('⚡ Experience: $experience XP');
  print('❤️ Health: $health/100');
  print('💙 Mana: $mana/100');
  print('💰 Coins: $coins');
  print('');

  // Check if player needs healing
  if (health < 50) {
    print('⚠️ Warning: Low health! Use a health potion!');
  }

  // Calculate XP needed for next level
  int xpNeeded = 3000 - experience;  // XP required for level 16
  print('🎯 XP needed for next level: $xpNeeded');

  /// TODO: Add equipment durability system
  /// TODO: Implement skill tree progression
  /// FIXME: Shield animation bug needs fixing
}
```

**Output:**

```
🎮 EPIC ADVENTURE GAME 🎮

⚔️ Player: DragonSlayer2024
📊 Level: 15
⚡ Experience: 2450 XP
❤️ Health: 85/100
💙 Mana: 60/100
💰 Coins: 1250

🎯 XP needed for next level: 550
```

---

## 🏫 School Grade Calculator

```dart
void main() {
  print('📊 STUDENT GRADE CALCULATOR 📊\n');

  // ========================================
  // STUDENT INFORMATION
  // ========================================

  String studentName = 'Emma Rodriguez';
  int studentAge = 14;
  String grade = '8th Grade';
  String teacher = 'Ms. Johnson';

  // ========================================
  // SUBJECT SCORES (out of 100 points)
  // ========================================

  int mathScore = 95;      // Algebra and geometry
  int scienceScore = 87;   // Biology and chemistry
  int englishScore = 92;   // Literature and grammar
  int historyScore = 89;   // World history focus
  int artScore = 98;       // Creative arts project

  /*
   * GRADING SCALE:
   * 90-100 = A (Excellent)
   * 80-89  = B (Good)
   * 70-79  = C (Average)
   * 60-69  = D (Below Average)
   * 0-59   = F (Failing)
   */

  // ========================================
  // CALCULATE OVERALL PERFORMANCE
  // ========================================

  // Add up all subject scores
  int totalPoints = mathScore + scienceScore + englishScore + historyScore + artScore;

  // Calculate average (total divided by number of subjects)
  double average = totalPoints / 5;

  // ========================================
  // DISPLAY RESULTS
  // ========================================

  print('👤 Student: $studentName');
  print('🎓 Grade: $grade');
  print('👩‍🏫 Teacher: $teacher');
  print('');

  print('📋 INDIVIDUAL SCORES:');
  print('🧮 Math: $mathScore%');
  print('🔬 Science: $scienceScore%');
  print('📚 English: $englishScore%');
  print('🏛️ History: $historyScore%');
  print('🎨 Art: $artScore%');
  print('');

  print('📊 OVERALL PERFORMANCE:');
  print('📈 Total Points: $totalPoints/500');
  print('🎯 Average: ${average.toStringAsFixed(1)}%');

  // Determine letter grade based on average
  String letterGrade;
  if (average >= 90) {
    letterGrade = 'A (Excellent! 🌟)';
  } else if (average >= 80) {
    letterGrade = 'B (Good work! 👍)';
  } else if (average >= 70) {
    letterGrade = 'C (Keep improving! 💪)';
  } else if (average >= 60) {
    letterGrade = 'D (Needs attention 📚)';
  } else {
    letterGrade = 'F (See teacher immediately 🆘)';
  }

  print('🏆 Letter Grade: $letterGrade');

  // Bonus: Check for honor roll eligibility
  if (average >= 90) {
    print('🎊 Congratulations! Eligible for Honor Roll!');
  }

  /// NOTE: Parent-teacher conference scheduled for next week
  /// TODO: Add extra credit assignment options
  /// TODO: Include attendance data in final grade
}
```

**Output:**

```
📊 STUDENT GRADE CALCULATOR 📊

👤 Student: Emma Rodriguez
🎓 Grade: 8th Grade
👩‍🏫 Teacher: Ms. Johnson

📋 INDIVIDUAL SCORES:
🧮 Math: 95%
🔬 Science: 87%
📚 English: 92%
🏛️ History: 89%
🎨 Art: 98%

📊 OVERALL PERFORMANCE:
📈 Total Points: 461/500
🎯 Average: 92.2%
🏆 Letter Grade: A (Excellent! 🌟)
🎊 Congratulations! Eligible for Honor Roll!
```

---

## 🛒 Shopping Cart System

```dart
void main() {
  print('🛍️ ONLINE SHOPPING CART 🛍️\n');

  // ========================================
  // CUSTOMER INFORMATION
  // ========================================

  String customerName = 'Sarah Thompson';
  String email = 'sarah.thompson@email.com';
  String shippingAddress = '123 Main St, Anytown USA';
  bool isPremiumMember = true;  // Gets free shipping and discounts

  // ========================================
  // SHOPPING CART ITEMS
  // ========================================

  /*
   * Item format: [Name, Price, Quantity]
   * Prices are in USD
   * All items currently in stock
   */

  // Electronics category
  String item1 = 'Wireless Headphones';
  double price1 = 89.99;
  int qty1 = 1;

  // Clothing category
  String item2 = 'Cotton T-Shirt';
  double price2 = 24.95;
  int qty2 = 3;  // Buying multiple colors

  // Books category
  String item3 = 'Programming Guide';
  double price3 = 39.99;
  int qty3 = 1;

  // Home goods category
  String item4 = 'Coffee Mug Set';
  double price4 = 15.99;
  int qty4 = 2;  // One for home, one for office

  // ========================================
  // CALCULATE TOTALS
  // ========================================

  // Calculate cost for each item (price × quantity)
  double total1 = price1 * qty1;  // Headphones total
  double total2 = price2 * qty2;  // T-shirts total
  double total3 = price3 * qty3;  // Book total
  double total4 = price4 * qty4;  // Mugs total

  // Calculate subtotal (before taxes and shipping)
  double subtotal = total1 + total2 + total3 + total4;

  // Apply premium member discount (10% off)
  double discount = 0.0;
  if (isPremiumMember) {
    discount = subtotal * 0.10;  // 10% discount for premium members
  }

  // Calculate tax (8.5% sales tax)
  double taxRate = 0.085;
  double tax = (subtotal - discount) * taxRate;

  // Calculate shipping cost
  double shipping = 0.0;
  if (isPremiumMember) {
    shipping = 0.0;  // Free shipping for premium members
  } else if (subtotal >= 50.0) {
    shipping = 0.0;  // Free shipping on orders over $50
  } else {
    shipping = 7.99;  // Standard shipping fee
  }

  // Calculate final total
  double finalTotal = subtotal - discount + tax + shipping;

  // ========================================
  // DISPLAY RECEIPT
  // ========================================

  print('👤 Customer: $customerName');
  if (isPremiumMember) {
    print('⭐ Premium Member - Free Shipping & 10% Discount!');
  }
  print('📧 Email: $email');
  print('');

  print('🛒 CART ITEMS:');
  print('─' * 50);
  print('$item1 x$qty1 ............ \$${total1.toStringAsFixed(2)}');
  print('$item2 x$qty2 ............ \$${total2.toStringAsFixed(2)}');
  print('$item3 x$qty3 ............ \$${total3.toStringAsFixed(2)}');
  print('$item4 x$qty4 ............ \$${total4.toStringAsFixed(2)}');
  print('─' * 50);

  print('💰 PRICE BREAKDOWN:');
  print('Subtotal: \$${subtotal.toStringAsFixed(2)}');

  if (discount > 0) {
    print('Premium Discount: -\$${discount.toStringAsFixed(2)}');
  }

  print('Tax (8.5%): \$${tax.toStringAsFixed(2)}');
  print('Shipping: \$${shipping.toStringAsFixed(2)}');
  print('─' * 30);
  print('TOTAL: \$${finalTotal.toStringAsFixed(2)}');

  /// TODO: Add gift wrapping option
  /// TODO: Implement wishlist save feature
  /// NOTE: Order will ship within 2-3 business days
}
```

---

## 🎨 Comment Best Practices

### ✅ Good Comments

```dart
void main() {
  // Calculate pizza slices needed for the class party
  int students = 28;
  int slicesPerStudent = 2;
  int totalSlices = students * slicesPerStudent;

  // Add 20% extra slices for hungry students
  int extraSlices = (totalSlices * 0.2).round();
  int finalSliceCount = totalSlices + extraSlices;

  print('Total slices needed: $finalSliceCount');
}
```

### ❌ Bad Comments

```dart
void main() {
  // This is a variable
  int x = 5;

  // Adding numbers
  int y = x + 3;

  // Printing the result
  print(y);
}
```

**Why these are bad:**

- They state the obvious 🙄
- They don't explain **why**, only **what**
- They add clutter without value 🗑️

---

## 🧠 Comment Categories

### 1. **Explanation Comments** 💡

Explain **why** something is done:

```dart
// Using a delay to prevent server overload
await Future.delayed(Duration(seconds: 1));

// Rounding to 2 decimal places for currency display
double price = (cost * 1.08).toFixed(2);
```

### 2. **Warning Comments** ⚠️

Alert about potential issues:

```dart
// WARNING: Do not change this value - it breaks the login system
int maxRetries = 3;

// CAUTION: This function is CPU intensive for large datasets
void processLargeFile(List<String> data) { }
```

### 3. **TODO Comments** 📋

Mark future improvements:

```dart
// TODO: Add input validation for email addresses
String email = getUserInput();

// TODO: Implement dark mode theme
void setTheme() { }
```

### 4. **Section Comments** 🏗️

Organize code into logical sections:

```dart
// ========================================
// USER AUTHENTICATION
// ========================================

// ========================================
// DATA PROCESSING
// ========================================

// ========================================
// UI DISPLAY
// ========================================
```

---

## 🚫 Commenting Out Code

Sometimes you need to temporarily disable code:

```dart
void main() {
  print('This line will run');

  // print('This line is commented out');

  /*
  print('This entire block');
  print('is commented out');
  print('and will not run');
  */

  print('This line will also run');
}
```

**Output:**

```
This line will run
This line will also run
```

**Use cases:**

- Testing different approaches 🧪
- Debugging issues 🐛
- Temporarily removing features 🔧

---

## 📊 Quick Reference Guide

### Comment Syntax

| Type              | Syntax          | Use Case                                 |
| ----------------- | --------------- | ---------------------------------------- |
| **Single Line**   | `// comment`    | Quick notes, end-of-line explanations    |
| **Multi Line**    | `/* comment */` | Long explanations, commenting out blocks |
| **Documentation** | `/// comment`   | Function and class documentation         |

### Comment Keywords

| Keyword     | Meaning        | Example                               |
| ----------- | -------------- | ------------------------------------- |
| **TODO**    | Future task    | `// TODO: Add error handling`         |
| **FIXME**   | Known bug      | `// FIXME: Memory leak in loop`       |
| **NOTE**    | Important info | `// NOTE: API rate limit is 100/hour` |
| **WARNING** | Caution needed | `// WARNING: This deletes all data`   |

---

## 🎯 When to Use Comments

**✅ Write comments for:**

- **Complex logic** that's hard to understand
- **Business rules** and requirements
- **Assumptions** and limitations
- **Temporary workarounds** and their reasons
- **Public APIs** and function documentation

**❌ Don't comment:**

- **Obvious code** that's self-explanatory
- **Bad code** - fix it instead!
- **Every single line** - it creates noise
- **Outdated information** - remove or update it

---

## 🚀 Practice Challenge

Try adding comments to this code to make it clear:

```dart
void main() {
  int a = 10;
  int b = 5;
  int c = a + b;
  int d = c * 2;
  double e = d / 4;
  print(e);
}
```

**Your mission:** Add comments that explain what this calculation is for and why each step is necessary! 🎯

---

## 🎉 Remember This!

Comments are like **helpful sticky notes** 📝 in your code:

- **💭 For Future You**: "Why did I write this crazy code?"
- **👥 For Teammates**: "Here's how this tricky part works"
- **📚 For Learning**: "This is where the magic happens"
- **🛡️ For Safety**: "Don't touch this unless you know what you're doing!"

**Pro Tip**: Write comments like you're explaining to a friend who's smart but doesn't know your code. Be helpful, not obvious! 🤝✨

Good comments make your code a **joy to read** instead of a **mystery to solve**! 🕵️‍♀️➡️😊
