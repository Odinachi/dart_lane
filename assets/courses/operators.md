# Operators in Dart

Imagine you're the **captain of a magical calculator spaceship** 🚀🧮!

Your spaceship has different **control buttons** that can:

- ➕ **Add** fuel tanks together
- ➖ **Remove** damaged parts
- ✖️ **Multiply** your speed boost
- ➗ **Split** treasure equally among crew
- 🔍 **Compare** distances to planets
- 🎯 **Make decisions** about which route to take

👉 **Operators** are exactly like those magical control buttons:

> They tell Dart **what action to perform** on your data - like a remote control for your code!

---

## 🧮 Arithmetic Operators: The Math Wizards

### Basic Math Operations

```dart
void main() {
  print('🧮 MAGICAL CALCULATOR SPACESHIP 🧮\n');

  // Fuel calculations
  int fuelTank1 = 150;
  int fuelTank2 = 200;
  int totalFuel = fuelTank1 + fuelTank2;

  print('⛽ Tank 1: $fuelTank1 units');
  print('⛽ Tank 2: $fuelTank2 units');
  print('🚀 Total fuel: $totalFuel units');

  // Distance traveled
  double speed = 25.5;
  double time = 4.0;
  double distance = speed * time;

  print('\n🌌 Journey Report:');
  print('⚡ Speed: $speed units/hour');
  print('⏰ Time: $time hours');
  print('📏 Distance traveled: $distance units');

  // Sharing treasure
  int treasureCoins = 1000;
  int crewMembers = 4;
  int coinsPerPerson = treasureCoins ~/ crewMembers; // Integer division
  int leftoverCoins = treasureCoins % crewMembers;   // Remainder

  print('\n💰 Treasure Distribution:');
  print('🪙 Total coins: $treasureCoins');
  print('👥 Crew members: $crewMembers');
  print('💎 Coins per person: $coinsPerPerson');
  print('🎁 Leftover coins: $leftoverCoins');
}
```

**Output:**

```
🧮 MAGICAL CALCULATOR SPACESHIP 🧮

⛽ Tank 1: 150 units
⛽ Tank 2: 200 units
🚀 Total fuel: 350 units

🌌 Journey Report:
⚡ Speed: 25.5 units/hour
⏰ Time: 4.0 hours
📏 Distance traveled: 102.0 units

💰 Treasure Distribution:
🪙 Total coins: 1000
👥 Crew members: 4
💎 Coins per person: 250
🎁 Leftover coins: 0
```

### All Arithmetic Operators

```dart
void main() {
  print('🎪 ARITHMETIC OPERATORS CIRCUS 🎪\n');

  int a = 17;
  int b = 5;

  print('🎭 Our magical numbers: a = $a, b = $b\n');

  print('➕ Addition: $a + $b = ${a + b}');
  print('➖ Subtraction: $a - $b = ${a - b}');
  print('✖️ Multiplication: $a * $b = ${a * b}');
  print('➗ Division: $a / $b = ${a / b}');
  print('🔢 Integer Division: $a ~/ $b = ${a ~/ b}');
  print('📦 Modulo (Remainder): $a % $b = ${a % b}');

  print('\n🎯 Special Cases:');
  print('🤖 Increment: a++ makes a become ${++a}');
  print('⬇️ Decrement: a-- makes a become ${--a}');
}
```

**Output:**

```
🎪 ARITHMETIC OPERATORS CIRCUS 🎪

🎭 Our magical numbers: a = 17, b = 5

➕ Addition: 17 + 5 = 22
➖ Subtraction: 17 - 5 = 12
✖️ Multiplication: 17 * 5 = 85
➗ Division: 17 / 5 = 3.4
🔢 Integer Division: 17 ~/ 5 = 3
📦 Modulo (Remainder): 17 % 5 = 2

🎯 Special Cases:
🤖 Increment: a++ makes a become 18
⬇️ Decrement: a-- makes a become 17
```

---

## 🔍 Comparison Operators: The Decision Makers

```dart
void main() {
  print('⚖️ SPACE TRAFFIC CONTROL ⚖️\n');

  int spaceshipSpeed = 75;
  int speedLimit = 60;
  int minimumSpeed = 30;

  print('🚀 Spaceship speed: $spaceshipSpeed mph');
  print('🚦 Speed limit: $speedLimit mph');
  print('🐌 Minimum speed: $minimumSpeed mph\n');

  // Comparison checks
  print('🔍 SPEED ANALYSIS:');
  print('Is speeding? ${spaceshipSpeed > speedLimit}');
  print('Within limit? ${spaceshipSpeed <= speedLimit}');
  print('Too slow? ${spaceshipSpeed < minimumSpeed}');
  print('Exactly at limit? ${spaceshipSpeed == speedLimit}');
  print('Different from limit? ${spaceshipSpeed != speedLimit}');
  print('Fast enough? ${spaceshipSpeed >= minimumSpeed}');

  // Traffic decision
  print('\n🚨 TRAFFIC CONTROL DECISION:');
  if (spaceshipSpeed > speedLimit) {
    print('⚠️ SLOW DOWN! You are speeding!');
  } else if (spaceshipSpeed < minimumSpeed) {
    print('📢 SPEED UP! You are too slow!');
  } else {
    print('✅ Perfect speed! Safe travels!');
  }
}
```

**Output:**

```
⚖️ SPACE TRAFFIC CONTROL ⚖️

🚀 Spaceship speed: 75 mph
🚦 Speed limit: 60 mph
🐌 Minimum speed: 30 mph

🔍 SPEED ANALYSIS:
Is speeding? true
Within limit? false
Too slow? false
Exactly at limit? false
Different from limit? true
Fast enough? true

🚨 TRAFFIC CONTROL DECISION:
⚠️ SLOW DOWN! You are speeding!
```

---

## 🧠 Logical Operators: The Smart Decision System

```dart
void main() {
  print('🎮 ADVENTURE GAME QUEST SYSTEM 🎮\n');

  // Player stats
  int playerLevel = 15;
  bool hasKey = true;
  bool hasMap = false;
  int goldCoins = 250;

  // Quest requirements
  int requiredLevel = 10;
  int questCost = 200;

  print('👤 PLAYER STATUS:');
  print('📊 Level: $playerLevel');
  print('🗝️ Has key: $hasKey');
  print('🗺️ Has map: $hasMap');
  print('💰 Gold coins: $goldCoins\n');

  // Logical operations
  print('🧠 QUEST ELIGIBILITY CHECKS:');

  // AND operator
  bool canEnterDungeon = hasKey && (playerLevel >= requiredLevel);
  print('🏰 Can enter dungeon: $canEnterDungeon');
  print('   (Needs key AND level $requiredLevel+)');

  // OR operator
  bool hasNavigationTool = hasKey || hasMap;
  print('🧭 Has navigation tool: $hasNavigationTool');
  print('   (Has key OR map)');

  // NOT operator
  bool needsMap = !hasMap;
  print('🗺️ Needs to buy map: $needsMap');
  print('   (Does NOT have map)');

  // Complex logical expression
  bool canStartEpicQuest = (playerLevel >= requiredLevel) &&
                          (hasKey || hasMap) &&
                          (goldCoins >= questCost);
  print('⚔️ Can start epic quest: $canStartEpicQuest');
  print('   (High level AND navigation tool AND enough gold)');

  // Quest recommendations
  print('\n🎯 QUEST RECOMMENDATIONS:');
  if (canStartEpicQuest) {
    print('🌟 Ready for the EPIC QUEST! Good luck, hero!');
  } else {
    print('📋 Complete these tasks first:');
    if (playerLevel < requiredLevel) {
      print('   📈 Gain ${requiredLevel - playerLevel} more levels');
    }
    if (!hasKey && !hasMap) {
      print('   🗝️ Find a key OR 🗺️ buy a map');
    }
    if (goldCoins < questCost) {
      print('   💰 Earn ${questCost - goldCoins} more gold coins');
    }
  }
}
```

**Output:**

```
🎮 ADVENTURE GAME QUEST SYSTEM 🎮

👤 PLAYER STATUS:
📊 Level: 15
🗝️ Has key: true
🗺️ Has map: false
💰 Gold coins: 250

🧠 QUEST ELIGIBILITY CHECKS:
🏰 Can enter dungeon: true
   (Needs key AND level 10+)
🧭 Has navigation tool: true
   (Has key OR map)
🗺️ Needs to buy map: true
   (Does NOT have map)
⚔️ Can start epic quest: true
   (High level AND navigation tool AND enough gold)

🎯 QUEST RECOMMENDATIONS:
🌟 Ready for the EPIC QUEST! Good luck, hero!
```

---

## ⚡ Assignment Operators: The Power-Up System

```dart
void main() {
  print('⚡ SUPERHERO POWER-UP SYSTEM ⚡\n');

  int strength = 50;
  int speed = 30;
  int intelligence = 40;

  print('🦸‍♀️ INITIAL HERO STATS:');
  print('💪 Strength: $strength');
  print('⚡ Speed: $speed');
  print('🧠 Intelligence: $intelligence\n');

  print('🔋 APPLYING POWER-UPS:\n');

  // Basic assignment
  int energy = 100;
  print('⚡ Energy charged to: $energy');

  // Add and assign
  strength += 20;  // Same as: strength = strength + 20
  print('💪 Strength boosted by 20! New strength: $strength');

  // Subtract and assign
  energy -= 30;   // Same as: energy = energy - 30
  print('⚡ Energy consumed (-30)! Remaining: $energy');

  // Multiply and assign
  speed *= 2;     // Same as: speed = speed * 2
  print('🏃 Speed doubled! New speed: $speed');

  // Divide and assign
  intelligence ~/= 2;  // Integer division and assign
  print('🧠 Intelligence halved (thinking too hard)! New intelligence: $intelligence');

  // Modulo and assign
  int lives = 7;
  lives %= 3;     // Same as: lives = lives % 3
  print('❤️ Lives after modulo: $lives');

  print('\n🎊 FINAL HERO STATS:');
  print('💪 Final Strength: $strength');
  print('⚡ Final Speed: $speed');
  print('🧠 Final Intelligence: $intelligence');
  print('⚡ Final Energy: $energy');
  print('❤️ Final Lives: $lives');

  // Power level calculation
  int totalPower = strength + speed + intelligence;
  print('\n🌟 TOTAL POWER LEVEL: $totalPower');

  if (totalPower >= 150) {
    print('🏆 LEGENDARY HERO STATUS ACHIEVED!');
  } else if (totalPower >= 100) {
    print('⭐ SUPER HERO STATUS!');
  } else {
    print('📈 Keep training to become stronger!');
  }
}
```

**Output:**

```
⚡ SUPERHERO POWER-UP SYSTEM ⚡

🦸‍♀️ INITIAL HERO STATS:
💪 Strength: 50
⚡ Speed: 30
🧠 Intelligence: 40

🔋 APPLYING POWER-UPS:

⚡ Energy charged to: 100
💪 Strength boosted by 20! New strength: 70
⚡ Energy consumed (-30)! Remaining: 70
🏃 Speed doubled! New speed: 60
🧠 Intelligence halved (thinking too hard)! New intelligence: 20
❤️ Lives after modulo: 1

🎊 FINAL HERO STATS:
💪 Final Strength: 70
⚡ Final Speed: 60
🧠 Final Intelligence: 20
⚡ Final Energy: 70
❤️ Final Lives: 1

🌟 TOTAL POWER LEVEL: 150
🏆 LEGENDARY HERO STATUS ACHIEVED!
```

---

## 🛒 Real-World Example: Smart Shopping Cart

```dart
void main() {
  print('🛒 SMART SHOPPING CART SYSTEM 🛒\n');

  // Item prices
  double laptopPrice = 999.99;
  double mousePrice = 29.99;
  double keyboardPrice = 79.99;

  // Shopping cart
  int laptopQuantity = 1;
  int mouseQuantity = 2;
  int keyboardQuantity = 1;

  // Customer info
  double customerBudget = 1200.00;
  bool hasPremiumMembership = true;
  bool hasFreShippingCoupon = false;

  print('🛍️ CART CONTENTS:');
  print('💻 Laptop: $laptopQuantity × \$${laptopPrice} = \$${laptopQuantity * laptopPrice}');
  print('🖱️ Mouse: $mouseQuantity × \$${mousePrice} = \$${mouseQuantity * mousePrice}');
  print('⌨️ Keyboard: $keyboardQuantity × \$${keyboardPrice} = \$${keyboardQuantity * keyboardPrice}');

  // Calculate totals
  double subtotal = (laptopQuantity * laptopPrice) +
                   (mouseQuantity * mousePrice) +
                   (keyboardQuantity * keyboardPrice);

  print('\n💰 PRICE BREAKDOWN:');
  print('Subtotal: \$${subtotal.toStringAsFixed(2)}');

  // Apply discounts
  double discountRate = 0.0;
  if (hasPremiumMembership && subtotal >= 1000) {
    discountRate = 0.10; // 10% premium discount
  } else if (hasPremiumMembership) {
    discountRate = 0.05; // 5% premium discount
  }

  double discountAmount = subtotal * discountRate;
  double afterDiscount = subtotal - discountAmount;

  if (discountAmount > 0) {
    print('🎟️ Premium discount (${(discountRate * 100).toStringAsFixed(0)}%): -\$${discountAmount.toStringAsFixed(2)}');
    print('💵 After discount: \$${afterDiscount.toStringAsFixed(2)}');
  }

  // Calculate shipping
  double shippingCost = 0.0;
  if (!hasFreShippingCoupon && afterDiscount < 500) {
    shippingCost = 25.00;
  }

  double finalTotal = afterDiscount + shippingCost;

  if (shippingCost > 0) {
    print('🚚 Shipping cost: \$${shippingCost.toStringAsFixed(2)}');
  } else {
    print('🚚 Shipping: FREE! 🎉');
  }

  print('💳 FINAL TOTAL: \$${finalTotal.toStringAsFixed(2)}');

  // Check affordability
  print('\n💰 BUDGET CHECK:');
  print('Customer budget: \$${customerBudget.toStringAsFixed(2)}');
  print('Final total: \$${finalTotal.toStringAsFixed(2)}');

  bool canAfford = finalTotal <= customerBudget;
  double difference = (customerBudget - finalTotal).abs();

  if (canAfford) {
    print('✅ Purchase approved!');
    print('💰 Money remaining: \$${difference.toStringAsFixed(2)}');

    // Loyalty points calculation
    int loyaltyPoints = (finalTotal / 10).floor(); // 1 point per $10
    if (hasPremiumMembership) {
      loyaltyPoints *= 2; // Double points for premium members
    }
    print('⭐ Loyalty points earned: $loyaltyPoints');

  } else {
    print('❌ Insufficient funds!');
    print('💸 Need \$${difference.toStringAsFixed(2)} more');

    // Suggest removing items
    if (keyboardQuantity > 0) {
      double newTotal = finalTotal - keyboardPrice;
      if (newTotal <= customerBudget) {
        print('💡 Suggestion: Remove keyboard to afford the rest!');
      }
    }
  }
}
```

---

## 🎲 Gaming Example: Dice Combat System

```dart
void main() {
  print('⚔️ EPIC DICE COMBAT SYSTEM ⚔️\n');

  // Player stats
  String playerName = 'Sir Dartington';
  int playerHealth = 100;
  int playerAttack = 25;
  int playerDefense = 15;

  // Enemy stats
  String enemyName = 'Code Dragon';
  int enemyHealth = 120;
  int enemyAttack = 30;
  int enemyDefense = 10;

  print('🏟️ BATTLE ARENA');
  print('👤 $playerName: ❤️$playerHealth ⚔️$playerAttack 🛡️$playerDefense');
  print('🐉 $enemyName: ❤️$enemyHealth ⚔️$enemyAttack 🛡️$enemyDefense\n');

  int round = 1;

  while (playerHealth > 0 && enemyHealth > 0) {
    print('⚡ === ROUND $round ===');

    // Player attacks (simulate dice roll with modulo)
    int playerDiceRoll = (DateTime.now().millisecondsSinceEpoch % 6) + 1;
    int playerDamage = (playerAttack + playerDiceRoll) - enemyDefense;
    playerDamage = playerDamage > 0 ? playerDamage : 1; // Minimum 1 damage

    enemyHealth -= playerDamage;
    enemyHealth = enemyHealth < 0 ? 0 : enemyHealth; // Don't go below 0

    print('🎲 $playerName rolls: $playerDiceRoll');
    print('⚔️ $playerName deals $playerDamage damage to $enemyName!');
    print('🐉 $enemyName health: $enemyHealth');

    if (enemyHealth <= 0) {
      print('🏆 $playerName WINS! 🎉');
      break;
    }

    // Enemy counter-attacks
    int enemyDiceRoll = (DateTime.now().microsecondsSinceEpoch % 6) + 1;
    int enemyDamage = (enemyAttack + enemyDiceRoll) - playerDefense;
    enemyDamage = enemyDamage > 0 ? enemyDamage : 1;

    playerHealth -= enemyDamage;
    playerHealth = playerHealth < 0 ? 0 : playerHealth;

    print('🎲 $enemyName rolls: $enemyDiceRoll');
    print('🐉 $enemyName deals $enemyDamage damage to $playerName!');
    print('👤 $playerName health: $playerHealth');

    if (playerHealth <= 0) {
      print('💀 $enemyName WINS! Game Over!');
      break;
    }

    // Health status
    if (playerHealth <= 25) {
      print('🚨 $playerName is critically wounded!');
    } else if (playerHealth <= 50) {
      print('⚠️ $playerName is badly hurt!');
    }

    if (enemyHealth <= 30) {
      print('🔥 $enemyName is nearly defeated!');
    } else if (enemyHealth <= 60) {
      print('⚡ $enemyName is weakening!');
    }

    round++;
    print('');
  }

  print('\n📊 BATTLE SUMMARY:');
  print('⚡ Total rounds: ${round - 1}');
  print('👤 $playerName final health: $playerHealth');
  print('🐉 $enemyName final health: $enemyHealth');

  if (playerHealth > enemyHealth) {
    int experienceGained = 150 + (round * 10);
    int goldEarned = 75 + (round * 5);
    print('🎁 Rewards: ${experienceGained}XP, ${goldEarned} gold!');
  }
}
```

---

## 📊 Operator Precedence: The Order of Operations

```dart
void main() {
  print('🎯 OPERATOR PRECEDENCE DEMO 🎯\n');

  // Order matters!
  print('🧮 Mathematical expressions:');
  print('2 + 3 * 4 = ${2 + 3 * 4}');          // Multiplication first: 2 + 12 = 14
  print('(2 + 3) * 4 = ${(2 + 3) * 4}');      // Parentheses first: 5 * 4 = 20
  print('10 / 2 + 3 = ${10 / 2 + 3}');        // Division first: 5 + 3 = 8
  print('10 / (2 + 3) = ${10 / (2 + 3)}');    // Parentheses first: 10 / 5 = 2

  print('\n🔍 Comparison and logical:');
  bool result1 = 5 > 3 && 2 < 4;              // Comparisons first, then AND
  bool result2 = true || false && false;       // AND before OR
  bool result3 = (true || false) && false;     // Parentheses change the order

  print('5 > 3 && 2 < 4 = $result1');
  print('true || false && false = $result2');
  print('(true || false) && false = $result3');

  print('\n📋 Precedence order (highest to lowest):');
  print('1. () Parentheses');
  print('2. * / ~/ % Multiplication, Division, Modulo');
  print('3. + - Addition, Subtraction');
  print('4. < > <= >= Comparison');
  print('5. == != Equality');
  print('6. && Logical AND');
  print('7. || Logical OR');
  print('8. = += -= Assignment');
}
```

---

## 📚 String Operators: Text Magic

```dart
void main() {
  print('✨ STRING MAGIC OPERATORS ✨\n');

  String firstName = 'Harry';
  String lastName = 'Potter';
  String house = 'Gryffindor';

  // String concatenation
  String fullName = firstName + ' ' + lastName;
  print('🧙‍♂️ Full name: $fullName');

  // String interpolation (better way)
  String introduction = 'Hello, I am $firstName $lastName from $house house!';
  print('💬 Introduction: $introduction');

  // String multiplication (repeat)
  String spell = 'Abra' * 3;
  print('🪄 Magic spell: ${spell}cadabra!');

  // String comparison
  String password = 'Alohomora';
  String userInput = 'alohomora';

  print('\n🔐 Password check:');
  print('Password: "$password"');
  print('User input: "$userInput"');
  print('Match (case-sensitive): ${password == userInput}');
  print('Match (case-insensitive): ${password.toLowerCase() == userInput.toLowerCase()}');

  // String length comparison
  String shortSpell = 'Lumos';
  String longSpell = 'Expelliarmus';

  print('\n📏 Spell length comparison:');
  print('$shortSpell length: ${shortSpell.length}');
  print('$longSpell length: ${longSpell.length}');
  print('$shortSpell is shorter: ${shortSpell.length < longSpell.length}');

  // Contains check
  String favoriteSpell = 'Expecto Patronum';
  print('\n🔍 Spell analysis:');
  print('Favorite spell: "$favoriteSpell"');
  print('Contains "Patronum": ${favoriteSpell.contains("Patronum")}');
  print('Starts with "Expecto": ${favoriteSpell.startsWith("Expecto")}');
}
```

---

## 🧠 Quick Reference Guide

### All Operators at a Glance

| Category       | Operator | Name             | Example           | Result          |
| -------------- | -------- | ---------------- | ----------------- | --------------- |
| **Arithmetic** | `+`      | Addition         | `5 + 3`           | `8`             |
|                | `-`      | Subtraction      | `5 - 3`           | `2`             |
|                | `*`      | Multiplication   | `5 * 3`           | `15`            |
|                | `/`      | Division         | `5 / 2`           | `2.5`           |
|                | `~/`     | Integer Division | `5 ~/ 2`          | `2`             |
|                | `%`      | Modulo           | `5 % 2`           | `1`             |
|                | `++`     | Increment        | `x++`             | `x + 1`         |
|                | `--`     | Decrement        | `x--`             | `x - 1`         |
| **Comparison** | `==`     | Equal            | `5 == 5`          | `true`          |
|                | `!=`     | Not equal        | `5 != 3`          | `true`          |
|                | `>`      | Greater than     | `5 > 3`           | `true`          |
|                | `<`      | Less than        | `5 < 3`           | `false`         |
|                | `>=`     | Greater or equal | `5 >= 5`          | `true`          |
|                | `<=`     | Less or equal    | `5 <= 3`          | `false`         |
| **Logical**    | `&&`     | AND              | `true && false`   | `false`         |
|                | `\|\|`   | OR               | `true \|\| false` | `true`          |
|                | `!`      | NOT              | `!true`           | `false`         |
| **Assignment** | `=`      | Assign           | `x = 5`           | `x` becomes `5` |
|                | `+=`     | Add assign       | `x += 3`          | `x = x + 3`     |
|                | `-=`     | Subtract assign  | `x -= 3`          | `x = x - 3`     |
|                | `*=`     | Multiply assign  | `x *= 3`          | `x = x * 3`     |
|                | `/=`     | Divide assign    | `x /= 3`          | `x = x / 3`     |

---

## 🎯 Common Use Cases

### Age Verification System

```dart
void checkAgeEligibility(int age) {
  bool canVote = age >= 18;
  bool canDrink = age >= 21;
  bool isMinor = age < 18;

  print('👤 Age: $age');
  print('🗳️ Can vote: $canVote');
  print('🍺 Can drink: $canDrink');
  print('👶 Is minor: $isMinor');
}

void main() {
  checkAgeEligibility(16);
  print('');
  checkAgeEligibility(20);
  print('');
  checkAgeEligibility(25);
}
```

### Grade Calculator

```dart
void calculateGrade(int score) {
  String grade;

  if (score >= 90) {
    grade = 'A';
  } else if (score >= 80) {
    grade = 'B';
  } else if (score >= 70) {
    grade = 'C';
  } else if (score >= 60) {
    grade = 'D';
  } else {
    grade = 'F';
  }

  bool isPassing = score >= 60;
  bool isHonorRoll = score >= 90;

  print('📝 Score: $score');
  print('🎓 Grade: $grade');
  print('✅ Passing: $isPassing');
  print('🌟 Honor roll: $isHonorRoll');
}
```

---

## 🚀 Practice Challenges

Try using operators in these scenarios:

1. **🏪 Store Calculator**: Calculate total with tax and discount
2. **🎮 Game Score**: Add points, multiply bonuses, compare high scores
3. **⏰ Time Converter**: Convert hours to minutes using multiplication
4. **🍕 Pizza Splitter**: Divide pizzas equally among friends using modulo
5. **🎯 Target Practice**: Compare player scores and determine winners

---

## 🎉 Remember This!

Operators are like **tools in a magical toolbox** 🧰✨:

- **🧮 Arithmetic**: Your calculator for number crunching
- **⚖️ Comparison**: Your scale for weighing options
- **🧠 Logical**: Your brain for making smart decisions
- **⚡ Assignment**: Your magic wand for changing values

**The Magic**: Operators turn your data into **actions** and **decisions** - they're the verbs in your code's story!

> **Think of it like**: "Numbers are the ingredients, operators are the cooking instructions!" 👨‍🍳

Without operators, you'd have ingredients but no recipe - operators tell Dart exactly what to **do** with your data! 🎪🚀
