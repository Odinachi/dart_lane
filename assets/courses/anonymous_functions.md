# Anonymous Functions in Dart

Imagine you're at a pizza party 🍕 and someone shouts:

> "Hey! Whoever finishes their slice first, grab more napkins from the kitchen!"

Nobody gets assigned this task by name — it's just a job that needs doing. The first person done just does it!

👉 That's exactly what an **anonymous function** is: a **function without a name** that just gets the job done when needed!

---

## 🏷️ Regular Functions (With Names)

These are like having assigned chores with your name on them:

```dart
// This function has a name: "calculateTip"
double calculateTip(double bill) {
  return bill * 0.15;
}

// This function has a name: "greetCustomer"
void greetCustomer(String name) {
  print('Welcome, $name! Enjoy your meal!');
}

void main() {
  double tip = calculateTip(50.0);
  greetCustomer('Sarah');
  print('Tip: \$${tip}');
}
```

**Output:**

```
Welcome, Sarah! Enjoy your meal!
Tip: $7.5
```

---

## 👤 Anonymous Functions (No Names)

These are like spontaneous helpers — no name tags needed!

### Basic Anonymous Function

```dart
void main() {
  // Store anonymous function in a variable
  var makeSound = () {
    print('🔊 Beep beep!');
  };

  // Use it
  makeSound(); // Output: 🔊 Beep beep!
}
```

### Anonymous Function with Parameters

```dart
void main() {
  // Anonymous function that takes parameters
  var multiplyByTwo = (int number) {
    return number * 2;
  };

  print(multiplyByTwo(7)); // Output: 14
  print(multiplyByTwo(25)); // Output: 50
}
```

### Arrow Function Syntax (Super Short!)

```dart
void main() {
  // Short way to write anonymous functions
  var addFive = (int x) => x + 5;
  var isEven = (int num) => num % 2 == 0;

  print(addFive(10));    // Output: 15
  print(isEven(8));      // Output: true
  print(isEven(7));      // Output: false
}
```

---

## 🚀 Immediately Invoked Functions

Sometimes you want to run a function right away, just once:

```dart
void main() {
  print('Starting app...');

  // Run this function immediately!
  () {
    print('🎉 App initialized!');
    print('Ready for users!');
  }(); // ← These parentheses run it immediately

  print('App is running...');
}
```

**Output:**

```
Starting app...
🎉 App initialized!
Ready for users!
App is running...
```

---

## 📝 Real-World Example: Processing Lists

### Scenario: Restaurant Order Processing

```dart
void main() {
  var orders = ['Pizza', 'Burger', 'Salad', 'Pasta', 'Tacos'];
  var prices = [12.99, 8.50, 7.25, 11.00, 9.75];

  print('=== RESTAURANT ORDERS ===');

  // Anonymous function to process each order
  orders.forEach((order) {
    print('✅ Preparing: $order');
  });

  print('\n=== PRICE CALCULATION ===');

  // Anonymous function to add tax to each price
  var pricesWithTax = prices.map((price) {
    return price * 1.08; // 8% tax
  }).toList();

  // Show original vs taxed prices
  for (int i = 0; i < orders.length; i++) {
    print('${orders[i]}: \$${prices[i]} → \$${pricesWithTax[i].toStringAsFixed(2)} (with tax)');
  }

  // Anonymous function to find total
  var total = pricesWithTax.reduce((sum, price) => sum + price);
  print('\n💰 Total bill: \$${total.toStringAsFixed(2)}');
}
```

**Output:**

```
=== RESTAURANT ORDERS ===
✅ Preparing: Pizza
✅ Preparing: Burger
✅ Preparing: Salad
✅ Preparing: Pasta
✅ Preparing: Tacos

=== PRICE CALCULATION ===
Pizza: $12.99 → $14.03 (with tax)
Burger: $8.50 → $9.18 (with tax)
Salad: $7.25 → $7.83 (with tax)
Pasta: $11.00 → $11.88 (with tax)
Tacos: $9.75 → $10.53 (with tax)

💰 Total bill: $53.45
```

---

## 🎮 Interactive Example: Game Score Processing

```dart
void main() {
  var playerScores = [
    {'name': 'Alex', 'score': 1250},
    {'name': 'Sam', 'score': 890},
    {'name': 'Jordan', 'score': 1450},
    {'name': 'Casey', 'score': 720},
  ];

  print('🎮 GAME LEADERBOARD 🎮\n');

  // Anonymous function to determine rank emoji
  var getRankEmoji = (int score) {
    if (score > 1400) return '🏆';
    if (score > 1000) return '🥈';
    if (score > 800) return '🥉';
    return '🎯';
  };

  // Anonymous function to format player info
  playerScores.forEach((player) {
    String emoji = getRankEmoji(player['score'] as int);
    print('$emoji ${player['name']}: ${player['score']} points');
  });

  // Find the winner using anonymous function
  var winner = playerScores.reduce((a, b) =>
    (a['score'] as int) > (b['score'] as int) ? a : b
  );

  print('\n🎊 Winner: ${winner['name']} with ${winner['score']} points!');
}
```

**Output:**

```
🎮 GAME LEADERBOARD 🎮

🏆 Jordan: 1450 points
🥈 Alex: 1250 points
🥉 Sam: 890 points
🎯 Casey: 720 points

🎊 Winner: Jordan with 1450 points!
```

---

## 🛠️ Practical Use Cases

### 1. Event Handlers

```dart
void main() {
  // Simulating button clicks
  var buttons = ['Save', 'Cancel', 'Delete'];

  buttons.forEach((buttonName) {
    // Anonymous function handles each button differently
    var handleClick = () {
      switch(buttonName) {
        case 'Save': print('💾 Data saved successfully!'); break;
        case 'Cancel': print('❌ Operation cancelled'); break;
        case 'Delete': print('🗑️ Item deleted'); break;
      }
    };

    print('Clicking $buttonName button...');
    handleClick();
  });
}
```

### 2. Data Filtering

```dart
void main() {
  var students = [
    {'name': 'Emma', 'grade': 85},
    {'name': 'Liam', 'grade': 92},
    {'name': 'Olivia', 'grade': 78},
    {'name': 'Noah', 'grade': 96},
  ];

  // Anonymous function to filter honor students (grade > 90)
  var honorStudents = students.where((student) {
    return (student['grade'] as int) > 90;
  }).toList();

  print('🎓 Honor Students:');
  honorStudents.forEach((student) {
    print('⭐ ${student['name']}: ${student['grade']}%');
  });
}
```

---

## 📊 Comparison Table

| Feature      | Named Function                      | Anonymous Function                |
| ------------ | ----------------------------------- | --------------------------------- |
| **Has Name** | ✅ `void myFunction()`              | ❌ `() { ... }`                   |
| **Reusable** | ✅ Call anywhere                    | 🔶 Only where defined             |
| **Memory**   | Stored globally                     | 🔶 Stored in variable/used inline |
| **Best For** | Repeated tasks                      | One-time or callback tasks        |
| **Example**  | `double calculateTax(double price)` | `prices.map((p) => p * 1.08)`     |

---

## 🧠 Quick Reference

### Syntax Patterns

```dart
// Basic anonymous function
() { print('Hello!'); }

// With parameters
(String name) { print('Hi $name!'); }

// Arrow function (short form)
(int x) => x * 2

// Immediately invoked
(() { print('Run now!'); })();

// Stored in variable
var myFunc = (int a, int b) => a + b;
```

### Common Uses

- **Lists**: `list.forEach((item) => print(item))`
- **Filtering**: `list.where((item) => item > 10)`
- **Mapping**: `list.map((item) => item * 2)`
- **Event handling**: Button clicks, form submissions
- **Callbacks**: Functions passed to other functions

---

## 🎉 Remember This!

Anonymous functions are like **helpful strangers** at a party 🎉

- They show up when needed
- Do their job perfectly
- Don't need formal introductions
- Disappear when done
- Make your code cleaner and more flexible!

**Pro Tip**: Use anonymous functions when you need a quick, one-time helper. Use named functions when you'll need the same logic multiple times throughout your app!
