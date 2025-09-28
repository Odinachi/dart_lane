# Classes and Objects in Dart

Imagine you're running a **cookie factory** 🍪!

You have a special **cookie cutter** that makes perfect chocolate chip cookies every time. The cookie cutter is your **template** - it decides:

- How big the cookies are 📏
- What shape they have 🔵
- Where the chocolate chips go 🍫

👉 In programming, a **Class** is like that cookie cutter - it's a **blueprint** for making things!

And each **cookie** you make with that cutter is an **Object** - a real thing you can eat! 😋

---

## 🍪 The Problem: Making Cookies by Hand

```dart
void main() {
  // ❌ This is tedious and repetitive!
  print('Cookie 1: Chocolate chip, round, 3 inches');
  print('Cookie 2: Chocolate chip, round, 3 inches');
  print('Cookie 3: Chocolate chip, round, 3 inches');
  // ... imagine making 100 cookies this way! 😵
}
```

**Problem**: Too much repetition! What if we want to change the size of ALL cookies? We'd have to update every single line!

---

## ✅ The Solution: Cookie Class

```dart
class Cookie {
  String flavor = 'Chocolate Chip';
  String shape = 'Round';
  int sizeInches = 3;

  void describe() {
    print('This is a $flavor cookie, $shape shape, $sizeInches inches big! 🍪');
  }

  void eat() {
    print('*munch munch* Delicious $flavor cookie! 😋');
  }
}

void main() {
  // Create actual cookies (objects) from our cookie class
  Cookie cookie1 = Cookie();
  Cookie cookie2 = Cookie();
  Cookie cookie3 = Cookie();

  cookie1.describe();
  cookie1.eat();

  cookie2.describe();
  cookie2.eat();
}
```

**Output:**

```
This is a Chocolate Chip cookie, Round shape, 3 inches big! 🍪
*munch munch* Delicious Chocolate Chip cookie! 😋
This is a Chocolate Chip cookie, Round shape, 3 inches big! 🍪
*munch munch* Delicious Chocolate Chip cookie! 😋
```

---

## 🎨 Customizing Individual Objects

```dart
class Cookie {
  String flavor = 'Plain';
  String shape = 'Round';
  int sizeInches = 3;
  bool hasIcing = false;

  void describe() {
    String icingText = hasIcing ? 'with icing' : 'no icing';
    print('🍪 $flavor cookie, $shape, $sizeInches inches, $icingText');
  }

  void eat() {
    print('😋 *crunch* This $flavor cookie is amazing!');
  }

  void addIcing() {
    hasIcing = true;
    print('✨ Added colorful icing to the $flavor cookie!');
  }
}

void main() {
  // Make different types of cookies
  Cookie cookie1 = Cookie();
  cookie1.flavor = 'Chocolate Chip';
  cookie1.shape = 'Square';

  Cookie cookie2 = Cookie();
  cookie2.flavor = 'Sugar';
  cookie2.sizeInches = 5;
  cookie2.addIcing();

  Cookie cookie3 = Cookie();
  cookie3.flavor = 'Oatmeal Raisin';
  cookie3.shape = 'Heart';
  cookie3.sizeInches = 4;

  print('=== Cookie Factory Report ===');
  cookie1.describe();
  cookie2.describe();
  cookie3.describe();

  print('\n=== Taste Test ===');
  cookie1.eat();
  cookie2.eat();
  cookie3.eat();
}
```

**Output:**

```
✨ Added colorful icing to the Sugar cookie!
=== Cookie Factory Report ===
🍪 Chocolate Chip cookie, Square, 3 inches, no icing
🍪 Sugar cookie, Round, 5 inches, with icing
🍪 Oatmeal Raisin cookie, Heart, 4 inches, no icing

=== Taste Test ===
😋 *crunch* This Chocolate Chip cookie is amazing!
😋 *crunch* This Sugar cookie is amazing!
😋 *crunch* This Oatmeal Raisin cookie is amazing!
```

---

## ⚡ Constructors: The Fast Cookie Machine

Instead of setting each property one by one, use a **constructor** to build cookies instantly!

```dart
class Cookie {
  String flavor;
  String shape;
  int sizeInches;
  bool hasIcing;

  // Constructor - builds the cookie all at once!
  Cookie(this.flavor, this.shape, this.sizeInches, this.hasIcing);

  void describe() {
    String icingText = hasIcing ? 'with icing' : 'no icing';
    print('🍪 $flavor cookie, $shape, $sizeInches inches, $icingText');
  }

  void eat() {
    print('😋 *nom nom* This $flavor cookie hits the spot!');
  }
}

void main() {
  // Build cookies super fast with constructors!
  Cookie cookie1 = Cookie('Chocolate Chip', 'Round', 4, false);
  Cookie cookie2 = Cookie('Sugar', 'Star', 3, true);
  Cookie cookie3 = Cookie('Peanut Butter', 'Square', 5, false);

  print('🏭 Fresh cookies from the factory:');
  cookie1.describe();
  cookie2.describe();
  cookie3.describe();

  print('\n🍽️ Time to eat!');
  cookie1.eat();
  cookie2.eat();
  cookie3.eat();
}
```

**Output:**

```
🏭 Fresh cookies from the factory:
🍪 Chocolate Chip cookie, Round, 4 inches, no icing
🍪 Sugar cookie, Star, 3 inches, with icing
🍪 Peanut Butter cookie, Square, 5 inches, no icing

🍽️ Time to eat!
😋 *nom nom* This Chocolate Chip cookie hits the spot!
😋 *nom nom* This Sugar cookie hits the spot!
😋 *nom nom* This Peanut Butter cookie hits the spot!
```

---

## 🐕 Different Example: Dog Class

Let's make a different kind of class - Dogs!

```dart
class Dog {
  String name;
  String breed;
  int age;
  String color;

  // Constructor
  Dog(this.name, this.breed, this.age, this.color);

  void bark() {
    print('🐕 $name says: Woof! Woof!');
  }

  void introduce() {
    print('🐶 Hi! I\'m $name, a $color $breed, and I\'m $age years old!');
  }

  void play() {
    print('🎾 $name is playing fetch! So much fun!');
  }

  void sleep() {
    print('😴 $name is taking a nap... Zzz...');
  }
}

void main() {
  // Create a pack of dogs!
  Dog dog1 = Dog('Buddy', 'Golden Retriever', 3, 'Golden');
  Dog dog2 = Dog('Luna', 'Husky', 2, 'Black and White');
  Dog dog3 = Dog('Max', 'Bulldog', 5, 'Brown');

  print('🏠 Welcome to the Dog Park!\n');

  // Each dog introduces themselves
  dog1.introduce();
  dog2.introduce();
  dog3.introduce();

  print('\n🎉 Playtime!');
  dog1.bark();
  dog1.play();

  dog2.bark();
  dog2.play();

  dog3.bark();
  dog3.sleep(); // Max is tired!
}
```

**Output:**

```
🏠 Welcome to the Dog Park!

🐶 Hi! I'm Buddy, a Golden Golden Retriever, and I'm 3 years old!
🐶 Hi! I'm Luna, a Black and White Husky, and I'm 2 years old!
🐶 Hi! I'm Max, a Brown Bulldog, and I'm 5 years old!

🎉 Playtime!
🐕 Buddy says: Woof! Woof!
🎾 Buddy is playing fetch! So much fun!
🐕 Luna says: Woof! Woof!
🎾 Luna is playing fetch! So much fun!
🐕 Max says: Woof! Woof!
😴 Max is taking a nap... Zzz...
```

---

## 🚗 Car Example with Methods

```dart
class Car {
  String brand;
  String model;
  String color;
  int speed;
  bool isEngineOn;

  Car(this.brand, this.model, this.color) {
    speed = 0;
    isEngineOn = false;
  }

  void startEngine() {
    if (!isEngineOn) {
      isEngineOn = true;
      print('🔥 $brand $model engine started! Vroom vroom!');
    } else {
      print('⚠️ Engine is already running!');
    }
  }

  void stopEngine() {
    if (isEngineOn) {
      isEngineOn = false;
      speed = 0;
      print('🔇 $brand $model engine stopped.');
    }
  }

  void accelerate() {
    if (isEngineOn) {
      speed += 10;
      print('🚗💨 $color $brand speeding up! Current speed: ${speed}mph');
    } else {
      print('❌ Can\'t drive without starting the engine first!');
    }
  }

  void brake() {
    if (speed > 0) {
      speed -= 15;
      if (speed < 0) speed = 0;
      print('🛑 $brand slowing down... Current speed: ${speed}mph');
    }
  }

  void honk() {
    print('📯 $brand $model: BEEP BEEP! 🚨');
  }
}

void main() {
  // Create some cars
  Car car1 = Car('Toyota', 'Camry', 'Red');
  Car car2 = Car('Tesla', 'Model 3', 'White');

  print('🏁 Race Day!\n');

  // Car 1's journey
  print('=== Red Toyota ===');
  car1.accelerate(); // Try to drive without starting engine
  car1.startEngine();
  car1.accelerate();
  car1.accelerate();
  car1.honk();
  car1.brake();
  car1.stopEngine();

  print('\n=== White Tesla ===');
  car2.startEngine();
  car2.accelerate();
  car2.accelerate();
  car2.accelerate();
  car2.honk();
  car2.brake();
  car2.brake();
  car2.stopEngine();
}
```

**Output:**

```
🏁 Race Day!

=== Red Toyota ===
❌ Can't drive without starting the engine first!
🔥 Toyota Camry engine started! Vroom vroom!
🚗💨 Red Toyota speeding up! Current speed: 10mph
🚗💨 Red Toyota speeding up! Current speed: 20mph
📯 Toyota Camry: BEEP BEEP! 🚨
🛑 Toyota slowing down... Current speed: 5mph
🔇 Toyota Camry engine stopped.

=== White Tesla ===
🔥 Tesla Model 3 engine started! Vroom vroom!
🚗💨 White Tesla speeding up! Current speed: 10mph
🚗💨 White Tesla speeding up! Current speed: 20mph
🚗💨 White Tesla speeding up! Current speed: 30mph
📯 Tesla Model 3: BEEP BEEP! 🚨
🛑 Tesla slowing down... Current speed: 15mph
🛑 Tesla slowing down... Current speed: 0mph
🔇 Tesla Model 3 engine stopped.
```

---

## 📱 Smartphone Class Example

```dart
class Smartphone {
  String brand;
  String model;
  int batteryLevel;
  bool isOn;
  List<String> installedApps;

  Smartphone(this.brand, this.model) {
    batteryLevel = 100;
    isOn = false;
    installedApps = ['Phone', 'Messages', 'Settings'];
  }

  void powerOn() {
    if (!isOn) {
      isOn = true;
      print('📱 $brand $model powered on! Battery: $batteryLevel%');
    } else {
      print('📱 Phone is already on!');
    }
  }

  void powerOff() {
    if (isOn) {
      isOn = false;
      print('📱 $brand $model shutting down...');
    }
  }

  void installApp(String appName) {
    if (isOn) {
      installedApps.add(appName);
      batteryLevel -= 2;
      print('📲 Installed $appName! Battery: $batteryLevel%');
    } else {
      print('❌ Turn on phone first to install apps!');
    }
  }

  void usePhone(int minutes) {
    if (isOn) {
      batteryLevel -= minutes * 3;
      if (batteryLevel < 0) batteryLevel = 0;
      print('📞 Used phone for $minutes minutes. Battery: $batteryLevel%');

      if (batteryLevel <= 10) {
        print('🔋 Low battery warning!');
      }
    }
  }

  void charge() {
    batteryLevel = 100;
    print('🔌 $brand $model fully charged! Battery: 100%');
  }

  void showApps() {
    if (isOn) {
      print('📱 Installed apps: ${installedApps.join(', ')}');
    }
  }
}

void main() {
  // Create phones
  Smartphone phone1 = Smartphone('iPhone', '15');
  Smartphone phone2 = Smartphone('Samsung', 'Galaxy S24');

  print('📱 New Phones Unboxed!\n');

  // Use iPhone
  print('=== iPhone Demo ===');
  phone1.powerOn();
  phone1.installApp('Instagram');
  phone1.installApp('TikTok');
  phone1.showApps();
  phone1.usePhone(15);
  phone1.usePhone(20);
  phone1.charge();
  phone1.powerOff();

  print('\n=== Samsung Demo ===');
  phone2.installApp('YouTube'); // Try without turning on
  phone2.powerOn();
  phone2.installApp('YouTube');
  phone2.installApp('Spotify');
  phone2.showApps();
  phone2.usePhone(25);
}
```

**Output:**

```
📱 New Phones Unboxed!

=== iPhone Demo ===
📱 iPhone 15 powered on! Battery: 100%
📲 Installed Instagram! Battery: 98%
📲 Installed TikTok! Battery: 96%
📱 Installed apps: Phone, Messages, Settings, Instagram, TikTok
📞 Used phone for 15 minutes. Battery: 51%
📞 Used phone for 20 minutes. Battery: 0%
🔋 Low battery warning!
🔌 iPhone 15 fully charged! Battery: 100%
📱 iPhone 15 shutting down...

=== Samsung Demo ===
❌ Turn on phone first to install apps!
📱 Samsung Galaxy S24 powered on! Battery: 100%
📲 Installed YouTube! Battery: 98%
📲 Installed Spotify! Battery: 96%
📱 Installed apps: Phone, Messages, Settings, YouTube, Spotify
📞 Used phone for 25 minutes. Battery: 21%
```

---

## 🧠 Key Concepts Summary

### Class vs Object

| Class                         | Object                              |
| ----------------------------- | ----------------------------------- |
| 🏗️ **Blueprint/Template**     | 🏠 **Actual Thing**                 |
| `class Cookie { ... }`        | `Cookie myCookie = Cookie();`       |
| Defines what objects CAN have | Has actual values and can DO things |
| Like a cookie cutter          | Like an actual cookie               |

### Parts of a Class

```dart
class ClassName {
  // Properties (what the object HAS)
  String name;
  int age;

  // Constructor (how to BUILD the object)
  ClassName(this.name, this.age);

  // Methods (what the object can DO)
  void doSomething() {
    print('Doing something!');
  }
}
```

---

## 🎯 When to Use Classes?

**✅ Good for Classes:**

- When you need multiple similar things (users, products, cars)
- When things have both properties AND behaviors
- When you want to organize related data and functions

**❌ Not everything needs a class:**

- Simple calculations: `int add(int a, int b) => a + b;`
- One-time tasks: Just use regular functions
- Static utilities: Use regular functions

---

## 🚀 Practice Challenge

Try creating your own class! Pick one:

1. **Pizza Class**: flavor, size, price, bake(), eat()
2. **Student Class**: name, grade, study(), takeTest()
3. **Robot Class**: name, battery, move(), speak()

---

## 🎉 Remember This!

Classes and Objects are like **LEGO instruction manuals** 📖:

- **Class** = The instruction manual (shows you HOW to build)
- **Object** = The actual LEGO creation you build
- You can use one manual to build many different things!
- Each creation can be customized (different colors, sizes)

Once you understand this, you can build amazing apps with lots of interactive objects! 🎮✨
