# Closures in Dart

Imagine you're at a **magic show** 🎩✨!

The magician gives you a **magic box** 📦. Inside this box is:
- A **magic trick** (function) 🪄
- Some **secret ingredients** (variables) that only this trick remembers 🔮

No matter where you take this magic box - home, school, or a friend's house - it **always remembers** its secret ingredients and can perform the same trick!

👉 A **closure** works exactly like this magic box:

> A function that **captures and remembers** variables from where it was created, even when used somewhere completely different!

---

## 🎩 The Magic Box Example

```dart
Function createMagicBox() {
  String secretWord = 'Abracadabra';
  int magicNumber = 42;

  return () {
    print('🎩✨ The magic word is: $secretWord');
    print('🔮 The magic number is: $magicNumber');
    print('Magic performed! ✨');
  };
}

void main() {
  // Get your magic box
  var myMagicBox = createMagicBox();
  
  print('📦 Got my magic box!');
  
  // Use it anywhere!
  myMagicBox(); 
  print('');
  myMagicBox(); // Still remembers the secrets!
}
```

**Output:**
```
📦 Got my magic box!
🎩✨ The magic word is: Abracadabra
🔮 The magic number is: 42
Magic performed! ✨

🎩✨ The magic word is: Abracadabra
🔮 The magic number is: 42
Magic performed! ✨
```

Even though `secretWord` and `magicNumber` were created inside `createMagicBox()`, the returned function **remembers** them forever!

---

## 🏦 Bank Account Example

Let's create a **private bank account** where only YOU can access your money:

```dart
Function createBankAccount(double startingBalance) {
  double balance = startingBalance; // This is private and safe!
  
  return (String action, [double amount = 0]) {
    if (action == 'deposit') {
      balance += amount;
      print('💰 Deposited \$${amount}. New balance: \$${balance}');
    } else if (action == 'withdraw') {
      if (amount <= balance) {
        balance -= amount;
        print('💸 Withdrew \$${amount}. New balance: \$${balance}');
      } else {
        print('❌ Not enough money! Balance: \$${balance}');
      }
    } else if (action == 'check') {
      print('💳 Current balance: \$${balance}');
    }
  };
}

void main() {
  // Create personal bank accounts
  var aliceAccount = createBankAccount(100.0);
  var bobAccount = createBankAccount(50.0);
  
  print('🏦 Welcome to Magic Bank!\n');
  
  print('=== Alice\'s Account ===');
  aliceAccount('check', 0);
  aliceAccount('deposit', 25.0);
  aliceAccount('withdraw', 30.0);
  aliceAccount('check', 0);
  
  print('\n=== Bob\'s Account ===');
  bobAccount('check', 0);
  bobAccount('withdraw', 60.0); // Not enough money!
  bobAccount('deposit', 20.0);
  bobAccount('withdraw', 60.0); // Now it works!
}
```

**Output:**
```
🏦 Welcome to Magic Bank!

=== Alice's Account ===
💳 Current balance: $100.0
💰 Deposited $25.0. New balance: $125.0
💸 Withdrew $30.0. New balance: $95.0
💳 Current balance: $95.0

=== Bob's Account ===
💳 Current balance: $50.0
❌ Not enough money! Balance: $50.0
💰 Deposited $20.0. New balance: $70.0
💸 Withdrew $60.0. New balance: $10.0
```

**Amazing!** Each account remembers its own balance separately - Alice's money stays Alice's, and Bob's stays Bob's!

---

## 🎮 Game Score Tracker

Let's create personalized score trackers for different players:

```dart
Function createScoreTracker(String playerName) {
  int score = 0;
  int level = 1;
  List<String> achievements = [];
  
  return (String action, [int points = 0]) {
    if (action == 'score') {
      score += points;
      print('⭐ $playerName scored $points points! Total: $score');
      
      // Level up every 100 points
      int newLevel = (score ~/ 100) + 1;
      if (newLevel > level) {
        level = newLevel;
        achievements.add('Reached Level $level');
        print('🆙 $playerName leveled up to Level $level!');
      }
      
    } else if (action == 'status') {
      print('🎮 $playerName\'s Stats:');
      print('   Score: $score');
      print('   Level: $level');
      print('   Achievements: ${achievements.join(", ")}');
    }
  };
}

void main() {
  // Create trackers for different players
  var alexTracker = createScoreTracker('Alex');
  var samTracker = createScoreTracker('Sam');
  
  print('🎮 Game Started!\n');
  
  print('=== Alex\'s Game ===');
  alexTracker('score', 50);
  alexTracker('score', 30);
  alexTracker('score', 25); // Should level up to 2!
  alexTracker('score', 45);
  alexTracker('status', 0);
  
  print('\n=== Sam\'s Game ===');
  samTracker('score', 75);
  samTracker('score', 80); // Should level up to 2!
  samTracker('score', 20);
  samTracker('status', 0);
}
```

**Output:**
```
🎮 Game Started!

=== Alex's Game ===
⭐ Alex scored 50 points! Total: 50
⭐ Alex scored 30 points! Total: 80
⭐ Alex scored 25 points! Total: 105
🆙 Alex leveled up to Level 2!
⭐ Alex scored 45 points! Total: 150
🎮 Alex's Stats:
   Score: 150
   Level: 2
   Achievements: Reached Level 2

=== Sam's Game ===
⭐ Sam scored 75 points! Total: 75
⭐ Sam scored 80 points! Total: 155
🆙 Sam leveled up to Level 2!
⭐ Sam scored 20 points! Total: 175
🎮 Sam's Stats:
   Score: 175
   Level: 2
   Achievements: Reached Level 2
```

Each player's tracker remembers their own score, level, and achievements independently!

---

## 🏭 Counter Factory

Let's make different types of counters:

```dart
Function createCounter(String name, int step) {
  int count = 0;
  
  return () {
    count += step;
    print('$name counter: $count');
    return count;
  };
}

void main() {
  // Create different counters
  var normalCounter = createCounter('Normal', 1);
  var bigCounter = createCounter('Big Jump', 5);
  var backwardCounter = createCounter('Countdown', -1);
  
  print('🏭 Counter Factory Demo!\n');
  
  print('=== Normal Counter ===');
  normalCounter();
  normalCounter();
  normalCounter();
  
  print('\n=== Big Jump Counter ===');
  bigCounter();
  bigCounter();
  
  print('\n=== Countdown Counter ===');
  backwardCounter();
  backwardCounter();
  backwardCounter();
  
  print('\n=== All counters working independently! ===');
  normalCounter(); // Still continues from where it left off
  bigCounter();    // Same here
  backwardCounter(); // And here too!
}
```

**Output:**
```
🏭 Counter Factory Demo!

=== Normal Counter ===
Normal counter: 1
Normal counter: 2
Normal counter: 3

=== Big Jump Counter ===
Big Jump counter: 5
Big Jump counter: 10

=== Countdown Counter ===
Countdown counter: -1
Countdown counter: -2
Countdown counter: -3

=== All counters working independently! ===
Normal counter: 4
Big Jump counter: 15
Countdown counter: -4
```

---

## 🍪 Cookie Jar Example

Let's create cookie jars that remember how many cookies are left:

```dart
Function createCookieJar(String flavor, int initialCookies) {
  int cookies = initialCookies;
  
  return (String action, [int amount = 1]) {
    if (action == 'eat') {
      if (cookies >= amount) {
        cookies -= amount;
        print('😋 Ate $amount $flavor cookie${amount > 1 ? 's' : ''}! Cookies left: $cookies');
      } else {
        print('😢 Not enough $flavor cookies! Only $cookies left.');
      }
    } else if (action == 'add') {
      cookies += amount;
      print('🍪 Added $amount fresh $flavor cookie${amount > 1 ? 's' : ''}! Total: $cookies');
    } else if (action == 'check') {
      print('🍪 $flavor jar has $cookies cookies');
    }
  };
}

void main() {
  // Create different cookie jars
  var chocolateJar = createCookieJar('chocolate chip', 10);
  var oatmealJar = createCookieJar('oatmeal', 5);
  
  print('🍪 Cookie Jar Manager\n');
  
  print('=== Chocolate Chip Jar ===');
  chocolateJar('check', 0);
  chocolateJar('eat', 3);
  chocolateJar('add', 5);
  chocolateJar('eat', 8);
  chocolateJar('check', 0);
  
  print('\n=== Oatmeal Jar ===');
  oatmealJar('check', 0);
  oatmealJar('eat', 2);
  oatmealJar('eat', 5); // Should fail!
  oatmealJar('add', 3);
  oatmealJar('eat', 4);
}
```

**Output:**
```
🍪 Cookie Jar Manager

=== Chocolate Chip Jar ===
🍪 chocolate chip jar has 10 cookies
😋 Ate 3 chocolate chip cookies! Cookies left: 7
🍪 Added 5 fresh chocolate chip cookies! Total: 12
😋 Ate 8 chocolate chip cookies! Cookies left: 4
🍪 chocolate chip jar has 4 cookies

=== Oatmeal Jar ===
🍪 oatmeal jar has 5 cookies
😋 Ate 2 oatmeal cookies! Cookies left: 3
😢 Not enough oatmeal cookies! Only 3 left.
🍪 Added 3 fresh oatmeal cookies! Total: 6
😋 Ate 4 oatmeal cookies! Cookies left: 2
```

---

## 🔍 How Closures Work

### The Magic Happens in 3 Steps:

1. **📦 Package Creation**: A function creates some variables
2. **🎁 Gift Wrapping**: It returns another function that "captures" those variables  
3. **✨ Memory Magic**: The returned function remembers those variables forever!

```dart
Function demonstrateClosureMagic() {
  String secret = 'I am captured!';
  int number = 100;
  
  print('📦 Creating closure with secret: "$secret" and number: $number');
  
  return () {
    print('✨ Inside closure: I still remember "$secret" and $number');
    number++; // I can even change the captured variables!
    print('🔄 Updated number to: $number');
  };
}

void main() {
  print('🎩 Closure Magic Demonstration\n');
  
  var magicFunction = demonstrateClosureMagic();
  
  print('📨 Got the magic function!\n');
  
  print('=== First Call ===');
  magicFunction();
  
  print('\n=== Second Call ==='); 
  magicFunction(); // Watch the number continue from where it left off!
  
  print('\n=== Third Call ===');
  magicFunction();
}
```

**Output:**
```
🎩 Closure Magic Demonstration

📦 Creating closure with secret: "I am captured!" and number: 100
📨 Got the magic function!

=== First Call ===
✨ Inside closure: I still remember "I am captured!" and 100
🔄 Updated number to: 101

=== Second Call ===
✨ Inside closure: I still remember "I am captured!" and 101
🔄 Updated number to: 102

=== Third Call ===
✨ Inside closure: I still remember "I am captured!" and 102
🔄 Updated number to: 103
```

---

## 🧠 Key Concepts

### What Gets Captured?
```dart
Function example() {
  String captured = 'I will be remembered';
  int alsoCaptured = 42;
  
  return () {
    // These variables are "captured" in the closure
    print(captured);      // ✅ Accessible
    print(alsoCaptured);  // ✅ Accessible
  };
}
```

### Multiple Closures = Separate Memories
```dart
Function createMemory(String name) {
  return () => print('Hello, $name!');
}

void main() {
  var memory1 = createMemory('Alice');
  var memory2 = createMemory('Bob');
  
  memory1(); // Hello, Alice!
  memory2(); // Hello, Bob!
  
  // Each closure has its own captured variables!
}
```

---

## 🎯 When to Use Closures

**✅ Perfect for:**
- **Private data** (like bank account balances)
- **Counters and trackers** that remember state
- **Event handlers** that need to remember context
- **Factory functions** that create customized functions

**❌ Not needed for:**
- Simple calculations that don't need memory
- One-time operations
- Functions that don't use outside variables

---

## 🚀 Practice Challenges

Try creating these closures:

1. **Timer Factory**: Creates timers that count seconds independently
2. **Password Keeper**: Stores and validates passwords securely  
3. **Shopping Cart**: Remembers items and calculates totals
4. **Pet Simulator**: Each pet remembers its hunger, happiness, and age

---

## 🎉 Remember This!

Closures are like **time capsules** 📦⏰:

- You put some **treasures** (variables) inside
- **Seal it up** with a function
- **Bury it** anywhere in your code
- **Dig it up** later and the treasures are **still there**!

Each closure is its own **private treasure chest** that nobody else can open - only the function that created it has the key! 🗝️✨

This makes closures perfect for creating **secure**, **stateful**, and **personalized** functions in your apps! 🚀