# For Loops in Dart

Imagine you're a **robot baker** 🤖👨‍🍳 in a magical bakery!

Your boss gives you instructions:

- "Bake 10 cookies, one by one" 🍪
- "Decorate 5 cupcakes in order" 🧁
- "Count down from 10 to blast off the cake rocket" 🚀

Instead of doing each task manually, you have a **special program** that can repeat actions automatically!

👉 A **for loop** is like having a **smart assistant** that counts for you and repeats tasks exactly the number of times you want!

---

## 🎯 The Problem: Repetitive Tasks

```dart
void main() {
  // ❌ This is tedious and error-prone!
  print('🍪 Baking cookie 1');
  print('🍪 Baking cookie 2');
  print('🍪 Baking cookie 3');
  print('🍪 Baking cookie 4');
  print('🍪 Baking cookie 5');
  // ... imagine doing this 100 times! 😵
}
```

**Problems:**

- Too much typing! ⌨️💥
- Easy to make mistakes 🤦‍♀️
- What if we want to bake 1000 cookies? 😱

---

## ✅ The Solution: For Loops!

```dart
void main() {
  for (int i = 1; i <= 5; i++) {
    print('🍪 Baking cookie $i');
  }
  print('🎉 All cookies are done!');
}
```

**Output:**

```
🍪 Baking cookie 1
🍪 Baking cookie 2
🍪 Baking cookie 3
🍪 Baking cookie 4
🍪 Baking cookie 5
🎉 All cookies are done!
```

**Amazing!** Just 3 lines of code baked 5 cookies! 🎪

---

## 🔍 Anatomy of a For Loop

```dart
for (int i = 1; i <= 5; i++) {
//   │    │      │      │
//   │    │      │      └── Step: what to do after each loop
//   │    │      └─────────── Condition: when to stop
//   │    └────────────────── Start: where to begin counting
//   └─────────────────────── Counter: the variable that keeps track
    print('🍪 Baking cookie $i');
}
```

### The Three Parts:

1. **🏁 Start**: `int i = 1` - Begin counting at 1
2. **🔄 Condition**: `i <= 5` - Keep going while i is 5 or less
3. **📈 Step**: `i++` - Add 1 to i after each round

---

## 🧁 Bakery Examples

### Decorating Cupcakes

```dart
void main() {
  print('🧁 Welcome to Sarah\'s Cupcake Shop!\n');

  for (int cupcake = 1; cupcake <= 8; cupcake++) {
    print('🎨 Decorating cupcake #$cupcake with sprinkles ✨');
  }

  print('\n🎉 All cupcakes are beautifully decorated!');
  print('💰 Ready to sell!');
}
```

**Output:**

```
🧁 Welcome to Sarah's Cupcake Shop!

🎨 Decorating cupcake #1 with sprinkles ✨
🎨 Decorating cupcake #2 with sprinkles ✨
🎨 Decorating cupcake #3 with sprinkles ✨
🎨 Decorating cupcake #4 with sprinkles ✨
🎨 Decorating cupcake #5 with sprinkles ✨
🎨 Decorating cupcake #6 with sprinkles ✨
🎨 Decorating cupcake #7 with sprinkles ✨
🎨 Decorating cupcake #8 with sprinkles ✨

🎉 All cupcakes are beautifully decorated!
💰 Ready to sell!
```

### Pizza Making Assembly Line

```dart
void main() {
  print('🍕 Mario\'s Pizza Factory\n');

  for (int pizza = 1; pizza <= 6; pizza++) {
    print('👨‍🍳 Step 1: Rolling dough for pizza #$pizza');
    print('🍅 Step 2: Adding tomato sauce');
    print('🧀 Step 3: Sprinkling cheese');
    print('🔥 Step 4: Baking in the oven');
    print('✅ Pizza #$pizza is ready to serve!\n');
  }

  print('🎊 All pizzas completed! Time for lunch!');
}
```

---

## 🚀 Countdown Examples

### Rocket Launch Countdown

```dart
void main() {
  print('🚀 Space Mission Control\n');

  print('Preparing for rocket launch...');

  for (int countdown = 10; countdown > 0; countdown--) {
    print('⏰ T-minus $countdown seconds...');
  }

  print('🚀 BLAST OFF! 🌟');
  print('🛸 Rocket successfully launched!');
}
```

**Output:**

```
🚀 Space Mission Control

Preparing for rocket launch...
⏰ T-minus 10 seconds...
⏰ T-minus 9 seconds...
⏰ T-minus 8 seconds...
⏰ T-minus 7 seconds...
⏰ T-minus 6 seconds...
⏰ T-minus 5 seconds...
⏰ T-minus 4 seconds...
⏰ T-minus 3 seconds...
⏰ T-minus 2 seconds...
⏰ T-minus 1 seconds...
🚀 BLAST OFF! 🌟
🛸 Rocket successfully launched!
```

### New Year's Eve Countdown

```dart
void main() {
  print('🎊 NEW YEAR\'S EVE PARTY! 🎊\n');

  print('🥳 Everyone gather around!');
  print('🍾 Champagne ready!');
  print('🎆 Fireworks prepared!\n');

  for (int seconds = 5; seconds >= 1; seconds--) {
    print('🗣️ Everyone shouts: "$seconds!"');
  }

  print('🎉 HAPPY NEW YEAR! 🎉');
  print('✨ *fireworks explode* ✨');
  print('🥂 *champagne pops* 🥂');
}
```

---

## 🎮 Gaming Examples

### Player Lives System

```dart
void main() {
  print('🎮 SUPER MARIO ADVENTURE 🎮\n');

  int totalLives = 3;

  for (int life = 1; life <= totalLives; life++) {
    print('❤️ Life $life: Mario starts the level!');
    print('🏃 Running through World 1-1...');
    print('🍄 Collected a power-up!');
    print('🏁 Level completed!\n');
  }

  print('🏆 All lives used successfully!');
  print('⭐ Mario became the champion!');
}
```

### High Score Tracker

```dart
void main() {
  print('🏆 HIGH SCORE LEADERBOARD 🏆\n');

  List<String> players = ['Alex', 'Sarah', 'Mike', 'Emma', 'Jake'];
  List<int> scores = [95000, 87500, 82000, 79500, 76000];

  for (int rank = 0; rank < players.length; rank++) {
    String medal = '';
    if (rank == 0) medal = '🥇';
    else if (rank == 1) medal = '🥈';
    else if (rank == 2) medal = '🥉';
    else medal = '🏅';

    print('$medal Rank ${rank + 1}: ${players[rank]} - ${scores[rank]} points');
  }

  print('\n🎊 Congratulations to all players!');
}
```

**Output:**

```
🏆 HIGH SCORE LEADERBOARD 🏆

🥇 Rank 1: Alex - 95000 points
🥈 Rank 2: Sarah - 87500 points
🥉 Rank 3: Mike - 82000 points
🏅 Rank 4: Emma - 79500 points
🏅 Rank 5: Jake - 76000 points

🎊 Congratulations to all players!
```

---

## 🌟 Different Loop Patterns

### Counting from 0 (Most Common)

```dart
void main() {
  print('📚 Reading book pages:\n');

  for (int page = 0; page < 5; page++) {
    print('📖 Reading page ${page + 1}');
  }
}
```

### Counting from 1

```dart
void main() {
  print('🎪 Circus performance:\n');

  for (int act = 1; act <= 4; act++) {
    print('🎭 Act $act: Amazing performance!');
  }
}
```

### Counting by 2s (Even Numbers)

```dart
void main() {
  print('👥 Calling even-numbered students:\n');

  for (int student = 2; student <= 10; student += 2) {
    print('📢 Student #$student, please come forward!');
  }
}
```

**Output:**

```
👥 Calling even-numbered students:

📢 Student #2, please come forward!
📢 Student #4, please come forward!
📢 Student #6, please come forward!
📢 Student #8, please come forward!
📢 Student #10, please come forward!
```

### Counting by 5s

```dart
void main() {
  print('💰 Counting money in $5 bills:\n');

  for (int amount = 5; amount <= 50; amount += 5) {
    print('💵 $amount dollars counted!');
  }
}
```

---

## 🏫 Educational Examples

### Multiplication Table

```dart
void main() {
  int number = 7;
  print('📊 Multiplication Table for $number:\n');

  for (int i = 1; i <= 10; i++) {
    int result = number * i;
    print('$number × $i = $result');
  }
}
```

**Output:**

```
📊 Multiplication Table for 7:

7 × 1 = 7
7 × 2 = 14
7 × 3 = 21
7 × 4 = 28
7 × 5 = 35
7 × 6 = 42
7 × 7 = 49
7 × 8 = 56
7 × 9 = 63
7 × 10 = 70
```

### Grade Calculator

```dart
void main() {
  print('🎓 CLASS GRADE REPORT 🎓\n');

  List<String> students = ['Alice', 'Bob', 'Charlie', 'Diana'];
  List<int> grades = [95, 87, 92, 88];

  int totalGrades = 0;

  for (int i = 0; i < students.length; i++) {
    print('📝 ${students[i]}: ${grades[i]}% ${getGradeLetter(grades[i])}');
    totalGrades += grades[i];
  }

  double average = totalGrades / students.length;
  print('\n📊 Class Average: ${average.toStringAsFixed(1)}%');
  print('🏆 Overall Performance: ${getGradeLetter(average.round())}');
}

String getGradeLetter(int grade) {
  if (grade >= 90) return '(A)';
  if (grade >= 80) return '(B)';
  if (grade >= 70) return '(C)';
  if (grade >= 60) return '(D)';
  return '(F)';
}
```

---

## 🎨 Art and Patterns

### Drawing Stars Pattern

```dart
void main() {
  print('✨ STAR PATTERN GENERATOR ✨\n');

  for (int row = 1; row <= 5; row++) {
    String stars = '';
    for (int star = 1; star <= row; star++) {
      stars += '⭐';
    }
    print('Row $row: $stars');
  }
}
```

**Output:**

```
✨ STAR PATTERN GENERATOR ✨

Row 1: ⭐
Row 2: ⭐⭐
Row 3: ⭐⭐⭐
Row 4: ⭐⭐⭐⭐
Row 5: ⭐⭐⭐⭐⭐
```

### Christmas Tree

```dart
void main() {
  print('🎄 CHRISTMAS TREE GENERATOR 🎄\n');

  // Tree top
  for (int level = 1; level <= 4; level++) {
    // Print spaces for centering
    String spaces = ' ' * (4 - level);
    // Print stars
    String stars = '🌟' * level;
    print('$spaces$stars');
  }

  // Tree trunk
  print('   🟫'); // Trunk
  print('\n🎁 Presents under the tree! 🎁');
}
```

**Output:**

```
🎄 CHRISTMAS TREE GENERATOR 🎄

   🌟
  🌟🌟
 🌟🌟🌟
🌟🌟🌟🌟
   🟫

🎁 Presents under the tree! 🎁
```

---

## 📱 Real App Examples

### Social Media Posts

```dart
void main() {
  print('📱 SOCIAL MEDIA FEED 📱\n');

  List<String> users = ['@sarah_coder', '@mike_designer', '@emma_artist'];
  List<String> posts = [
    'Just finished my first Dart app! 🎉',
    'New logo design for a local coffee shop ☕',
    'Painted a beautiful sunset today 🌅'
  ];

  for (int i = 0; i < users.length; i++) {
    print('👤 ${users[i]}');
    print('💬 ${posts[i]}');
    print('❤️ 24 likes  💬 5 comments  🔄 3 shares');
    print('⏰ 2 hours ago\n');
  }

  print('📲 End of feed - Pull to refresh!');
}
```

### Shopping Cart

```dart
void main() {
  print('🛒 ONLINE SHOPPING CART 🛒\n');

  List<String> items = ['Laptop', 'Mouse', 'Keyboard', 'Monitor'];
  List<double> prices = [899.99, 29.99, 79.99, 249.99];
  List<int> quantities = [1, 2, 1, 1];

  double total = 0;

  print('📋 CART ITEMS:');
  print('─' * 40);

  for (int i = 0; i < items.length; i++) {
    double itemTotal = prices[i] * quantities[i];
    total += itemTotal;

    print('${items[i].padRight(15)} x${quantities[i]} - \$${itemTotal.toStringAsFixed(2)}');
  }

  print('─' * 40);
  print('💰 TOTAL: \$${total.toStringAsFixed(2)}');
  print('🚚 Free shipping on orders over \$500!');
}
```

**Output:**

```
🛒 ONLINE SHOPPING CART 🛒

📋 CART ITEMS:
────────────────────────────────────────
Laptop          x1 - $899.99
Mouse           x2 - $59.98
Keyboard        x1 - $79.99
Monitor         x1 - $249.99
────────────────────────────────────────
💰 TOTAL: $1289.95
🚚 Free shipping on orders over $500!
```

---

## 🧠 Loop Control Tips

### Early Exit with Break

```dart
void main() {
  print('🔍 Finding the first even number:\n');

  for (int number = 1; number <= 10; number++) {
    print('Checking $number...');

    if (number % 2 == 0) {
      print('✅ Found first even number: $number');
      break; // Exit the loop early
    }
  }

  print('🎯 Search completed!');
}
```

### Skip with Continue

```dart
void main() {
  print('🎵 Playing only odd-numbered songs:\n');

  for (int song = 1; song <= 8; song++) {
    if (song % 2 == 0) {
      continue; // Skip even numbers
    }

    print('🎶 Now playing song #$song');
  }

  print('🎉 Playlist finished!');
}
```

---

## 📊 Loop Comparison Guide

### Different Starting Points

| Pattern        | Code                           | Output  |
| -------------- | ------------------------------ | ------- |
| **Start at 0** | `for (int i = 0; i < 3; i++)`  | 0, 1, 2 |
| **Start at 1** | `for (int i = 1; i <= 3; i++)` | 1, 2, 3 |
| **Countdown**  | `for (int i = 3; i > 0; i--)`  | 3, 2, 1 |

### Different Step Sizes

| Pattern        | Code                               | Output            |
| -------------- | ---------------------------------- | ----------------- |
| **Count by 1** | `for (int i = 0; i < 5; i++)`      | 0, 1, 2, 3, 4     |
| **Count by 2** | `for (int i = 0; i < 10; i += 2)`  | 0, 2, 4, 6, 8     |
| **Count by 5** | `for (int i = 5; i <= 25; i += 5)` | 5, 10, 15, 20, 25 |

---

## 🚀 Practice Challenges

Try creating for loops for these scenarios:

1. **🏪 Store Inventory**: Print 15 items with prices
2. **📅 Calendar**: Show days 1-31 for a month
3. **🌡️ Temperature**: Show hourly temps for 24 hours
4. **🎲 Dice Roll**: Simulate rolling a die 10 times
5. **📚 Library**: Check out 20 books with titles

---

## 🎯 Common Patterns to Remember

### The "Less Than" Pattern (Most Popular)

```dart
for (int i = 0; i < 5; i++) {
  // Runs 5 times: 0, 1, 2, 3, 4
}
```

### The "Less Than or Equal" Pattern

```dart
for (int i = 1; i <= 5; i++) {
  // Runs 5 times: 1, 2, 3, 4, 5
}
```

### The "Countdown" Pattern

```dart
for (int i = 5; i > 0; i--) {
  // Runs 5 times: 5, 4, 3, 2, 1
}
```

---

## 🎉 Remember This!

For loops are like having a **super-efficient assistant** 🤖:

- **🏁 Start**: Tell them where to begin counting
- **🔄 Condition**: Tell them when to stop
- **📈 Step**: Tell them how to count (by 1s, 2s, backwards, etc.)
- **⚡ Action**: Tell them what to do each time

**The Magic**: Instead of doing boring repetitive work yourself, the for loop does it perfectly every time!

> **Think of it like**: "Hey computer, count from 1 to 10, and each time you count, bake me a cookie!" 🍪

And just like that - 10 cookies appear! That's the power of for loops! ✨🎪
