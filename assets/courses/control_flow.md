# Control Flow in Dart

Imagine you're the **director of your own adventure movie** 🎬!

As the director, you need to make decisions:

- 🎭 "If the hero finds the treasure, celebrate!"
- 🔄 "Keep searching until you find all 5 gems"
- 🚪 "Choose different paths based on what door they pick"

**Control flow** is like being the director of your code - you tell Dart exactly what decisions to make and when to make them!

👉 **Control flow = The GPS of your program** 🗺️

> It decides which route to take based on the current situation!

---

## 🚦 Traffic Light Decision Making: `if` Statements

Think of `if` statements like **traffic lights** that control the flow of cars:

```dart
void main() {
  String lightColor = 'green';
  int speed = 0;

  print('🚗 Approaching traffic light...');
  print('🚦 Light is: $lightColor');

  if (lightColor == 'green') {
    speed = 30;
    print('✅ GO! Driving at ${speed}mph 🏎️');
  } else if (lightColor == 'yellow') {
    speed = 10;
    print('⚠️ SLOW DOWN! Reducing to ${speed}mph 🐌');
  } else if (lightColor == 'red') {
    speed = 0;
    print('🛑 STOP! Speed: ${speed}mph');
  } else {
    speed = 0;
    print('❓ Unknown signal! Better stop to be safe.');
  }

  print('📊 Current speed: ${speed}mph\n');
}
```

**Output:**

```
🚗 Approaching traffic light...
🚦 Light is: green
✅ GO! Driving at 30mph 🏎️
📊 Current speed: 30mph
```

---

## 🎮 Video Game Character System

Let's create a character system that reacts to different situations:

```dart
void checkCharacterStatus(String characterClass, int health, int mana) {
  print('🎮 CHARACTER STATUS CHECK');
  print('👤 Class: $characterClass');
  print('❤️ Health: $health/100');
  print('💙 Mana: $mana/100\n');

  // Health check
  if (health <= 0) {
    print('💀 GAME OVER! Your character has fallen!');
    return; // Exit early
  } else if (health < 20) {
    print('🩸 CRITICAL! Health is dangerously low!');
    print('💊 Find a health potion immediately!');
  } else if (health < 50) {
    print('⚠️ Warning: Health is getting low');
    print('🏥 Consider resting at an inn');
  } else {
    print('💪 Health looks good!');
  }

  // Mana check
  if (mana <= 0) {
    print('🚫 No mana left! Can\'t cast spells!');
  } else if (mana < 25) {
    print('⚡ Low mana! Save it for emergencies');
  } else {
    print('✨ Ready to cast powerful spells!');
  }

  // Class-specific abilities
  if (characterClass == 'Wizard') {
    if (mana >= 50) {
      print('🔮 You can cast Fireball!');
    } else {
      print('🔮 Not enough mana for Fireball');
    }
  } else if (characterClass == 'Warrior') {
    if (health >= 70) {
      print('⚔️ You can use Berserker Rage!');
    } else {
      print('⚔️ Too wounded for Berserker Rage');
    }
  } else if (characterClass == 'Archer') {
    print('🏹 Bow and arrows are always ready!');
  }

  print(''); // Empty line for spacing
}

void main() {
  // Test different character scenarios
  checkCharacterStatus('Wizard', 80, 75);
  checkCharacterStatus('Warrior', 30, 20);
  checkCharacterStatus('Archer', 0, 50);
}
```

**Output:**

```
🎮 CHARACTER STATUS CHECK
👤 Class: Wizard
❤️ Health: 80/100
💙 Mana: 75/100

💪 Health looks good!
✨ Ready to cast powerful spells!
🔮 You can cast Fireball!

🎮 CHARACTER STATUS CHECK
👤 Class: Warrior
❤️ Health: 30/100
💙 Mana: 20/100

⚠️ Warning: Health is getting low
🏥 Consider resting at an inn
🚫 No mana left! Can't cast spells!
⚔️ Too wounded for Berserker Rage

🎮 CHARACTER STATUS CHECK
👤 Class: Archer
❤️ Health: 0/100
💙 Mana: 50/100

💀 GAME OVER! Your character has fallen!
```

---

## 🍕 Restaurant Order System

```dart
void processOrder(String item, bool isVegetarian, int quantity, double money) {
  print('🍽️ RESTAURANT ORDER SYSTEM');
  print('📝 Order: $quantity x $item');
  print('🥬 Vegetarian: ${isVegetarian ? "Yes" : "No"}');
  print('💰 Payment: \$${money}');
  print('');

  double itemPrice;
  bool isAvailable = true;

  // Determine price based on item
  if (item == 'pizza') {
    itemPrice = 12.99;
  } else if (item == 'burger') {
    itemPrice = 8.99;
    if (isVegetarian) {
      print('🌱 Switching to veggie burger!');
      itemPrice = 9.99;
    }
  } else if (item == 'salad') {
    itemPrice = 6.99;
  } else if (item == 'pasta') {
    itemPrice = 11.99;
  } else {
    print('❌ Sorry, we don\'t serve $item');
    isAvailable = false;
    itemPrice = 0;
  }

  if (isAvailable) {
    double totalCost = itemPrice * quantity;
    double tax = totalCost * 0.08; // 8% tax
    double finalTotal = totalCost + tax;

    print('💵 Item price: \$${itemPrice} each');
    print('📊 Subtotal: \$${totalCost.toStringAsFixed(2)}');
    print('📋 Tax (8%): \$${tax.toStringAsFixed(2)}');
    print('💳 Total: \$${finalTotal.toStringAsFixed(2)}');

    if (money >= finalTotal) {
      double change = money - finalTotal;
      print('✅ Payment accepted!');
      print('💰 Change: \$${change.toStringAsFixed(2)}');
      print('👨‍🍳 Order sent to kitchen!');

      // Estimate cooking time
      if (item == 'salad') {
        print('⏰ Ready in 5 minutes!');
      } else if (item == 'burger') {
        print('⏰ Ready in 8 minutes!');
      } else {
        print('⏰ Ready in 12 minutes!');
      }
    } else {
      double shortage = finalTotal - money;
      print('❌ Insufficient payment!');
      print('💸 You need \$${shortage.toStringAsFixed(2)} more');
    }
  }

  print('\n' + '─' * 40 + '\n');
}

void main() {
  processOrder('pizza', false, 2, 30.00);
  processOrder('burger', true, 1, 8.00);
  processOrder('tacos', false, 3, 20.00);
}
```

---

## 🔄 The Power of Loops: Repetitive Tasks

### 🎪 Circus Performance: `for` Loop

```dart
void circusShow() {
  print('🎪 WELCOME TO THE AMAZING CIRCUS!\n');

  // The trapeze artists perform 5 acts
  print('🤸‍♀️ TRAPEZE PERFORMANCE:');
  for (int act = 1; act <= 5; act++) {
    if (act == 1) {
      print('Act $act: 🤸‍♀️ Simple swing');
    } else if (act == 2) {
      print('Act $act: 🤸‍♀️ Single flip');
    } else if (act == 3) {
      print('Act $act: 🤸‍♀️ Double flip');
    } else if (act == 4) {
      print('Act $act: 🤸‍♀️ Triple flip');
    } else {
      print('Act $act: 🤸‍♀️ GRAND FINALE - Quadruple flip!');
    }

    // Audience reaction gets more excited
    if (act <= 2) {
      print('👏 *polite applause*');
    } else if (act <= 4) {
      print('👏 *enthusiastic clapping*');
    } else {
      print('👏 *thunderous applause and cheers!*');
    }
    print('');
  }

  // Lions jumping through hoops
  print('🦁 LION PERFORMANCE:');
  for (int hoop = 1; hoop <= 3; hoop++) {
    print('Hoop $hoop: 🦁 *ROAR* Lion jumps through ${hoop == 1 ? "small" : hoop == 2 ? "medium" : "large"} hoop!');
  }

  print('\n🎉 What an amazing show!');
}

void main() {
  circusShow();
}
```

**Output:**

```
🎪 WELCOME TO THE AMAZING CIRCUS!

🤸‍♀️ TRAPEZE PERFORMANCE:
Act 1: 🤸‍♀️ Simple swing
👏 *polite applause*

Act 2: 🤸‍♀️ Single flip
👏 *polite applause*

Act 3: 🤸‍♀️ Double flip
👏 *enthusiastic clapping*

Act 4: 🤸‍♀️ Triple flip
👏 *enthusiastic clapping*

Act 5: 🤸‍♀️ GRAND FINALE - Quadruple flip!
👏 *thunderous applause and cheers!*

🦁 LION PERFORMANCE:
Hoop 1: 🦁 *ROAR* Lion jumps through small hoop!
Hoop 2: 🦁 *ROAR* Lion jumps through medium hoop!
Hoop 3: 🦁 *ROAR* Lion jumps through large hoop!

🎉 What an amazing show!
```

---

## 🎲 Treasure Hunt: `while` Loop

```dart
void treasureHunt() {
  print('🗺️ TREASURE HUNT ADVENTURE!\n');

  int steps = 0;
  int treasuresFound = 0;
  int targetTreasures = 5;
  bool foundTrap = false;

  print('🎯 Goal: Find $targetTreasures treasures!');
  print('⚠️ Watch out for traps!\n');

  while (treasuresFound < targetTreasures && !foundTrap && steps < 20) {
    steps++;

    // Simulate random events (using step number for predictability)
    int randomEvent = steps % 4;

    print('Step $steps: 👣 Moving forward...');

    if (randomEvent == 0) {
      // Find treasure
      treasuresFound++;
      print('✨ TREASURE FOUND! 💎 (Total: $treasuresFound/$targetTreasures)');

      if (treasuresFound == 1) {
        print('🎉 First treasure! You\'re getting the hang of this!');
      } else if (treasuresFound == 3) {
        print('🔥 Halfway there! Keep going!');
      } else if (treasuresFound == targetTreasures) {
        print('👑 ALL TREASURES FOUND! You\'re the ultimate treasure hunter!');
      }

    } else if (randomEvent == 1) {
      // Find a clue
      print('📜 Found a clue: "X marks the spot, but not all spots have X"');

    } else if (randomEvent == 2 && steps > 10) {
      // Trap (only after step 10)
      foundTrap = true;
      print('🕳️ OH NO! You fell into a trap!');
      print('💀 Game Over! Better luck next time!');

    } else {
      // Empty space
      print('🌿 Just bushes and trees here...');
    }

    print('');
  }

  // Final results
  if (treasuresFound == targetTreasures) {
    print('🏆 VICTORY! You found all treasures in $steps steps!');
  } else if (foundTrap) {
    print('😵 Adventure ended by trap after $steps steps');
    print('💎 Treasures collected: $treasuresFound/$targetTreasures');
  } else if (steps >= 20) {
    print('⏰ Time\'s up! You took too many steps');
    print('💎 Treasures collected: $treasuresFound/$targetTreasures');
  }
}

void main() {
  treasureHunt();
}
```

---

## 📚 Student Grade Calculator

```dart
void calculateGrades(List<int> scores, String studentName) {
  print('📊 GRADE REPORT FOR $studentName');
  print('═' * 40);

  if (scores.isEmpty) {
    print('❌ No scores available!');
    return;
  }

  int totalScore = 0;
  int highestScore = 0;
  int lowestScore = 100;
  int passingGrades = 0;

  print('📝 Individual Scores:');

  for (int i = 0; i < scores.length; i++) {
    int score = scores[i];
    totalScore += score;

    // Track highest and lowest
    if (score > highestScore) highestScore = score;
    if (score < lowestScore) lowestScore = score;

    // Count passing grades
    if (score >= 60) passingGrades++;

    // Display score with grade
    String letterGrade;
    String emoji;

    if (score >= 90) {
      letterGrade = 'A';
      emoji = '🌟';
    } else if (score >= 80) {
      letterGrade = 'B';
      emoji = '👍';
    } else if (score >= 70) {
      letterGrade = 'C';
      emoji = '👌';
    } else if (score >= 60) {
      letterGrade = 'D';
      emoji = '😐';
    } else {
      letterGrade = 'F';
      emoji = '😟';
    }

    print('  Test ${i + 1}: $score% → $letterGrade $emoji');
  }

  // Calculate average
  double average = totalScore / scores.length;

  print('\n📈 SUMMARY STATISTICS:');
  print('  📊 Average Score: ${average.toStringAsFixed(1)}%');
  print('  🏆 Highest Score: $highestScore%');
  print('  📉 Lowest Score: $lowestScore%');
  print('  ✅ Passing Grades: $passingGrades/${scores.length}');

  // Overall performance
  print('\n🎯 OVERALL PERFORMANCE:');
  if (average >= 90) {
    print('  🌟 EXCELLENT! Outstanding work!');
  } else if (average >= 80) {
    print('  👍 GOOD! Keep up the great work!');
  } else if (average >= 70) {
    print('  👌 SATISFACTORY. Room for improvement.');
  } else if (average >= 60) {
    print('  😐 NEEDS IMPROVEMENT. Consider extra study time.');
  } else {
    print('  😟 UNSATISFACTORY. Please see teacher for help.');
  }

  // Recommendations
  if (highestScore - lowestScore > 30) {
    print('  💡 Tip: Your scores vary a lot. Try to be more consistent!');
  }

  if (passingGrades < scores.length) {
    int failingGrades = scores.length - passingGrades;
    print('  ⚠️ Warning: $failingGrades test(s) below passing grade');
  }

  print('\n' + '═' * 40 + '\n');
}

void main() {
  // Test with different students
  calculateGrades([95, 87, 92, 78, 88], 'Alice Johnson');
  calculateGrades([65, 45, 78, 52, 60], 'Bob Smith');
  calculateGrades([100, 98, 95, 97, 99], 'Charlie Brown');
  calculateGrades([], 'Diana Wilson'); // Empty scores
}
```

---

## 🎯 Advanced Control Flow: Switch Statements

Perfect for when you have many specific options:

```dart
void planetInformation(String planet) {
  print('🌌 SOLAR SYSTEM DATABASE');
  print('🔍 Looking up: $planet\n');

  switch (planet.toLowerCase()) {
    case 'mercury':
      print('☿️ MERCURY');
      print('🌡️ Closest to the Sun - Very hot!');
      print('⏰ Day length: 59 Earth days');
      print('🎯 Fun fact: No atmosphere!');
      break;

    case 'venus':
      print('♀️ VENUS');
      print('🔥 Hottest planet - 462°C!');
      print('⏰ Day length: 243 Earth days');
      print('🎯 Fun fact: Spins backwards!');
      break;

    case 'earth':
      print('🌍 EARTH');
      print('💙 Our beautiful home planet!');
      print('⏰ Day length: 24 hours');
      print('🎯 Fun fact: Only planet with life!');
      break;

    case 'mars':
      print('🔴 MARS');
      print('🏜️ The Red Planet!');
      print('⏰ Day length: 24.6 hours');
      print('🎯 Fun fact: Has the largest volcano in solar system!');
      break;

    case 'jupiter':
      print('🪐 JUPITER');
      print('⚡ Gas giant with Great Red Spot!');
      print('⏰ Day length: 9.9 hours');
      print('🎯 Fun fact: Has 95 moons!');
      break;

    case 'saturn':
      print('🪐 SATURN');
      print('💍 Famous for its beautiful rings!');
      print('⏰ Day length: 10.7 hours');
      print('🎯 Fun fact: Less dense than water!');
      break;

    case 'uranus':
      print('🟦 URANUS');
      print('❄️ Ice giant tilted on its side!');
      print('⏰ Day length: 17.2 hours');
      print('🎯 Fun fact: Rotates sideways!');
      break;

    case 'neptune':
      print('🔵 NEPTUNE');
      print('💨 Windiest planet - 2100 km/h winds!');
      print('⏰ Day length: 16.1 hours');
      print('🎯 Fun fact: Diamond rain might occur!');
      break;

    default:
      print('❓ Unknown celestial body: $planet');
      print('🤔 Are you sure that\'s a planet in our solar system?');
      print('💡 Try: Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune');
  }

  print('\n' + '─' * 50 + '\n');
}

void main() {
  planetInformation('Earth');
  planetInformation('Mars');
  planetInformation('Pluto'); // Not a planet anymore!
}
```

---

## 🧠 Control Flow Decision Tree

```
🎯 CONTROL FLOW DECISION GUIDE

Need to make a decision?
├── 🤔 Only 2-3 simple options?
│   └── ✅ Use if/else
│
├── 🎛️ Many specific exact matches?
│   └── ✅ Use switch/case
│
├── 🔄 Need to repeat something?
│   ├── 📊 Know exactly how many times?
│   │   └── ✅ Use for loop
│   └── ❓ Don't know when to stop?
│       └── ✅ Use while loop
│
└── 🎮 Complex game logic?
    └── ✅ Combine multiple types!
```

---

## 🚀 Practice Challenges

Try building these control flow systems:

1. **🏪 Vending Machine**: Different prices, change calculation, sold out items
2. **🎰 Slot Machine**: Random outcomes, different winning combinations
3. **📅 Calendar App**: Different months, leap years, weekday calculation
4. **🎮 RPG Battle System**: Turn-based combat with different character classes
5. **🌦️ Weather App**: Different conditions, seasonal recommendations

---

## 🎉 Remember This!

Control flow is like being the **conductor of an orchestra** 🎼:

- **🎵 if/else** = "Play forte if it's the climax, piano if it's gentle"
- **🔄 Loops** = "Repeat this beautiful melody 4 times"
- **🎛️ Switch** = "Violins play this part, cellos play that part"
- **🎯 Conditions** = "Only the trumpets play when we reach measure 42"

You're not just writing code - you're **composing the behavior** of your program, making it smart enough to handle any situation! 🎭✨

**Pro Tip**: Great programmers think like great storytellers - they plan for **every possible twist** in the story! 📚🚀
