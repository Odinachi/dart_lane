# Abstract Classes

Imagine you're designing **video game characters** 🎮.

Every character needs to:

- Have a **health bar** 💚
- Be able to **attack** ⚔️
- Have a **special move** ✨

But each character does these things **differently**:

- A **wizard** casts spells 🧙‍♂️
- A **warrior** swings a sword 🗡️
- An **archer** shoots arrows 🏹

You know **what** every character must do, but not exactly **how** they'll do it.

👉 That's what an **Abstract Class** is!

> "A blueprint that says: 'Every character must have these abilities, but YOU decide how they work!'"

---

## 🎯 Real-Life Analogy

| Real Life                                       | Dart Code                                     |
| ----------------------------------------------- | --------------------------------------------- |
| **Game character blueprint** 📋                 | `abstract class GameCharacter`                |
| **"Must have attack move"** ⚔️                  | `void attack();` (abstract method)            |
| **"Health bar works the same for everyone"** 💚 | `void showHealth() { ... }` (concrete method) |
| **Actual wizard character** 🧙‍♂️                  | `class Wizard extends GameCharacter`          |

---

## 🎮 Basic Abstract Class Example

```dart
abstract class GameCharacter {
  String name;
  int health = 100;

  GameCharacter(this.name);

  // Abstract method - no implementation
  void attack();

  // Concrete method - has implementation
  void showHealth() {
    print('$name has $health health remaining 💚');
  }
}
```

💡 **Key Points:**

- `abstract` = Cannot create objects directly from this class
- `void attack();` = Abstract method (no body, just a promise)
- `showHealth()` = Concrete method (has actual code)

---

## 🧙‍♂️ Creating Real Characters

### Wizard Character:

```dart
class Wizard extends GameCharacter {
  Wizard(String name) : super(name);

  @override
  void attack() {
    print('$name casts a fireball! 🔥');
  }

  void castSpell() {
    print('$name uses magic spell! ✨');
  }
}
```

### Warrior Character:

```dart
class Warrior extends GameCharacter {
  Warrior(String name) : super(name);

  @override
  void attack() {
    print('$name swings their sword! ⚔️');
  }

  void useShield() {
    print('$name blocks with shield! 🛡️');
  }
}
```

---

## 🎯 Using the Characters

```dart
void main() {
  // ❌ This won't work - can't create abstract class directly
  // GameCharacter player = GameCharacter('Hero'); // ERROR!

  // ✅ This works - create concrete classes
  Wizard merlin = Wizard('Merlin');
  Warrior arthur = Warrior('Arthur');

  merlin.showHealth();  // Merlin has 100 health remaining 💚
  merlin.attack();      // Merlin casts a fireball! 🔥
  merlin.castSpell();   // Merlin uses magic spell! ✨

  arthur.showHealth();  // Arthur has 100 health remaining 💚
  arthur.attack();      // Arthur swings their sword! ⚔️
  arthur.useShield();   // Arthur blocks with shield! 🛡️
}
```

---

## 🏗️ More Complex Example: Drawing Shapes

```dart
abstract class Shape {
  String color;

  Shape(this.color);

  // Abstract methods - must be implemented
  double calculateArea();
  void draw();

  // Concrete method - same for all shapes
  void describe() {
    print('This is a $color shape with area ${calculateArea()}');
    draw();
  }
}

class Circle extends Shape {
  double radius;

  Circle(String color, this.radius) : super(color);

  @override
  double calculateArea() {
    return 3.14159 * radius * radius;
  }

  @override
  void draw() {
    print('Drawing a circle ⭕');
  }
}

class Rectangle extends Shape {
  double width, height;

  Rectangle(String color, this.width, this.height) : super(color);

  @override
  double calculateArea() {
    return width * height;
  }

  @override
  void draw() {
    print('Drawing a rectangle ▭');
  }
}
```

### Using the Shapes:

```dart
void main() {
  Circle redCircle = Circle('red', 5.0);
  Rectangle blueRect = Rectangle('blue', 4.0, 6.0);

  redCircle.describe();
  // This is a red shape with area 78.53975
  // Drawing a circle ⭕

  blueRect.describe();
  // This is a blue shape with area 24.0
  // Drawing a rectangle ▭
}
```

---

## 🧠 Abstract vs Regular Classes

| **Abstract Class**                   | **Regular Class**                    |
| ------------------------------------ | ------------------------------------ |
| Cannot create objects directly       | Can create objects                   |
| Can have abstract methods (no body)  | All methods must have bodies         |
| Used as blueprints/templates         | Used to create actual objects        |
| Forces children to implement methods | Children can choose what to override |

---

## 🚦 Rules for Abstract Classes

### ✅ **What You CAN Do:**

```dart
abstract class Vehicle {
  String brand;                    // ✅ Properties
  Vehicle(this.brand);             // ✅ Constructors

  void startEngine();              // ✅ Abstract methods

  void honk() {                    // ✅ Concrete methods
    print('Beep beep! 📯');
  }

  static void info() {             // ✅ Static methods
    print('Vehicle information');
  }
}
```

### ❌ **What You CANNOT Do:**

```dart
void main() {
  // ❌ Cannot instantiate abstract class
  Vehicle car = Vehicle('Toyota'); // ERROR!
}

class Car extends Vehicle {
  Car(String brand) : super(brand);
  // ❌ Must implement ALL abstract methods
  // Missing startEngine() implementation = ERROR!
}
```

---

## 🏆 When to Use Abstract Classes

### 1. **Common Interface + Shared Code**

```dart
abstract class Animal {
  String name;
  Animal(this.name);

  // All animals must make sound (different for each)
  void makeSound();

  // All animals sleep the same way
  void sleep() {
    print('$name is sleeping... 😴');
  }
}
```

### 2. **Template Method Pattern**

```dart
abstract class DataProcessor {
  // Template method - defines the process
  final void process() {
    loadData();
    validateData();
    saveData();
    print('Processing complete! ✅');
  }

  // Steps that vary by implementation
  void loadData();
  void validateData();
  void saveData();
}

class CsvProcessor extends DataProcessor {
  @override
  void loadData() => print('Loading CSV file 📄');

  @override
  void validateData() => print('Validating CSV format ✓');

  @override
  void saveData() => print('Saving CSV data 💾');
}
```

### 3. **Enforcing Contracts**

```dart
abstract class PaymentProcessor {
  // Every payment method must implement these
  bool validatePayment(double amount);
  void processPayment(double amount);
  void sendReceipt();

  // Common logging for all payment methods
  void logTransaction(double amount) {
    print('Transaction logged: \$${amount.toStringAsFixed(2)}');
  }
}
```

---

## 🎨 Advanced Features

### Abstract Getters and Setters:

```dart
abstract class Account {
  // Abstract getter - must be implemented
  double get balance;

  // Abstract setter - must be implemented
  set balance(double amount);

  // Concrete method using abstract properties
  void displayBalance() {
    print('Current balance: \$${balance.toStringAsFixed(2)}');
  }
}

class SavingsAccount extends Account {
  double _balance = 0.0;

  @override
  double get balance => _balance;

  @override
  set balance(double amount) {
    if (amount >= 0) _balance = amount;
  }
}
```

### Factory Constructors in Abstract Classes:

```dart
abstract class Logger {
  void log(String message);

  factory Logger.create(String type) {
    switch (type) {
      case 'console':
        return ConsoleLogger();
      case 'file':
        return FileLogger();
      default:
        return ConsoleLogger();
    }
  }
}

class ConsoleLogger implements Logger {
  @override
  void log(String message) => print('Console: $message');
}

class FileLogger implements Logger {
  @override
  void log(String message) => print('File: $message');
}
```

---

## 🧩 Summary

| **Concept**         | **What It Means**                                           |
| ------------------- | ----------------------------------------------------------- |
| `abstract class`    | A blueprint that cannot be instantiated directly            |
| `abstract method`   | A method without implementation (just signature)            |
| `extends`           | How concrete classes inherit from abstract classes          |
| `@override`         | Annotation showing you're implementing an abstract method   |
| **Template Method** | Abstract class defines process, children fill in details    |
| **Contract**        | Abstract class forces children to implement certain methods |

---

## 🎉 Final Thoughts

**Abstract classes are like game character templates:**

- 🎯 They define **what** every character must do
- 🎨 They let each character decide **how** to do it
- 🏗️ They provide **common code** that everyone shares
- 🚦 They **enforce rules** so nothing important is forgotten

Perfect for when you know the **structure** but want **flexibility** in implementation!

> **Remember:** Abstract = "Here's the plan, now you fill in the details!" 📋✨
