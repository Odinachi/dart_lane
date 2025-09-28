# Variables in Dart

Imagine you're the **manager of a magical treasure chest shop** 💎🏪!

You have different types of **treasure chests**, each with a **special label** on top:

- 🏷️ A chest labeled **"Gold Coins"** that holds exactly 50 coins
- 🏷️ A chest labeled **"Magic Spell"** that contains the words "Abracadabra"
- 🏷️ A chest labeled **"Dragon Sleeping"** that shows true or false
- 🏷️ A chest labeled **"Potion Strength"** that holds 3.5 power units

👉 **Variables** are exactly like these labeled treasure chests:

> They **store different types of treasures** (values) and have **names** (labels) so you can find them later!

---

## 🚫 The Problem: Forgetting Important Information

```dart
void main() {
  // ❌ Without variables, we'd have to remember everything!
  print('The player has 50 gold coins');
  print('The player has 50 gold coins'); // Oops, did I type 50 correctly?
  print('The player has 51 gold coins'); // Wait, is it 50 or 51?
}
```

**Problems:**

- Hard to remember numbers and text! 🤯
- Easy to make typos! ✏️💥
- What if we want to change the amount? We'd have to find every single place! 🔍

---

## ✅ The Solution: Magical Treasure Chests (Variables)!

```dart
void main() {
  // ✅ Create labeled treasure chests to store our values!
  int goldCoins = 50;
  String magicSpell = 'Abracadabra';
  bool dragonSleeping = true;
  double potionStrength = 3.5;

  print('🏷️ Gold Coins chest contains: $goldCoins coins');
  print('🏷️ Magic Spell chest contains: "$magicSpell"');
  print('🏷️ Dragon Sleeping chest shows: $dragonSleeping');
  print('🏷️ Potion Strength chest has: $potionStrength power units');
}
```

**Output:**

```
🏷️ Gold Coins chest contains: 50 coins
🏷️ Magic Spell chest contains: "Abracadabra"
🏷️ Dragon Sleeping chest shows: true
🏷️ Potion Strength chest has: 3.5 power units
```

**Amazing!** Now we have organized treasure chests with clear labels! 🎉

---

## 🎮 Gaming Example: Player Stats

```dart
void main() {
  print('🎮 EPIC ADVENTURE GAME 🎮\n');

  // Player information stored in variables
  String playerName = 'DragonSlayer2024';
  int playerLevel = 15;
  int healthPoints = 85;
  int maxHealth = 100;
  double experiencePoints = 2847.5;
  bool hasLegendaryWeapon = true;
  String currentLocation = 'Enchanted Forest';

  // Display player stats
  print('👤 PLAYER PROFILE');
  print('══════════════════');
  print('🏷️ Name: $playerName');
  print('📊 Level: $playerLevel');
  print('❤️ Health: $healthPoints/$maxHealth HP');
  print('⭐ Experience: $experiencePoints XP');
  print('⚔️ Legendary Weapon: ${hasLegendaryWeapon ? "Yes! 🗡️" : "No 😢"}');
  print('📍 Location: $currentLocation');

  print('\n🎯 QUEST STATUS:');
  if (healthPoints < maxHealth) {
    print('⚠️ Health is low! Find a healing potion.');
  }

  if (hasLegendaryWeapon) {
    print('✨ You\'re ready to face the dragon!');
  } else {
    print('🔍 Search for a legendary weapon first.');
  }
}
```

**Output:**

```
🎮 EPIC ADVENTURE GAME 🎮

👤 PLAYER PROFILE
══════════════════
🏷️ Name: DragonSlayer2024
📊 Level: 15
❤️ Health: 85/100 HP
⭐ Experience: 2847.5 XP
⚔️ Legendary Weapon: Yes! 🗡️
📍 Location: Enchanted Forest

🎯 QUEST STATUS:
⚠️ Health is low! Find a healing potion.
✨ You're ready to face the dragon!
```

---

## 📱 Social Media App Example

```dart
void main() {
  print('📱 SOCIAL MEDIA PROFILE 📱\n');

  // User profile variables
  String username = '@sarah_codes';
  String fullName = 'Sarah Johnson';
  int followers = 1247;
  int following = 892;
  int totalPosts = 156;
  bool isVerified = true;
  String bio = 'Flutter developer 💙 | Coffee lover ☕ | Dog mom 🐕';
  double accountAge = 2.5; // years

  // Recent post variables
  String lastPost = 'Just built my first mobile app! 🚀';
  int likes = 89;
  int comments = 23;
  bool hasNewNotifications = true;

  // Display profile
  print('👤 PROFILE INFO');
  print('═' * 25);
  print('🏷️ Username: $username ${isVerified ? "✅" : ""}');
  print('🏷️ Full Name: $fullName');
  print('📊 Followers: ${followers.toString().padLeft(4)} | Following: $following');
  print('📸 Posts: $totalPosts');
  print('📝 Bio: $bio');
  print('📅 Member for: $accountAge years');

  print('\n📫 LATEST ACTIVITY');
  print('═' * 25);
  print('💬 Last post: "$lastPost"');
  print('❤️ Likes: $likes | 💬 Comments: $comments');
  print('🔔 New notifications: ${hasNewNotifications ? "Yes!" : "None"}');

  // Calculate engagement rate
  double engagementRate = ((likes + comments) / followers) * 100;
  print('📈 Engagement rate: ${engagementRate.toStringAsFixed(1)}%');
}
```

**Output:**

```
📱 SOCIAL MEDIA PROFILE 📱

👤 PROFILE INFO
═════════════════════════
🏷️ Username: @sarah_codes ✅
🏷️ Full Name: Sarah Johnson
📊 Followers: 1247 | Following: 892
📸 Posts: 156
📝 Bio: Flutter developer 💙 | Coffee lover ☕ | Dog mom 🐕
📅 Member for: 2.5 years

📫 LATEST ACTIVITY
═════════════════════════
💬 Last post: "Just built my first mobile app! 🚀"
❤️ Likes: 89 | 💬 Comments: 23
🔔 New notifications: Yes!
📈 Engagement rate: 9.0%
```

---

## 🏪 Shopping Cart Example

```dart
void main() {
  print('🛒 ONLINE SHOPPING CART 🛒\n');

  // Customer information
  String customerName = 'Alice Smith';
  bool isPremiumMember = true;
  String shippingAddress = '123 Oak Street, Springfield';

  // Product information
  String product1 = 'Wireless Headphones';
  double price1 = 79.99;
  int quantity1 = 1;

  String product2 = 'Phone Case';
  double price2 = 24.99;
  int quantity2 = 2;

  String product3 = 'Charging Cable';
  double price3 = 15.99;
  int quantity3 = 1;

  // Shopping cart calculations
  double subtotal = (price1 * quantity1) + (price2 * quantity2) + (price3 * quantity3);
  double taxRate = 0.08; // 8% tax
  double taxAmount = subtotal * taxRate;
  double shippingCost = isPremiumMember ? 0.0 : 5.99;
  double totalAmount = subtotal + taxAmount + shippingCost;

  // Display order summary
  print('📋 ORDER SUMMARY');
  print('═' * 35);
  print('👤 Customer: $customerName');
  print('⭐ Premium Member: ${isPremiumMember ? "Yes 🎖️" : "No"}');
  print('📦 Shipping to: $shippingAddress\n');

  print('🛍️ ITEMS:');
  print('$product1 x$quantity1 - \$${(price1 * quantity1).toStringAsFixed(2)}');
  print('$product2 x$quantity2 - \$${(price2 * quantity2).toStringAsFixed(2)}');
  print('$product3 x$quantity3 - \$${(price3 * quantity3).toStringAsFixed(2)}');

  print('\n💰 PRICING:');
  print('Subtotal: \$${subtotal.toStringAsFixed(2)}');
  print('Tax (${(taxRate * 100).toStringAsFixed(0)}%): \$${taxAmount.toStringAsFixed(2)}');
  print('Shipping: ${isPremiumMember ? "FREE! 🎉" : "\$${shippingCost.toStringAsFixed(2)}"}');
  print('─' * 25);
  print('TOTAL: \$${totalAmount.toStringAsFixed(2)}');

  if (isPremiumMember) {
    print('\n🎁 Premium perks applied:');
    print('• Free shipping saved: \$5.99');
    print('• Faster delivery: 1-2 days');
  }
}
```

**Output:**

```
🛒 ONLINE SHOPPING CART 🛒

📋 ORDER SUMMARY
═══════════════════════════════════
👤 Customer: Alice Smith
⭐ Premium Member: Yes 🎖️
📦 Shipping to: 123 Oak Street, Springfield

🛍️ ITEMS:
Wireless Headphones x1 - $79.99
Phone Case x2 - $49.98
Charging Cable x1 - $15.99

💰 PRICING:
Subtotal: $145.96
Tax (8%): $11.68
Shipping: FREE! 🎉
─────────────────────────
TOTAL: $157.64

🎁 Premium perks applied:
• Free shipping saved: $5.99
• Faster delivery: 1-2 days
```

---

## 🏫 School Grade Calculator

```dart
void main() {
  print('🎓 STUDENT GRADE CALCULATOR 🎓\n');

  // Student information
  String studentName = 'Emma Rodriguez';
  String studentId = 'ST20241105';
  String course = 'Introduction to Computer Science';
  int semester = 1;
  bool isHonorsStudent = true;

  // Assignment scores (out of 100)
  int homework1 = 95;
  int homework2 = 87;
  int homework3 = 92;
  double midtermExam = 88.5;
  double finalExam = 91.0;
  int projectScore = 96;
  double participationScore = 94.5;

  // Grade weights
  double homeworkWeight = 0.25;      // 25%
  double midtermWeight = 0.20;       // 20%
  double finalWeight = 0.30;         // 30%
  double projectWeight = 0.15;       // 15%
  double participationWeight = 0.10; // 10%

  // Calculate average homework score
  double homeworkAverage = (homework1 + homework2 + homework3) / 3;

  // Calculate weighted final grade
  double finalGrade = (homeworkAverage * homeworkWeight) +
                     (midtermExam * midtermWeight) +
                     (finalExam * finalWeight) +
                     (projectScore * projectWeight) +
                     (participationScore * participationWeight);

  // Determine letter grade
  String letterGrade;
  String gradeEmoji;

  if (finalGrade >= 97) {
    letterGrade = 'A+';
    gradeEmoji = '🌟';
  } else if (finalGrade >= 93) {
    letterGrade = 'A';
    gradeEmoji = '🏆';
  } else if (finalGrade >= 90) {
    letterGrade = 'A-';
    gradeEmoji = '⭐';
  } else if (finalGrade >= 87) {
    letterGrade = 'B+';
    gradeEmoji = '👍';
  } else if (finalGrade >= 83) {
    letterGrade = 'B';
    gradeEmoji = '😊';
  } else {
    letterGrade = 'B-';
    gradeEmoji = '📚';
  }

  // Display grade report
  print('📊 GRADE REPORT');
  print('═' * 40);
  print('👤 Student: $studentName ($studentId)');
  print('📖 Course: $course');
  print('📅 Semester: $semester');
  print('🎖️ Honors Student: ${isHonorsStudent ? "Yes" : "No"}');

  print('\n📋 ASSIGNMENT SCORES:');
  print('📝 Homework Average: ${homeworkAverage.toStringAsFixed(1)}%');
  print('   • HW1: $homework1%');
  print('   • HW2: $homework2%');
  print('   • HW3: $homework3%');
  print('📚 Midterm Exam: ${midtermExam.toStringAsFixed(1)}%');
  print('📚 Final Exam: ${finalExam.toStringAsFixed(1)}%');
  print('💻 Project: $projectScore%');
  print('🙋 Participation: ${participationScore.toStringAsFixed(1)}%');

  print('\n🎯 FINAL RESULTS:');
  print('Grade: ${finalGrade.toStringAsFixed(2)}% ($letterGrade) $gradeEmoji');

  if (isHonorsStudent && finalGrade >= 90) {
    print('🏅 Congratulations! You maintained honors status!');
  }
}
```

**Output:**

```
🎓 STUDENT GRADE CALCULATOR 🎓

📊 GRADE REPORT
════════════════════════════════════════
👤 Student: Emma Rodriguez (ST20241105)
📖 Course: Introduction to Computer Science
📅 Semester: 1
🎖️ Honors Student: Yes

📋 ASSIGNMENT SCORES:
📝 Homework Average: 91.3%
   • HW1: 95%
   • HW2: 87%
   • HW3: 92%
📚 Midterm Exam: 88.5%
📚 Final Exam: 91.0%
💻 Project: 96%
🙋 Participation: 94.5%

🎯 FINAL RESULTS:
Grade: 91.55% (A-) ⭐
🏅 Congratulations! You maintained honors status!
```

---

## 🏥 Hospital Patient Tracker

```dart
void main() {
  print('🏥 HOSPITAL PATIENT MANAGEMENT 🏥\n');

  // Patient information
  String patientName = 'John Anderson';
  int patientId = 12847;
  int age = 45;
  String bloodType = 'O+';
  double height = 5.9; // feet
  double weight = 180.5; // pounds
  bool hasAllergies = true;
  String allergies = 'Penicillin, Shellfish';
  String emergencyContact = 'Mary Anderson - (555) 123-4567';

  // Medical status
  bool isInpatient = true;
  String roomNumber = '302A';
  String attendingDoctor = 'Dr. Sarah Mitchell';
  double temperature = 98.6; // Fahrenheit
  int heartRate = 72; // beats per minute
  String bloodPressure = '120/80';
  bool needsMedication = true;
  String currentMedication = 'Ibuprofen 400mg';

  // Calculate BMI
  double heightInInches = height * 12;
  double bmi = (weight / (heightInInches * heightInInches)) * 703;

  // Display patient information
  print('👤 PATIENT INFORMATION');
  print('═' * 45);
  print('🏷️ Name: $patientName (ID: $patientId)');
  print('🎂 Age: $age years old');
  print('🩸 Blood Type: $bloodType');
  print('📏 Height: $height feet');
  print('⚖️ Weight: $weight lbs');
  print('📊 BMI: ${bmi.toStringAsFixed(1)} ${getBMICategory(bmi)}');

  print('\n⚠️ ALLERGIES:');
  if (hasAllergies) {
    print('🚨 YES: $allergies');
  } else {
    print('✅ No known allergies');
  }

  print('\n📞 EMERGENCY CONTACT:');
  print('👥 $emergencyContact');

  print('\n🏥 CURRENT STATUS:');
  print('🛏️ Patient Type: ${isInpatient ? "Inpatient" : "Outpatient"}');
  if (isInpatient) {
    print('🏠 Room: $roomNumber');
  }
  print('👨‍⚕️ Doctor: $attendingDoctor');

  print('\n🩺 VITAL SIGNS:');
  print('🌡️ Temperature: ${temperature}°F ${getTemperatureStatus(temperature)}');
  print('❤️ Heart Rate: $heartRate bpm ${getHeartRateStatus(heartRate)}');
  print('🩸 Blood Pressure: $bloodPressure ${getBPStatus(bloodPressure)}');

  print('\n💊 MEDICATION:');
  if (needsMedication) {
    print('💉 Current: $currentMedication');
  } else {
    print('✅ No medications needed');
  }
}

String getBMICategory(double bmi) {
  if (bmi < 18.5) return '(Underweight)';
  if (bmi < 25.0) return '(Normal)';
  if (bmi < 30.0) return '(Overweight)';
  return '(Obese)';
}

String getTemperatureStatus(double temp) {
  if (temp < 97.0) return '🔵 (Low)';
  if (temp > 99.5) return '🔴 (Fever)';
  return '🟢 (Normal)';
}

String getHeartRateStatus(int hr) {
  if (hr < 60) return '🔵 (Low)';
  if (hr > 100) return '🔴 (High)';
  return '🟢 (Normal)';
}

String getBPStatus(String bp) {
  return '🟢 (Normal)'; // Simplified for example
}
```

---

## 📦 Different Types of Treasure Chests (Data Types)

### 🔢 Number Chests

```dart
void main() {
  print('🔢 NUMBER TREASURE CHESTS 🔢\n');

  // Whole number chest (int)
  int dragonEggs = 12;
  int playerAge = 16;
  int scorePoints = 9850;

  // Decimal number chest (double)
  double magicPower = 47.8;
  double coinWeight = 0.25; // ounces
  double spellAccuracy = 89.7; // percentage

  print('📦 Whole Number Chests (int):');
  print('   🥚 Dragon eggs: $dragonEggs');
  print('   👤 Player age: $playerAge years');
  print('   🎯 Score: $scorePoints points');

  print('\n📦 Decimal Number Chests (double):');
  print('   ⚡ Magic power: $magicPower units');
  print('   🪙 Coin weight: $coinWeight ounces');
  print('   🎯 Spell accuracy: $spellAccuracy%');

  print('\n🧮 NUMBER OPERATIONS:');
  print('   Total eggs after finding 5 more: ${dragonEggs + 5}');
  print('   Power boost (double it): ${magicPower * 2}');
  print('   Years until adult: ${18 - playerAge}');
}
```

### 🔤 Text Chests (String)

```dart
void main() {
  print('🔤 TEXT TREASURE CHESTS 🔤\n');

  String heroName = 'Sir Brave-a-Lot';
  String magicSpell = 'Alakazam!';
  String questLocation = 'Whispering Woods';
  String treasure = 'Golden Crown of Wisdom';
  String villainTaunt = "You'll never catch me!";

  print('📦 Text Chests (String):');
  print('   🦸 Hero name: "$heroName"');
  print('   🪄 Magic spell: "$magicSpell"');
  print('   📍 Quest location: "$questLocation"');
  print('   👑 Treasure: "$treasure"');
  print('   😈 Villain says: $villainTaunt');

  print('\n✨ TEXT MAGIC:');
  print('   📏 Hero name length: ${heroName.length} characters');
  print('   📣 Loud spell: ${magicSpell.toUpperCase()}');
  print('   🔍 Quest contains "Wood": ${questLocation.contains("Wood")}');
  print('   🎭 Hero introduction: "Greetings! I am $heroName!"');
}
```

### ✅ True/False Chests (bool)

```dart
void main() {
  print('✅ TRUE/FALSE TREASURE CHESTS ✅\n');

  bool dragonIsAsleep = true;
  bool hasKey = false;
  bool inventoryFull = true;
  bool isRaining = false;
  bool foundTreasure = true;

  print('📦 Boolean Chests (bool):');
  print('   🐉 Dragon sleeping: $dragonIsAsleep');
  print('   🗝️ Has key: $hasKey');
  print('   🎒 Inventory full: $inventoryFull');
  print('   🌧️ Raining: $isRaining');
  print('   💎 Found treasure: $foundTreasure');

  print('\n🎯 ADVENTURE STATUS:');
  if (dragonIsAsleep && hasKey) {
    print('   ✅ Perfect time to enter the castle!');
  } else if (dragonIsAsleep && !hasKey) {
    print('   🔍 Dragon is asleep, but find the key first!');
  } else if (!dragonIsAsleep) {
    print('   ⚠️ Wait for the dragon to sleep!');
  }

  if (inventoryFull) {
    print('   🎒 Need to sell items before collecting more!');
  }

  if (foundTreasure) {
    print('   🎉 Quest successful! Time to celebrate!');
  }
}
```

---

## 🎪 Variable Operations & Fun

### Changing Variable Values

```dart
void main() {
  print('🎪 VARIABLE MAGIC SHOW 🎪\n');

  // Start with initial values
  int magicPoints = 10;
  String wizardName = 'Gandalf';
  bool hasWand = false;

  print('🎭 ACT 1: The Beginning');
  print('   ⚡ Magic points: $magicPoints');
  print('   🧙 Wizard name: $wizardName');
  print('   🪄 Has wand: $hasWand');

  // Change the values (the magic happens!)
  magicPoints = magicPoints + 25; // Gained experience!
  wizardName = 'Gandalf the Great';
  hasWand = true; // Found a wand!

  print('\n🎭 ACT 2: The Transformation');
  print('   ⚡ Magic points: $magicPoints (+25 for defeating goblin!)');
  print('   🧙 Wizard name: $wizardName (earned new title!)');
  print('   🪄 Has wand: $hasWand (found in treasure chest!)');

  // More magic!
  magicPoints *= 2; // Double points for epic spell!

  print('\n🎭 FINALE: The Epic Spell');
  print('   ⚡ Magic points: $magicPoints (doubled for epic magic!)');
  print('   🎆 $wizardName casts ultimate spell with wand!');
}
```

### Using `var` - Let Dart Guess!

```dart
void main() {
  print('🔮 DART\'S GUESSING GAME 🔮\n');

  // Let Dart guess the types!
  var studentName = 'Maya Chen'; // Dart guesses: String
  var testScore = 94;           // Dart guesses: int
  var hasGoodGrades = true;     // Dart guesses: bool
  var gpa = 3.8;               // Dart guesses: double

  print('🎯 DART\'S AMAZING GUESSES:');
  print('   Student: $studentName (Dart knew this was text!)');
  print('   Score: $testScore (Dart knew this was a whole number!)');
  print('   Good grades: $hasGoodGrades (Dart knew this was true/false!)');
  print('   GPA: $gpa (Dart knew this was a decimal!)');

  print('\n🧠 How did Dart know?');
  print('   📝 Quotes around text = String');
  print('   🔢 Whole number = int');
  print('   ✅ true/false = bool');
  print('   📊 Number with dot = double');

  // You can still change var variables!
  studentName = 'Maya Chen - Honor Roll Student';
  testScore = testScore + 3; // Extra credit!

  print('\n⭐ AFTER UPDATES:');
  print('   Student: $studentName');
  print('   New score: $testScore');
}
```

---

## 📚 Variable Rules and Best Practices

### Good Variable Names vs Bad Names

```dart
void main() {
  print('📚 VARIABLE NAMING GUIDE 📚\n');

  // ❌ BAD variable names
  print('❌ BAD EXAMPLES:');
  var x = 25;           // What is x?
  var thing = 'John';   // What kind of thing?
  var n = true;         // What does n mean?
  var a1b2c3 = 42;      // Confusing numbers and letters!

  print('   x = $x (What is x supposed to be?)');
  print('   thing = "$thing" (What kind of thing?)');
  print('   n = $n (What does n represent?)');
  print('   a1b2c3 = $a1b2c3 (This makes no sense!)');

  // ✅ GOOD variable names
  print('\n✅ GOOD EXAMPLES:');
  var playerAge = 25;
  var playerName = 'John';
  var gameIsStarted = true;
  var maxLevelScore = 42;

  print('   playerAge = $playerAge (Clear what this means!)');
  print('   playerName = "$playerName" (Obviously a name!)');
  print('   gameIsStarted = $gameIsStarted (Shows game status!)');
  print('   maxLevelScore = $maxLevelScore (High score!)');

  print('\n🎯 NAMING RULES:');
  print('   ✅ Use clear, descriptive names');
  print('   ✅ Use camelCase (firstName, not first_name)');
  print('   ✅ Start with lowercase letter');
  print('   ✅ Use meaningful words');
  print('   ❌ Don\'t use confusing abbreviations');
  print('   ❌ Don\'t start with numbers');
}
```

---

## 🧠 Quick Reference Guide

### Variable Declaration Patterns

| Pattern               | Example                      | When to Use                                   |
| --------------------- | ---------------------------- | --------------------------------------------- |
| **Explicit Type**     | `int age = 25;`              | When you want to be very clear about the type |
| **var (Auto-detect)** | `var name = 'Alice';`        | When the type is obvious from the value       |
| **Dynamic**           | `dynamic data = 'anything';` | When the type might change (rarely used)      |

### Data Types Summary

| Type     | What It Stores  | Examples              | Default Value |
| -------- | --------------- | --------------------- | ------------- |
| `int`    | Whole numbers   | `42`, `-7`, `0`       | `0`           |
| `double` | Decimal numbers | `3.14`, `-2.5`, `0.0` | `0.0`         |
| `String` | Text            | `'Hello'`, `"World"`  | `''` (empty)  |
| `bool`   | True/False      | `true`, `false`       | `false`       |

---

## 🎯 Common Mistakes to Avoid

### Variable Declaration Errors

```dart
void main() {
  print('⚠️ COMMON MISTAKES TO AVOID ⚠️\n');

  // ❌ These would cause errors:
  // int age = 'twenty';        // Can't put text in number box!
  // String name = 42;          // Can't put number in text box!
  // bool isReady = 'yes';      // Can't put text in true/false box!
  // var;                       // Missing name and value!
  // 2cool = 'awesome';         // Can't start name with number!

  // ✅ Correct ways:
  int age = 20;              // Number goes in number box ✅
  String name = 'Alex';      // Text goes in text box ✅
  bool isReady = true;       // true/false goes in bool box ✅
  var coolThing = 'awesome'; // Name starts with letter ✅

  print('✅ All variables created successfully!');
  print('   Age: $age');
  print('   Name: "$name"');
  print('   Ready: $isReady');
  print('   Cool thing: "$coolThing"');
}
```

---

## 🚀 Practice Challenges

Try creating variables for these scenarios:

1. **🏪 Store Inventory**: Item name, price, quantity in stock, on sale (yes/no)
2. **👤 User Profile**: Username, email, age, premium member (yes/no)
3. **🌦️ Weather App**: City name, temperature, humidity, is raining (yes/no)
4. **📚 Library System**: Book title, author, pages, available (yes/no)
5. **🎵 Music Player**: Song title, artist, duration, is playing (yes/no)

---

## 🎉 Remember This!

Variables are like **smart labeled containers** in your magical workshop 🏭:

- **🏷️ Labels** (names) help you find things quickly
- **📦 Different containers** for different types of treasures
- **🔄 Contents can change** when you need them to
- **🧠 Dart helps** by guessing the container type for you
- **✨ Clear names** make your magic spells (code) easy to understand

**The Magic**: Instead of remembering everything in your head, you can store important information in named containers and use them whenever you need them!

> **Think of it like**: "I have a treasure chest labeled 'Gold Coins' with 50 coins inside. Whenever I need to know how many coins I have, I just check my 'Gold Coins' chest!" 💰✨

Variables make your code **organized**, **easy to change**, and **easy to understand**! 🎪🚀

**Pro Tip**: Always give your variables **clear, descriptive names** - future you will thank you! 🎯
