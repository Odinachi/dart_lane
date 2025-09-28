# Sealed Classes in Dart

Imagine you're creating a **special club** 🏛️ with very **exclusive membership**!

Your club has a strict rule: **"Only these specific types of members are allowed!"**

- 🦸‍♂️ **Superheroes** (like Batman, Superman)
- 🧙‍♂️ **Wizards** (like Gandalf, Harry Potter)
- 👑 **Royalty** (like Kings, Queens)

**Nobody else** can join - not pirates, not robots, not aliens! The membership list is **sealed** forever!

👉 **Sealed classes** work exactly like this exclusive club:

> They define a **fixed set of subtypes** that are **all known at compile time**, and **no one else** can extend the family!

---

## 🚫 The Problem: Uncontrolled Inheritance

```dart
// ❌ With regular classes, anyone can extend!
abstract class Animal {
  void makeSound();
}

class Dog extends Animal {
  void makeSound() => print('Woof!');
}

class Cat extends Animal {
  void makeSound() => print('Meow!');
}

// ❌ Someone else can add anything!
class Alien extends Animal {  // Wait, what?!
  void makeSound() => print('Bzzzzt!');
}

class Robot extends Animal {  // This doesn't make sense!
  void makeSound() => print('Beep beep!');
}
```

**Problems:**

- **No control** over who extends your class 😵
- **Unpredictable subtypes** can appear anywhere 🤷‍♀️
- **Pattern matching** becomes impossible 🚫
- **Design intent** gets lost 📋

---

## ✅ The Solution: Sealed Classes

```dart
// ✅ Sealed class - only these types allowed!
sealed class Animal {
  const Animal();
}

class Dog extends Animal {
  const Dog();
  void bark() => print('🐕 Woof! Woof!');
}

class Cat extends Animal {
  const Cat();
  void meow() => print('🐱 Meow! Purr!');
}

class Bird extends Animal {
  const Bird();
  void chirp() => print('🐦 Tweet! Chirp!');
}

// ❌ This would cause a compile error if in a different file!
// class Fish extends Animal { } // ERROR: Cannot extend sealed class!

void handleAnimal(Animal animal) {
  // ✅ Dart knows ALL possible types!
  switch (animal) {
    case Dog():
      print('This is a dog!');
      animal.bark();
    case Cat():
      print('This is a cat!');
      animal.meow();
    case Bird():
      print('This is a bird!');
      animal.chirp();
    // ✅ No default needed - all cases covered!
  }
}

void main() {
  List<Animal> animals = [Dog(), Cat(), Bird()];

  print('🐾 ANIMAL SANCTUARY 🐾\n');

  for (Animal animal in animals) {
    handleAnimal(animal);
    print('');
  }
}
```

**Output:**

```
🐾 ANIMAL SANCTUARY 🐾

This is a dog!
🐕 Woof! Woof!

This is a cat!
🐱 Meow! Purr!

This is a bird!
🐦 Tweet! Chirp!
```

**Amazing!** Dart **guarantees** that only Dog, Cat, and Bird can be Animals!

---

## 🎮 Gaming Example: Player Actions

```dart
sealed class PlayerAction {
  const PlayerAction();
}

class Move extends PlayerAction {
  final int x, y;
  const Move(this.x, this.y);
}

class Attack extends PlayerAction {
  final String target;
  final int damage;
  const Attack(this.target, this.damage);
}

class UseItem extends PlayerAction {
  final String itemName;
  const UseItem(this.itemName);
}

class Rest extends PlayerAction {
  const Rest();
}

class GameEngine {
  void processAction(PlayerAction action) {
    switch (action) {
      case Move():
        print('🚶 Moving to position (${action.x}, ${action.y})');

      case Attack():
        print('⚔️ Attacking ${action.target} for ${action.damage} damage!');

      case UseItem():
        print('🎒 Using ${action.itemName} from inventory');

      case Rest():
        print('😴 Resting to restore health and mana');
    }
    // ✅ Compiler ensures ALL cases are handled!
  }

  void validateAction(PlayerAction action) {
    String actionType = switch (action) {
      Move() => 'Movement',
      Attack() => 'Combat',
      UseItem() => 'Inventory',
      Rest() => 'Recovery',
    };

    print('📋 Processing $actionType action...');
  }
}

void main() {
  print('🎮 RPG GAME ENGINE 🎮\n');

  GameEngine engine = GameEngine();

  List<PlayerAction> actions = [
    Move(10, 5),
    Attack('Goblin', 25),
    UseItem('Health Potion'),
    Rest(),
    Move(15, 8),
    Attack('Dragon', 50),
  ];

  for (PlayerAction action in actions) {
    engine.validateAction(action);
    engine.processAction(action);
    print('✅ Action completed!\n');
  }
}
```

**Output:**

```
🎮 RPG GAME ENGINE 🎮

📋 Processing Movement action...
🚶 Moving to position (10, 5)
✅ Action completed!

📋 Processing Combat action...
⚔️ Attacking Goblin for 25 damage!
✅ Action completed!

📋 Processing Inventory action...
🎒 Using Health Potion from inventory
✅ Action completed!

📋 Processing Recovery action...
😴 Resting to restore health and mana
✅ Action completed!

📋 Processing Movement action...
🚶 Moving to position (15, 8)
✅ Action completed!

📋 Processing Combat action...
⚔️ Attacking Dragon for 50 damage!
✅ Action completed!
```

---

## 💰 Payment System Example

```dart
sealed class PaymentMethod {
  const PaymentMethod();
}

class CreditCard extends PaymentMethod {
  final String cardNumber;
  final String holderName;
  final String expiryDate;

  const CreditCard(this.cardNumber, this.holderName, this.expiryDate);
}

class PayPal extends PaymentMethod {
  final String email;

  const PayPal(this.email);
}

class BankTransfer extends PaymentMethod {
  final String accountNumber;
  final String routingNumber;

  const BankTransfer(this.accountNumber, this.routingNumber);
}

class Cash extends PaymentMethod {
  final double amount;

  const Cash(this.amount);
}

class PaymentProcessor {
  void processPayment(PaymentMethod method, double amount) {
    print('💳 PROCESSING PAYMENT OF \$${amount.toStringAsFixed(2)}');
    print('─' * 40);

    switch (method) {
      case CreditCard():
        print('💳 Credit Card Payment');
        print('   Card: **** **** **** ${method.cardNumber.substring(12)}');
        print('   Holder: ${method.holderName}');
        print('   Expiry: ${method.expiryDate}');
        print('🔒 Secure transaction processing...');

      case PayPal():
        print('🅿️ PayPal Payment');
        print('   Account: ${method.email}');
        print('📧 Sending payment confirmation email...');

      case BankTransfer():
        print('🏦 Bank Transfer');
        print('   Account: *****${method.accountNumber.substring(5)}');
        print('   Routing: ${method.routingNumber}');
        print('⏳ Processing transfer (2-3 business days)...');

      case Cash():
        print('💵 Cash Payment');
        print('   Amount tendered: \$${method.amount.toStringAsFixed(2)}');
        double change = method.amount - amount;
        if (change > 0) {
          print('   Change due: \$${change.toStringAsFixed(2)}');
        }
    }

    print('✅ Payment successful!\n');
  }

  String getPaymentDescription(PaymentMethod method) {
    return switch (method) {
      CreditCard() => '💳 ${method.holderName}\'s Credit Card',
      PayPal() => '🅿️ PayPal (${method.email})',
      BankTransfer() => '🏦 Bank Transfer',
      Cash() => '💵 Cash Payment',
    };
  }

  double getProcessingFee(PaymentMethod method, double amount) {
    return switch (method) {
      CreditCard() => amount * 0.029, // 2.9% fee
      PayPal() => amount * 0.034,     // 3.4% fee
      BankTransfer() => 1.50,         // Flat $1.50 fee
      Cash() => 0.0,                  // No fee for cash
    };
  }
}

void main() {
  print('💰 PAYMENT PROCESSING SYSTEM 💰\n');

  PaymentProcessor processor = PaymentProcessor();

  List<(PaymentMethod, double)> transactions = [
    (CreditCard('4532123456789012', 'Alice Johnson', '12/25'), 99.99),
    (PayPal('bob@email.com'), 45.50),
    (BankTransfer('1234567890', '021000021'), 200.00),
    (Cash(25.00), 19.99),
  ];

  double totalRevenue = 0;
  double totalFees = 0;

  for (var (method, amount) in transactions) {
    print('📋 Payment method: ${processor.getPaymentDescription(method)}');

    double fee = processor.getProcessingFee(method, amount);
    print('💸 Processing fee: \$${fee.toStringAsFixed(2)}');

    processor.processPayment(method, amount);

    totalRevenue += amount;
    totalFees += fee;
  }

  print('📊 DAILY SUMMARY');
  print('═' * 30);
  print('💰 Total Revenue: \$${totalRevenue.toStringAsFixed(2)}');
  print('💸 Total Fees: \$${totalFees.toStringAsFixed(2)}');
  print('💎 Net Income: \$${(totalRevenue - totalFees).toStringAsFixed(2)}');
}
```

---

## 🌦️ Weather System Example

```dart
sealed class WeatherCondition {
  const WeatherCondition();
}

class Sunny extends WeatherCondition {
  final int temperature;
  final int uvIndex;

  const Sunny(this.temperature, this.uvIndex);
}

class Rainy extends WeatherCondition {
  final int temperature;
  final double rainfallMM;
  final bool hasThunder;

  const Rainy(this.temperature, this.rainfallMM, this.hasThunder);
}

class Snowy extends WeatherCondition {
  final int temperature;
  final double snowfallCM;
  final int windSpeedKmH;

  const Snowy(this.temperature, this.snowfallCM, this.windSpeedKmH);
}

class Cloudy extends WeatherCondition {
  final int temperature;
  final int cloudCoverPercent;

  const Cloudy(this.temperature, this.cloudCoverPercent);
}

class WeatherService {
  String getWeatherEmoji(WeatherCondition condition) {
    return switch (condition) {
      Sunny() => '☀️',
      Rainy() when condition.hasThunder => '⛈️',
      Rainy() => '🌧️',
      Snowy() => '❄️',
      Cloudy() when condition.cloudCoverPercent > 80 => '☁️',
      Cloudy() => '⛅',
    };
  }

  String getOutfitRecommendation(WeatherCondition condition) {
    return switch (condition) {
      Sunny() when condition.temperature > 25 => 'T-shirt and shorts 👕🩳',
      Sunny() when condition.temperature > 15 => 'Light jacket 🧥',
      Sunny() => 'Warm coat and sun protection 🧥😎',

      Rainy() when condition.hasThunder => 'Stay indoors! If you must go out: raincoat and umbrella ☔',
      Rainy() => 'Raincoat and waterproof shoes ☔👢',

      Snowy() when condition.windSpeedKmH > 30 => 'Heavy winter coat, scarf, and goggles 🧥🧣🥽',
      Snowy() => 'Winter coat, boots, and warm hat 🧥👢🧢',

      Cloudy() => 'Light layers - might change! 👔',
    };
  }

  List<String> getActivitySuggestions(WeatherCondition condition) {
    return switch (condition) {
      Sunny() when condition.temperature > 20 => [
        '🏖️ Go to the beach',
        '🚴 Bike riding',
        '🧺 Picnic in the park',
        '🏊 Swimming',
      ],

      Sunny() => [
        '🚶 Take a walk',
        '📸 Photography',
        '☕ Outdoor café',
      ],

      Rainy() when !condition.hasThunder => [
        '📚 Read a book indoors',
        '🎬 Watch movies',
        '🍪 Baking',
        '🖼️ Visit a museum',
      ],

      Rainy() => [
        '🏠 Stay inside',
        '🎮 Play games',
        '📞 Call friends',
      ],

      Snowy() => [
        '⛷️ Skiing or snowboarding',
        '☃️ Build a snowman',
        '🔥 Cozy up by the fire',
        '🎿 Winter sports',
      ],

      Cloudy() => [
        '🚶 Walking',
        '📷 Photography',
        '🛍️ Shopping',
        '☕ Café hopping',
      ],
    };
  }

  void displayWeatherReport(String city, WeatherCondition condition) {
    String emoji = getWeatherEmoji(condition);

    print('$emoji WEATHER REPORT FOR $city $emoji');
    print('═' * 40);

    switch (condition) {
      case Sunny():
        print('🌞 Sunny and bright!');
        print('🌡️ Temperature: ${condition.temperature}°C');
        print('☀️ UV Index: ${condition.uvIndex}/10');

      case Rainy():
        print('🌧️ ${condition.hasThunder ? 'Thunderstorms' : 'Rainy'} weather');
        print('🌡️ Temperature: ${condition.temperature}°C');
        print('💧 Rainfall: ${condition.rainfallMM}mm');
        if (condition.hasThunder) {
          print('⚡ Thunder and lightning expected');
        }

      case Snowy():
        print('❄️ Snow is falling!');
        print('🌡️ Temperature: ${condition.temperature}°C');
        print('❄️ Snowfall: ${condition.snowfallCM}cm');
        print('💨 Wind speed: ${condition.windSpeedKmH} km/h');

      case Cloudy():
        print('☁️ Cloudy skies');
        print('🌡️ Temperature: ${condition.temperature}°C');
        print('☁️ Cloud cover: ${condition.cloudCoverPercent}%');
    }

    print('\n👔 OUTFIT SUGGESTION:');
    print('${getOutfitRecommendation(condition)}');

    print('\n🎯 ACTIVITY SUGGESTIONS:');
    List<String> activities = getActivitySuggestions(condition);
    for (int i = 0; i < activities.length; i++) {
      print('   ${i + 1}. ${activities[i]}');
    }

    print('\n');
  }
}

void main() {
  print('🌦️ WEATHER FORECAST SERVICE 🌦️\n');

  WeatherService service = WeatherService();

  List<(String, WeatherCondition)> forecasts = [
    ('New York', Sunny(28, 8)),
    ('London', Rainy(15, 5.2, false)),
    ('Tokyo', Cloudy(22, 60)),
    ('Moscow', Snowy(-5, 15.0, 25)),
    ('Miami', Sunny(32, 9)),
    ('Seattle', Rainy(12, 12.5, true)),
  ];

  for (var (city, condition) in forecasts) {
    service.displayWeatherReport(city, condition);
  }
}
```

---

## 🚨 Error Handling System

```dart
sealed class Result<T> {
  const Result();
}

class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

class Failure<T> extends Result<T> {
  final String message;
  final int? errorCode;
  final Exception? exception;

  const Failure(this.message, {this.errorCode, this.exception});
}

class Loading<T> extends Result<T> {
  final double progress;
  const Loading(this.progress);
}

class ApiService {
  Future<Result<Map<String, dynamic>>> fetchUserData(int userId) async {
    // Simulate loading
    await Future.delayed(Duration(milliseconds: 500));

    // Simulate different scenarios
    if (userId <= 0) {
      return Failure('Invalid user ID', errorCode: 400);
    }

    if (userId == 404) {
      return Failure('User not found', errorCode: 404);
    }

    if (userId == 500) {
      return Failure('Server error', errorCode: 500,
                    exception: Exception('Database connection failed'));
    }

    // Success case
    return Success({
      'id': userId,
      'name': 'User $userId',
      'email': 'user$userId@example.com',
      'score': (userId * 10) % 100,
    });
  }

  Future<Result<List<String>>> fetchUserPosts(int userId) async {
    await Future.delayed(Duration(milliseconds: 300));

    if (userId == 999) {
      return Failure('Rate limit exceeded', errorCode: 429);
    }

    return Success([
      'Post 1 by user $userId',
      'Post 2 by user $userId',
      'Another great post!',
    ]);
  }
}

class UserInterface {
  void displayResult<T>(Result<T> result, String operation) {
    print('🔄 Operation: $operation');
    print('─' * 30);

    switch (result) {
      case Success<T>():
        print('✅ SUCCESS!');
        print('📦 Data: ${result.data}');

      case Failure<T>():
        print('❌ FAILURE!');
        print('💬 Message: ${result.message}');
        if (result.errorCode != null) {
          print('🔢 Error Code: ${result.errorCode}');
        }
        if (result.exception != null) {
          print('⚠️ Exception: ${result.exception}');
        }

      case Loading<T>():
        print('⏳ LOADING...');
        print('📊 Progress: ${(result.progress * 100).toStringAsFixed(1)}%');
    }

    print('');
  }

  String getResultSummary<T>(Result<T> result) {
    return switch (result) {
      Success<T>() => '✅ Success',
      Failure<T>() => '❌ Error: ${result.message}',
      Loading<T>() => '⏳ ${(result.progress * 100).toInt()}%',
    };
  }

  bool isResultReady<T>(Result<T> result) {
    return switch (result) {
      Success<T>() || Failure<T>() => true,
      Loading<T>() => false,
    };
  }
}

void main() async {
  print('🌐 API TESTING SYSTEM 🌐\n');

  ApiService api = ApiService();
  UserInterface ui = UserInterface();

  List<int> testUserIds = [1, 404, 500, -1, 999, 42];

  for (int userId in testUserIds) {
    print('👤 Testing User ID: $userId');
    print('═' * 40);

    // Test user data fetch
    Result<Map<String, dynamic>> userResult = await api.fetchUserData(userId);
    ui.displayResult(userResult, 'Fetch User Data');

    // Only fetch posts if user data was successful
    if (userResult is Success) {
      Result<List<String>> postsResult = await api.fetchUserPosts(userId);
      ui.displayResult(postsResult, 'Fetch User Posts');

      // Show combined summary
      print('📋 Summary:');
      print('   User Data: ${ui.getResultSummary(userResult)}');
      print('   Posts: ${ui.getResultSummary(postsResult)}');
    }

    print('');
  }

  // Test loading state
  print('⏳ SIMULATING LOADING STATES');
  print('═' * 40);

  List<Result<String>> loadingStates = [
    Loading(0.0),
    Loading(0.25),
    Loading(0.75),
    Loading(1.0),
    Success('Operation completed!'),
  ];

  for (Result<String> state in loadingStates) {
    print('Status: ${ui.getResultSummary(state)} | Ready: ${ui.isResultReady(state)}');
  }
}
```

---

## 🧠 Key Benefits of Sealed Classes

### 1. **Exhaustive Pattern Matching**

```dart
sealed class Status {
  const Status();
}

class Pending extends Status {
  const Pending();
}

class InProgress extends Status {
  final double progress;
  const InProgress(this.progress);
}

class Completed extends Status {
  final DateTime completedAt;
  const Completed(this.completedAt);
}

class Failed extends Status {
  final String reason;
  const Failed(this.reason);
}

String getStatusMessage(Status status) {
  // ✅ Compiler enforces ALL cases are handled
  return switch (status) {
    Pending() => 'Waiting to start...',
    InProgress() => 'In progress: ${(status.progress * 100).toInt()}%',
    Completed() => 'Done at ${status.completedAt}',
    Failed() => 'Failed: ${status.reason}',
  };
  // ✅ No default case needed - all possibilities covered!
}
```

### 2. **Type Safety**

```dart
// ✅ Sealed classes prevent unexpected subtypes
sealed class DatabaseResult {
  const DatabaseResult();
}

class QuerySuccess extends DatabaseResult {
  final List<Map<String, dynamic>> rows;
  const QuerySuccess(this.rows);
}

class QueryError extends DatabaseResult {
  final String error;
  const QueryError(this.error);
}

// ❌ This would be caught at compile time:
// class UnknownResult extends DatabaseResult { } // ERROR!
```

### 3. **Better IDE Support**

```dart
sealed class UiState {
  const UiState();
}

class Loading extends UiState {
  const Loading();
}

class Loaded extends UiState {
  final String data;
  const Loaded(this.data);
}

class Error extends UiState {
  final String message;
  const Error(this.message);
}

void handleState(UiState state) {
  switch (state) {
    // ✅ IDE will suggest all possible cases
    // ✅ IDE will warn if you miss a case
    // ✅ IDE will help with autocomplete
  }
}
```

---

## 📋 Sealed Classes vs Other Approaches

| Feature                 | Sealed Classes | Abstract Classes | Enums      |
| ----------------------- | -------------- | ---------------- | ---------- |
| **Fixed subtypes**      | ✅ Yes         | ❌ No            | ✅ Yes     |
| **Can hold data**       | ✅ Yes         | ✅ Yes           | ⚠️ Limited |
| **Exhaustive matching** | ✅ Yes         | ❌ No            | ✅ Yes     |
| **Prevents extension**  | ✅ Yes         | ❌ No            | ✅ Yes     |
| **Complex behavior**    | ✅ Yes         | ✅ Yes           | ❌ No      |

---

## 🎯 When to Use Sealed Classes

**✅ Perfect for:**

- **State management** (loading, success, error states)
- **API responses** (success, failure, timeout)
- **User actions** (click, swipe, type)
- **Game events** (move, attack, defend)
- **Payment methods** (card, paypal, bank transfer)

**❌ Not ideal for:**

- **Open hierarchies** where you expect extensions
- **Simple value types** (use enums instead)
- **Complex inheritance** (use regular abstract classes)

---

## 🚀 Practice Challenges

Try creating sealed classes for these scenarios:

1. **📱 App Navigation**: Screen, Dialog, BottomSheet
2. **🛒 Order Status**: Placed, Processing, Shipped, Delivered, Cancelled
3. **🎵 Media Player**: Playing, Paused, Stopped, Buffering
4. **🌐 Network Request**: Pending, Success, Timeout, NetworkError

---

## 🎉 Remember This!

Sealed classes are like **VIP membership clubs** 🏛️:

- **🔒 Exclusive membership**: Only specific types allowed
- **📋 Complete guest list**: You know exactly who can join
- **🛡️ No gate-crashers**: Nobody else can sneak in
- **🎯 Perfect planning**: You can plan for every possible member

**The Magic**: Sealed classes give you **complete control** and **guaranteed safety** - you know exactly what types you're dealing with, and the compiler helps you handle them all correctly!

> **Think of it like**: "I'm creating a special club with exactly these 4 types of members, and I want to make sure I have activities planned for each type!" 🎪✨

Sealed classes make your code **predictable**, **safe**, and **easy to maintain**! 🚀
