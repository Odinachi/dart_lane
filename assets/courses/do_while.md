# Do-While Loops in Dart

Imagine you're at a **candy store** 🍭✨ and you want to try different candies!

You say to yourself:

> "I'll try at least ONE candy, and then I'll decide if I want more!"

So you:

1. **🍬 Try a candy first** (you always do this at least once)
2. **🤔 Check if you want more** (then decide whether to continue)
3. **🔄 Repeat if you're still hungry** (keep going if the condition is true)

👉 A **do-while loop** works exactly like this candy tasting adventure:

> It **DOES** something first, **THEN** checks **WHILE** the condition is true!

---

## 🔄 Regular While vs Do-While

### Regular While Loop (Check First, Then Do)

```dart
void main() {
  int candies = 0;

  while (candies > 0) {  // Check condition FIRST
    print('🍬 Eating candy #$candies');
    candies--;
  }

  print('Result: No candies eaten because we had 0 to start!');
}
```

**Output:**

```
Result: No candies eaten because we had 0 to start!
```

### Do-While Loop (Do First, Then Check)

```dart
void main() {
  int candies = 0;

  do {
    candies++;
    print('🍬 Trying candy #$candies - it\'s delicious!');
  } while (candies < 3);  // Check condition AFTER doing

  print('🎉 Finished trying candies!');
}
```

**Output:**

```
🍬 Trying candy #1 - it's delicious!
🍬 Trying candy #2 - it's delicious!
🍬 Trying candy #3 - it's delicious!
🎉 Finished trying candies!
```

**The Magic**: Do-while **always runs at least once**, even if the condition is false from the start!

---

## 🎮 Gaming Example: Player Lives

```dart
void main() {
  print('🎮 ARCADE ADVENTURE GAME 🎮\n');

  int lives = 3;
  int level = 1;

  do {
    print('💖 Starting level $level with $lives lives');
    print('🏃 Running through obstacles...');
    print('⚔️ Fighting the boss...');

    // Simulate random outcome
    bool levelCompleted = (DateTime.now().millisecond % 3) != 0;

    if (levelCompleted) {
      print('✅ Level $level completed!');
      level++;
      print('🎊 Moving to level $level!');
    } else {
      lives--;
      print('💀 Oops! Lost a life. Lives remaining: $lives');
      if (lives > 0) {
        print('🔄 Trying level $level again...');
      }
    }
    print('');

  } while (lives > 0 && level <= 5);

  if (lives == 0) {
    print('💔 Game Over! You ran out of lives.');
  } else {
    print('🏆 Congratulations! You completed all levels!');
  }
}
```

**Sample Output:**

```
🎮 ARCADE ADVENTURE GAME 🎮

💖 Starting level 1 with 3 lives
🏃 Running through obstacles...
⚔️ Fighting the boss...
✅ Level 1 completed!
🎊 Moving to level 2!

💖 Starting level 2 with 3 lives
🏃 Running through obstacles...
⚔️ Fighting the boss...
💀 Oops! Lost a life. Lives remaining: 2
🔄 Trying level 2 again...

💖 Starting level 2 with 2 lives
🏃 Running through obstacles...
⚔️ Fighting the boss...
✅ Level 2 completed!
🎊 Moving to level 3!

🏆 Congratulations! You completed all levels!
```

---

## 🛒 Shopping Adventure

```dart
void main() {
  print('🛍️ SHOPPING MALL ADVENTURE 🛍️\n');

  double money = 100.0;
  int itemsBought = 0;
  List<String> shoppingCart = [];

  List<Map<String, dynamic>> items = [
    {'name': 'Cool T-Shirt', 'price': 25.99, 'emoji': '👕'},
    {'name': 'Sneakers', 'price': 79.99, 'emoji': '👟'},
    {'name': 'Backpack', 'price': 45.50, 'emoji': '🎒'},
    {'name': 'Sunglasses', 'price': 19.99, 'emoji': '🕶️'},
    {'name': 'Watch', 'price': 89.95, 'emoji': '⌚'},
  ];

  do {
    print('💰 Current money: \$${money.toStringAsFixed(2)}');
    print('🛒 Items in cart: ${shoppingCart.length}');
    print('');

    if (itemsBought < items.length) {
      var currentItem = items[itemsBought];
      String itemName = currentItem['name'];
      double itemPrice = currentItem['price'];
      String emoji = currentItem['emoji'];

      print('👀 Looking at: $emoji $itemName - \$${itemPrice.toStringAsFixed(2)}');

      if (money >= itemPrice) {
        money -= itemPrice;
        shoppingCart.add('$emoji $itemName');
        print('✅ Bought $itemName! Added to cart 🛒');
        print('💸 Spent \$${itemPrice.toStringAsFixed(2)}');
      } else {
        print('💸 Not enough money for $itemName');
        print('💔 Moving on to the next item...');
      }

      itemsBought++;
    } else {
      print('🏪 Visited all the stores!');
      break;
    }

    print('');

  } while (money > 0 && itemsBought < items.length);

  print('🎉 SHOPPING COMPLETE! 🎉');
  print('💰 Money left: \$${money.toStringAsFixed(2)}');
  print('🛍️ Items purchased:');

  if (shoppingCart.isEmpty) {
    print('   (No items purchased)');
  } else {
    for (int i = 0; i < shoppingCart.length; i++) {
      print('   ${i + 1}. ${shoppingCart[i]}');
    }
  }
}
```

**Output:**

```
🛍️ SHOPPING MALL ADVENTURE 🛍️

💰 Current money: $100.00
🛒 Items in cart: 0

👀 Looking at: 👕 Cool T-Shirt - $25.99
✅ Bought Cool T-Shirt! Added to cart 🛒
💸 Spent $25.99

💰 Current money: $74.01
🛒 Items in cart: 1

👀 Looking at: 👟 Sneakers - $79.99
💸 Not enough money for Sneakers
💔 Moving on to the next item...

💰 Current money: $74.01
🛒 Items in cart: 1

👀 Looking at: 🎒 Backpack - $45.50
✅ Bought Backpack! Added to cart 🛒
💸 Spent $45.50

💰 Current money: $28.51
🛒 Items in cart: 2

👀 Looking at: 🕶️ Sunglasses - $19.99
✅ Bought Sunglasses! Added to cart 🛒
💸 Spent $19.99

💰 Current money: $8.52
🛒 Items in cart: 3

👀 Looking at: ⌚ Watch - $89.95
💸 Not enough money for Watch
💔 Moving on to the next item...

🎉 SHOPPING COMPLETE! 🎉
💰 Money left: $8.52
🛍️ Items purchased:
   1. 👕 Cool T-Shirt
   2. 🎒 Backpack
   3. 🕶️ Sunglasses
```

---

## 🍕 Pizza Making Competition

```dart
void main() {
  print('🍕 PIZZA MAKING CHAMPIONSHIP 🍕\n');

  String playerName = 'Chef Mario';
  int pizzasMade = 0;
  int timeRemaining = 5; // 5 rounds
  int score = 0;

  print('👨‍🍳 Welcome $playerName to the Pizza Championship!');
  print('🎯 Goal: Make as many pizzas as possible!');
  print('⏰ You have $timeRemaining rounds!\n');

  do {
    pizzasMade++;
    print('🍕 === ROUND $pizzasMade ===');
    print('👨‍🍳 $playerName is making pizza #$pizzasMade...');

    // Simulate pizza making steps
    List<String> steps = [
      '🫓 Rolling the dough...',
      '🍅 Adding tomato sauce...',
      '🧀 Sprinkling cheese...',
      '🍄 Adding toppings...',
      '🔥 Baking in the oven...'
    ];

    for (String step in steps) {
      print('   $step');
    }

    // Random pizza quality
    int quality = (DateTime.now().microsecond % 3) + 1;
    int points = 0;
    String quality_emoji = '';

    switch (quality) {
      case 1:
        points = 5;
        quality_emoji = '🙂';
        print('✅ Pizza completed! Quality: Good $quality_emoji (+$points points)');
        break;
      case 2:
        points = 8;
        quality_emoji = '😊';
        print('✅ Pizza completed! Quality: Great $quality_emoji (+$points points)');
        break;
      case 3:
        points = 10;
        quality_emoji = '🤩';
        print('✅ Pizza completed! Quality: Perfect! $quality_emoji (+$points points)');
        break;
    }

    score += points;
    timeRemaining--;

    print('📊 Current score: $score points');
    print('⏰ Rounds remaining: $timeRemaining');
    print('');

  } while (timeRemaining > 0);

  print('🏁 CHAMPIONSHIP COMPLETE! 🏁');
  print('👨‍🍳 $playerName\'s Final Results:');
  print('🍕 Pizzas made: $pizzasMade');
  print('🏆 Final score: $score points');

  if (score >= 40) {
    print('🥇 GOLD MEDAL! Amazing performance!');
  } else if (score >= 30) {
    print('🥈 SILVER MEDAL! Great job!');
  } else if (score >= 20) {
    print('🥉 BRONZE MEDAL! Nice work!');
  } else {
    print('🍕 Keep practicing, you\'ll get better!');
  }
}
```

**Output:**

```
🍕 PIZZA MAKING CHAMPIONSHIP 🍕

👨‍🍳 Welcome Chef Mario to the Pizza Championship!
🎯 Goal: Make as many pizzas as possible!
⏰ You have 5 rounds!

🍕 === ROUND 1 ===
👨‍🍳 Chef Mario is making pizza #1...
   🫓 Rolling the dough...
   🍅 Adding tomato sauce...
   🧀 Sprinkling cheese...
   🍄 Adding toppings...
   🔥 Baking in the oven...
✅ Pizza completed! Quality: Perfect! 🤩 (+10 points)
📊 Current score: 10 points
⏰ Rounds remaining: 4

🍕 === ROUND 2 ===
👨‍🍳 Chef Mario is making pizza #2...
   🫓 Rolling the dough...
   🍅 Adding tomato sauce...
   🧀 Sprinkling cheese...
   🍄 Adding toppings...
   🔥 Baking in the oven...
✅ Pizza completed! Quality: Great 😊 (+8 points)
📊 Current score: 18 points
⏰ Rounds remaining: 3

🍕 === ROUND 3 ===
👨‍🍳 Chef Mario is making pizza #3...
   🫓 Rolling the dough...
   🍅 Adding tomato sauce...
   🧀 Sprinkling cheese...
   🍄 Adding toppings...
   🔥 Baking in the oven...
✅ Pizza completed! Quality: Good 🙂 (+5 points)
📊 Current score: 23 points
⏰ Rounds remaining: 2

🍕 === ROUND 4 ===
👨‍🍳 Chef Mario is making pizza #4...
   🫓 Rolling the dough...
   🍅 Adding tomato sauce...
   🧀 Sprinkling cheese...
   🍄 Adding toppings...
   🔥 Baking in the oven...
✅ Pizza completed! Quality: Great 😊 (+8 points)
📊 Current score: 31 points
⏰ Rounds remaining: 1

🍕 === ROUND 5 ===
👨‍🍳 Chef Mario is making pizza #5...
   🫓 Rolling the dough...
   🍅 Adding tomato sauce...
   🧀 Sprinkling cheese...
   🍄 Adding toppings...
   🔥 Baking in the oven...
✅ Pizza completed! Quality: Perfect! 🤩 (+10 points)
📊 Current score: 41 points
⏰ Rounds remaining: 0

🏁 CHAMPIONSHIP COMPLETE! 🏁
👨‍🍳 Chef Mario's Final Results:
🍕 Pizzas made: 5
🏆 Final score: 41 points
🥇 GOLD MEDAL! Amazing performance!
```

---

## 📱 User Menu System

```dart
void main() {
  print('📱 SMART PHONE SIMULATOR 📱\n');

  bool keepRunning = true;
  String currentUser = 'Alex';
  int batteryLevel = 85;

  do {
    print('📱 === PHONE MENU ===');
    print('👤 User: $currentUser');
    print('🔋 Battery: $batteryLevel%');
    print('');
    print('📋 Choose an option:');
    print('   1️⃣ Check Messages');
    print('   2️⃣ Play Music');
    print('   3️⃣ Take Photo');
    print('   4️⃣ Check Weather');
    print('   5️⃣ Power Off');
    print('');

    // Simulate user choice (random for demo)
    int userChoice = (DateTime.now().microsecond % 5) + 1;
    print('👆 You selected option $userChoice\n');

    switch (userChoice) {
      case 1:
        print('💬 CHECKING MESSAGES');
        print('📨 New message from Mom: "Don\'t forget lunch!"');
        print('📨 New message from Jake: "Want to play soccer?"');
        batteryLevel -= 2;
        break;

      case 2:
        print('🎵 PLAYING MUSIC');
        print('🎶 Now playing: "Happy Song" by The Cheerful Band');
        print('🔊 Volume: 75%');
        batteryLevel -= 5;
        break;

      case 3:
        print('📸 CAMERA MODE');
        print('📷 *Click* Photo taken!');
        print('🖼️ Saved to gallery: sunset_photo_001.jpg');
        batteryLevel -= 3;
        break;

      case 4:
        print('🌤️ WEATHER CHECK');
        print('☀️ Today: Sunny, 75°F');
        print('🌡️ Tomorrow: Partly cloudy, 72°F');
        batteryLevel -= 1;
        break;

      case 5:
        print('📴 POWERING OFF');
        print('💾 Saving data...');
        print('👋 Goodbye, $currentUser!');
        keepRunning = false;
        break;
    }

    if (keepRunning) {
      print('🔋 Battery remaining: $batteryLevel%');

      if (batteryLevel <= 10) {
        print('⚠️ LOW BATTERY WARNING!');
        print('🔌 Please charge your phone soon.');
        keepRunning = false;
      }

      print('\n⏳ Loading next menu...\n');
    }

  } while (keepRunning);

  print('\n📱 Phone session ended.');
}
```

---

## 🎲 Dice Rolling Game

```dart
void main() {
  print('🎲 LUCKY DICE GAME 🎲\n');

  String playerName = 'Lucky Luke';
  int totalScore = 0;
  int rollCount = 0;
  bool keepPlaying = true;

  print('🎯 Goal: Roll dice until you get three 6s or decide to stop!');
  print('👤 Player: $playerName');
  print('🏁 Let\'s start rolling!\n');

  do {
    rollCount++;
    print('🎲 === ROLL #$rollCount ===');

    // Simulate rolling 3 dice
    int dice1 = (DateTime.now().microsecond % 6) + 1;
    int dice2 = ((DateTime.now().microsecond * 7) % 6) + 1;
    int dice3 = ((DateTime.now().microsecond * 13) % 6) + 1;

    print('🎲 Rolling dice...');
    print('   Dice 1: $dice1');
    print('   Dice 2: $dice2');
    print('   Dice 3: $dice3');

    int rollTotal = dice1 + dice2 + dice3;
    totalScore += rollTotal;

    print('📊 This roll: $rollTotal points');
    print('🏆 Total score: $totalScore points');

    // Check for special combinations
    if (dice1 == 6 && dice2 == 6 && dice3 == 6) {
      print('🎊 TRIPLE SIX! JACKPOT! 🎊');
      print('🏆 Bonus: +50 points!');
      totalScore += 50;
      keepPlaying = false;
    } else if (dice1 == dice2 && dice2 == dice3) {
      print('✨ Triple match! Bonus: +10 points!');
      totalScore += 10;
    } else if ((dice1 == dice2) || (dice2 == dice3) || (dice1 == dice3)) {
      print('👯 Pair found! Bonus: +5 points!');
      totalScore += 5;
    }

    // Simulate decision to continue (random for demo)
    if (keepPlaying && rollCount < 10) {
      bool wantsToContinue = (DateTime.now().microsecond % 3) != 0;
      if (wantsToContinue) {
        print('🔄 $playerName decides to roll again!');
      } else {
        print('🛑 $playerName decides to stop here.');
        keepPlaying = false;
      }
    } else if (rollCount >= 10) {
      print('🔚 Maximum rolls reached!');
      keepPlaying = false;
    }

    print('');

  } while (keepPlaying);

  print('🎮 GAME OVER! 🎮');
  print('👤 Player: $playerName');
  print('🎲 Total rolls: $rollCount');
  print('🏆 Final score: $totalScore points');

  if (totalScore >= 150) {
    print('🥇 LEGENDARY! You\'re a dice master!');
  } else if (totalScore >= 100) {
    print('🥈 EXCELLENT! Great rolling skills!');
  } else if (totalScore >= 50) {
    print('🥉 GOOD! Nice job!');
  } else {
    print('🎲 Keep practicing your dice rolling!');
  }
}
```

---

## 🧠 Key Differences: While vs Do-While

### Visual Comparison

```dart
void demonstrateLoopDifference() {
  print('🔍 LOOP COMPARISON DEMO 🔍\n');

  // While loop example
  print('📋 WHILE LOOP (Check first, then do):');
  int whileCounter = 5;
  while (whileCounter < 3) {  // This condition is false from start
    print('   This will never print');
    whileCounter++;
  }
  print('   While loop: Ran 0 times\n');

  // Do-while loop example
  print('📋 DO-WHILE LOOP (Do first, then check):');
  int doWhileCounter = 5;
  do {
    print('   This prints at least once!');
    doWhileCounter++;
  } while (doWhileCounter < 3);  // Same false condition
  print('   Do-while loop: Ran 1 time\n');

  print('🎯 KEY DIFFERENCE: Do-while ALWAYS runs at least once!');
}

void main() {
  demonstrateLoopDifference();
}
```

**Output:**

```
🔍 LOOP COMPARISON DEMO 🔍

📋 WHILE LOOP (Check first, then do):
   While loop: Ran 0 times

📋 DO-WHILE LOOP (Do first, then check):
   This prints at least once!
   Do-while loop: Ran 1 time

🎯 KEY DIFFERENCE: Do-while ALWAYS runs at least once!
```

---

## 📊 Quick Reference Guide

### Do-While Syntax

```dart
do {
  // Code that runs at least once
  // This executes BEFORE checking the condition
} while (condition);  // Check condition AFTER executing
```

### When to Use Do-While

| Scenario             | Why Do-While is Perfect         |
| -------------------- | ------------------------------- |
| **User Menus**       | Always show menu at least once  |
| **Game Rounds**      | Play at least one round         |
| **Input Validation** | Ask for input at least once     |
| **Try Again Logic**  | Attempt something at least once |

### Common Patterns

```dart
// Input validation pattern
String userInput;
do {
  print('Enter your name:');
  userInput = 'SomeInput'; // Simulated input
} while (userInput.isEmpty);

// Game loop pattern
bool playAgain;
do {
  playGame();
  playAgain = askToPlayAgain();
} while (playAgain);

// Menu system pattern
int choice;
do {
  displayMenu();
  choice = getUserChoice();
  processChoice(choice);
} while (choice != 0); // 0 = exit
```

---

## 🎯 When to Use Do-While

**✅ Perfect for:**

- **User interfaces** that need to show at least once
- **Game rounds** where you play at least one game
- **Input validation** where you ask at least once
- **Menus** that should appear before checking exit condition
- **"Try again" scenarios** where you attempt at least once

**❌ Not ideal for:**

- **Counting loops** where you might not want to run (use for loops)
- **Collection processing** where the collection might be empty
- **Conditional processing** where you might skip entirely

---

## 🚀 Practice Challenges

Try creating do-while loops for these scenarios:

1. **🏦 ATM Machine**: Show menu at least once, exit on choice
2. **🎵 Music Playlist**: Play at least one song, ask to continue
3. **🎯 Dart Game**: Throw at least one dart, continue until bullseye
4. **📝 Quiz Game**: Ask at least one question, continue until wrong
5. **🍔 Restaurant Order**: Show menu at least once, order until done

---

## 🎉 Remember This!

Do-while loops are like **trying a new restaurant** 🍽️:

- **🚪 You go in at least once** (do the action first)
- **🍽️ You try the food** (execute the code)
- **🤔 Then you decide** (check the while condition)
- **🔄 You might come back** (loop continues if condition is true)

**The Magic**: Even if you're not sure you'll like it, you **try it at least once** before deciding whether to return!

That's the power of do-while - **guaranteed first execution** with **conditional repetition**! 🎪✨
