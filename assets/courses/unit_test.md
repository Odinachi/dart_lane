# Unit Testing in Dart

Imagine you're a **quality inspector** at a cookie factory 🍪🏭!

Before any cookies reach customers, you need to check:

- Are they the **right size**? 📏
- Do they **taste correct**? 👅
- Are they **properly baked**? 🔥
- Do they have the **right ingredients**? 🧂

You test each cookie **individually** to make sure it's perfect before it goes into the box!

👉 **Unit Testing** works exactly like this quality inspection:

> It **automatically checks** that each small piece of your code works correctly, catching bugs before users ever see them!

---

## 🚫 The Problem: Code Without Tests

```dart
// ❌ Code without tests - scary!
int add(int a, int b) {
  return a + b; // What if this has a bug?
}

int multiply(int a, int b) {
  return a * b; // How do we know this works?
}

void main() {
  print(add(2, 3)); // Works now, but what about edge cases?
  print(multiply(4, 5)); // Seems fine, but are we sure?
}
```

**Problems:**

- No way to verify code works correctly! 🤷‍♀️
- Bugs only discovered by users! 😱
- Changes might break existing features! 💥
- No confidence when refactoring! 😰

---

## ✅ The Solution: Automated Testing

```dart
// calculator.dart - Our code to test
int add(int a, int b) {
  return a + b;
}

int multiply(int a, int b) {
  return a * b;
}

int divide(int a, int b) {
  if (b == 0) {
    throw ArgumentError('Cannot divide by zero!');
  }
  return a ~/ b;
}
```

```dart
// test/calculator_test.dart - Our tests
import 'package:test/test.dart';
import '../calculator.dart';

void main() {
  print('🧪 RUNNING CALCULATOR TESTS 🧪\n');

  group('Calculator Tests', () {
    test('add() should return correct sum', () {
      // Arrange
      int a = 2;
      int b = 3;

      // Act
      int result = add(a, b);

      // Assert
      expect(result, equals(5));
      print('✅ Addition test passed: $a + $b = $result');
    });

    test('multiply() should return correct product', () {
      // Arrange
      int a = 4;
      int b = 5;

      // Act
      int result = multiply(a, b);

      // Assert
      expect(result, equals(20));
      print('✅ Multiplication test passed: $a × $b = $result');
    });

    test('divide() should handle division by zero', () {
      // Arrange
      int a = 10;
      int b = 0;

      // Act & Assert
      expect(() => divide(a, b), throwsArgumentError);
      print('✅ Division by zero test passed: properly throws error');
    });

    test('divide() should return correct quotient', () {
      // Arrange
      int a = 15;
      int b = 3;

      // Act
      int result = divide(a, b);

      // Assert
      expect(result, equals(5));
      print('✅ Division test passed: $a ÷ $b = $result');
    });
  });
}
```

**Output:**

```
🧪 RUNNING CALCULATOR TESTS 🧪

✅ Addition test passed: 2 + 3 = 5
✅ Multiplication test passed: 4 × 5 = 20
✅ Division by zero test passed: properly throws error
✅ Division test passed: 15 ÷ 3 = 5

All tests passed! ✨
```

**Amazing!** Now we know our code works correctly! 🎉

---

## 🎮 Gaming Example: Player Stats Testing

```dart
// player.dart - Game player class
class Player {
  String name;
  int health;
  int maxHealth;
  int level;
  int experience;
  List<String> inventory;

  Player(this.name, {this.health = 100, this.level = 1, this.experience = 0})
      : maxHealth = health,
        inventory = [];

  void takeDamage(int damage) {
    if (damage < 0) {
      throw ArgumentError('Damage cannot be negative');
    }
    health -= damage;
    if (health < 0) health = 0;
  }

  void heal(int amount) {
    if (amount < 0) {
      throw ArgumentError('Heal amount cannot be negative');
    }
    health += amount;
    if (health > maxHealth) health = maxHealth;
  }

  void addExperience(int xp) {
    if (xp < 0) {
      throw ArgumentError('Experience cannot be negative');
    }
    experience += xp;

    // Level up every 1000 XP
    int newLevel = (experience ~/ 1000) + 1;
    if (newLevel > level) {
      level = newLevel;
      maxHealth += 20;
      health = maxHealth; // Full heal on level up
    }
  }

  void addToInventory(String item) {
    if (inventory.length >= 10) {
      throw StateError('Inventory is full!');
    }
    inventory.add(item);
  }

  bool get isDead => health <= 0;
  bool get isInventoryFull => inventory.length >= 10;
}
```

```dart
// test/player_test.dart - Comprehensive player tests
import 'package:test/test.dart';
import '../player.dart';

void main() {
  print('🎮 RUNNING PLAYER TESTS 🎮\n');

  group('Player Creation Tests', () {
    test('should create player with default values', () {
      // Arrange & Act
      Player player = Player('TestHero');

      // Assert
      expect(player.name, equals('TestHero'));
      expect(player.health, equals(100));
      expect(player.maxHealth, equals(100));
      expect(player.level, equals(1));
      expect(player.experience, equals(0));
      expect(player.inventory, isEmpty);
      expect(player.isDead, isFalse);

      print('✅ Player creation test passed');
    });

    test('should create player with custom values', () {
      // Arrange & Act
      Player player = Player('CustomHero', health: 150, level: 5, experience: 4500);

      // Assert
      expect(player.name, equals('CustomHero'));
      expect(player.health, equals(150));
      expect(player.maxHealth, equals(150));
      expect(player.level, equals(5));
      expect(player.experience, equals(4500));

      print('✅ Custom player creation test passed');
    });
  });

  group('Combat System Tests', () {
    late Player player;

    setUp(() {
      player = Player('TestWarrior', health: 100);
      print('🛡️ Setting up warrior for combat tests');
    });

    test('should take damage correctly', () {
      // Arrange
      int initialHealth = player.health;
      int damage = 30;

      // Act
      player.takeDamage(damage);

      // Assert
      expect(player.health, equals(initialHealth - damage));
      expect(player.isDead, isFalse);

      print('✅ Take damage test passed: ${player.health}/100 HP remaining');
    });

    test('should die when health reaches zero', () {
      // Act
      player.takeDamage(150); // More than max health

      // Assert
      expect(player.health, equals(0));
      expect(player.isDead, isTrue);

      print('✅ Death test passed: player properly died');
    });

    test('should not accept negative damage', () {
      // Act & Assert
      expect(() => player.takeDamage(-10), throwsArgumentError);

      print('✅ Negative damage test passed: properly rejected');
    });

    test('should heal correctly', () {
      // Arrange
      player.takeDamage(40); // Health = 60
      int healthBeforeHeal = player.health;

      // Act
      player.heal(20);

      // Assert
      expect(player.health, equals(healthBeforeHeal + 20));

      print('✅ Healing test passed: healed to ${player.health}/100 HP');
    });

    test('should not heal beyond max health', () {
      // Arrange
      player.takeDamage(10); // Health = 90

      // Act
      player.heal(50); // Try to heal 50

      // Assert
      expect(player.health, equals(player.maxHealth));

      print('✅ Overheal prevention test passed: capped at max health');
    });

    test('should not accept negative heal amount', () {
      // Act & Assert
      expect(() => player.heal(-5), throwsArgumentError);

      print('✅ Negative heal test passed: properly rejected');
    });
  });

  group('Leveling System Tests', () {
    late Player player;

    setUp(() {
      player = Player('TestMage');
    });

    test('should gain experience without leveling', () {
      // Act
      player.addExperience(500);

      // Assert
      expect(player.experience, equals(500));
      expect(player.level, equals(1)); // Should still be level 1

      print('✅ Experience gain test passed: 500 XP, still level 1');
    });

    test('should level up at 1000 XP', () {
      // Arrange
      int initialMaxHealth = player.maxHealth;

      // Act
      player.addExperience(1000);

      // Assert
      expect(player.experience, equals(1000));
      expect(player.level, equals(2));
      expect(player.maxHealth, equals(initialMaxHealth + 20));
      expect(player.health, equals(player.maxHealth)); // Full heal on level up

      print('✅ Level up test passed: reached level 2 with increased health');
    });

    test('should level up multiple times', () {
      // Act
      player.addExperience(2500); // Should reach level 3

      // Assert
      expect(player.level, equals(3));
      expect(player.maxHealth, equals(140)); // 100 + 20 + 20

      print('✅ Multiple level up test passed: reached level 3');
    });

    test('should not accept negative experience', () {
      // Act & Assert
      expect(() => player.addExperience(-100), throwsArgumentError);

      print('✅ Negative XP test passed: properly rejected');
    });
  });

  group('Inventory System Tests', () {
    late Player player;

    setUp(() {
      player = Player('TestAdventurer');
    });

    test('should add items to inventory', () {
      // Act
      player.addToInventory('Health Potion');
      player.addToInventory('Magic Sword');

      // Assert
      expect(player.inventory, contains('Health Potion'));
      expect(player.inventory, contains('Magic Sword'));
      expect(player.inventory.length, equals(2));
      expect(player.isInventoryFull, isFalse);

      print('✅ Add inventory test passed: ${player.inventory.length} items');
    });

    test('should detect full inventory', () {
      // Arrange
      for (int i = 0; i < 10; i++) {
        player.addToInventory('Item $i');
      }

      // Assert
      expect(player.inventory.length, equals(10));
      expect(player.isInventoryFull, isTrue);

      print('✅ Full inventory test passed: exactly 10 items');
    });

    test('should not add items when inventory is full', () {
      // Arrange
      for (int i = 0; i < 10; i++) {
        player.addToInventory('Item $i');
      }

      // Act & Assert
      expect(() => player.addToInventory('Extra Item'), throwsStateError);

      print('✅ Inventory overflow test passed: properly rejected');
    });
  });

  group('Integration Tests', () {
    test('should maintain consistency during complex scenario', () {
      // Arrange
      Player hero = Player('IntegrationHero');

      // Act - Simulate complex gameplay
      hero.addToInventory('Starting Sword');
      hero.addExperience(800);
      hero.takeDamage(50);
      hero.heal(30);
      hero.addExperience(300); // Should level up (total 1100)
      hero.addToInventory('Level 2 Shield');

      // Assert
      expect(hero.level, equals(2));
      expect(hero.health, equals(120)); // Full heal on level up
      expect(hero.maxHealth, equals(120)); // Increased by 20
      expect(hero.inventory.length, equals(2));
      expect(hero.experience, equals(1100));
      expect(hero.isDead, isFalse);

      print('✅ Integration test passed: complex scenario handled correctly');
    });
  });

  print('\n🎉 All player tests completed!');
}
```

---

## 🏪 E-commerce Shopping Cart Testing

```dart
// shopping_cart.dart - Shopping cart implementation
class ShoppingCart {
  List<CartItem> _items = [];
  double _discountPercent = 0.0;

  void addItem(String productName, double price, int quantity) {
    if (price < 0) {
      throw ArgumentError('Price cannot be negative');
    }
    if (quantity <= 0) {
      throw ArgumentError('Quantity must be positive');
    }

    // Check if item already exists
    for (var item in _items) {
      if (item.productName == productName) {
        item.quantity += quantity;
        return;
      }
    }

    // Add new item
    _items.add(CartItem(productName, price, quantity));
  }

  void removeItem(String productName) {
    _items.removeWhere((item) => item.productName == productName);
  }

  void updateQuantity(String productName, int newQuantity) {
    if (newQuantity < 0) {
      throw ArgumentError('Quantity cannot be negative');
    }

    for (var item in _items) {
      if (item.productName == productName) {
        if (newQuantity == 0) {
          removeItem(productName);
        } else {
          item.quantity = newQuantity;
        }
        return;
      }
    }

    throw StateError('Product not found in cart');
  }

  void applyDiscount(double discountPercent) {
    if (discountPercent < 0 || discountPercent > 100) {
      throw ArgumentError('Discount must be between 0 and 100');
    }
    _discountPercent = discountPercent;
  }

  double get subtotal {
    return _items.fold(0.0, (sum, item) => sum + item.totalPrice);
  }

  double get discountAmount {
    return subtotal * (_discountPercent / 100);
  }

  double get total {
    return subtotal - discountAmount;
  }

  int get itemCount {
    return _items.fold(0, (sum, item) => sum + item.quantity);
  }

  bool get isEmpty => _items.isEmpty;
  List<CartItem> get items => List.unmodifiable(_items);
  double get discountPercent => _discountPercent;

  void clear() {
    _items.clear();
    _discountPercent = 0.0;
  }
}

class CartItem {
  String productName;
  double price;
  int quantity;

  CartItem(this.productName, this.price, this.quantity);

  double get totalPrice => price * quantity;
}
```

```dart
// test/shopping_cart_test.dart - Shopping cart tests
import 'package:test/test.dart';
import '../shopping_cart.dart';

void main() {
  print('🛒 RUNNING SHOPPING CART TESTS 🛒\n');

  group('Cart Initialization Tests', () {
    test('should start with empty cart', () {
      // Arrange & Act
      ShoppingCart cart = ShoppingCart();

      // Assert
      expect(cart.isEmpty, isTrue);
      expect(cart.itemCount, equals(0));
      expect(cart.subtotal, equals(0.0));
      expect(cart.total, equals(0.0));
      expect(cart.items, isEmpty);

      print('✅ Empty cart initialization test passed');
    });
  });

  group('Add Item Tests', () {
    late ShoppingCart cart;

    setUp(() {
      cart = ShoppingCart();
    });

    test('should add single item correctly', () {
      // Act
      cart.addItem('Laptop', 999.99, 1);

      // Assert
      expect(cart.isEmpty, isFalse);
      expect(cart.itemCount, equals(1));
      expect(cart.items.length, equals(1));
      expect(cart.items.first.productName, equals('Laptop'));
      expect(cart.items.first.price, equals(999.99));
      expect(cart.items.first.quantity, equals(1));
      expect(cart.subtotal, equals(999.99));

      print('✅ Single item addition test passed');
    });

    test('should add multiple different items', () {
      // Act
      cart.addItem('Laptop', 999.99, 1);
      cart.addItem('Mouse', 29.99, 2);
      cart.addItem('Keyboard', 79.99, 1);

      // Assert
      expect(cart.itemCount, equals(4)); // 1 + 2 + 1
      expect(cart.items.length, equals(3)); // 3 different products
      expect(cart.subtotal, equals(1139.96)); // 999.99 + 59.98 + 79.99

      print('✅ Multiple items addition test passed');
    });

    test('should combine quantities for same item', () {
      // Act
      cart.addItem('Mouse', 29.99, 1);
      cart.addItem('Mouse', 29.99, 2); // Same item

      // Assert
      expect(cart.items.length, equals(1)); // Only one product type
      expect(cart.items.first.quantity, equals(3)); // Combined quantity
      expect(cart.itemCount, equals(3));
      expect(cart.subtotal, equals(89.97)); // 29.99 * 3

      print('✅ Same item combination test passed');
    });

    test('should reject negative price', () {
      // Act & Assert
      expect(() => cart.addItem('Invalid', -10.0, 1), throwsArgumentError);

      print('✅ Negative price rejection test passed');
    });

    test('should reject zero or negative quantity', () {
      // Act & Assert
      expect(() => cart.addItem('Item', 10.0, 0), throwsArgumentError);
      expect(() => cart.addItem('Item', 10.0, -1), throwsArgumentError);

      print('✅ Invalid quantity rejection test passed');
    });
  });

  group('Remove Item Tests', () {
    late ShoppingCart cart;

    setUp(() {
      cart = ShoppingCart();
      cart.addItem('Laptop', 999.99, 1);
      cart.addItem('Mouse', 29.99, 2);
    });

    test('should remove existing item', () {
      // Act
      cart.removeItem('Mouse');

      // Assert
      expect(cart.items.length, equals(1));
      expect(cart.itemCount, equals(1));
      expect(cart.subtotal, equals(999.99)); // Only laptop remains

      print('✅ Item removal test passed');
    });

    test('should handle removing non-existent item gracefully', () {
      // Act
      cart.removeItem('NonExistent');

      // Assert - Should not crash, cart unchanged
      expect(cart.items.length, equals(2));
      expect(cart.itemCount, equals(3));

      print('✅ Non-existent item removal test passed');
    });
  });

  group('Update Quantity Tests', () {
    late ShoppingCart cart;

    setUp(() {
      cart = ShoppingCart();
      cart.addItem('Mouse', 29.99, 2);
    });

    test('should update quantity correctly', () {
      // Act
      cart.updateQuantity('Mouse', 5);

      // Assert
      expect(cart.items.first.quantity, equals(5));
      expect(cart.itemCount, equals(5));
      expect(cart.subtotal, equals(149.95)); // 29.99 * 5

      print('✅ Quantity update test passed');
    });

    test('should remove item when quantity set to zero', () {
      // Act
      cart.updateQuantity('Mouse', 0);

      // Assert
      expect(cart.isEmpty, isTrue);
      expect(cart.itemCount, equals(0));

      print('✅ Zero quantity removal test passed');
    });

    test('should throw error for non-existent product', () {
      // Act & Assert
      expect(() => cart.updateQuantity('NonExistent', 5), throwsStateError);

      print('✅ Non-existent product update test passed');
    });

    test('should reject negative quantity', () {
      // Act & Assert
      expect(() => cart.updateQuantity('Mouse', -1), throwsArgumentError);

      print('✅ Negative quantity update rejection test passed');
    });
  });

  group('Discount Tests', () {
    late ShoppingCart cart;

    setUp(() {
      cart = ShoppingCart();
      cart.addItem('Item', 100.0, 2); // Subtotal = 200.0
    });

    test('should apply discount correctly', () {
      // Act
      cart.applyDiscount(10.0); // 10% discount

      // Assert
      expect(cart.discountPercent, equals(10.0));
      expect(cart.subtotal, equals(200.0)); // Unchanged
      expect(cart.discountAmount, equals(20.0)); // 10% of 200
      expect(cart.total, equals(180.0)); // 200 - 20

      print('✅ Discount application test passed');
    });

    test('should handle zero discount', () {
      // Act
      cart.applyDiscount(0.0);

      // Assert
      expect(cart.discountPercent, equals(0.0));
      expect(cart.discountAmount, equals(0.0));
      expect(cart.total, equals(cart.subtotal));

      print('✅ Zero discount test passed');
    });

    test('should handle maximum discount', () {
      // Act
      cart.applyDiscount(100.0); // 100% discount

      // Assert
      expect(cart.discountAmount, equals(200.0));
      expect(cart.total, equals(0.0));

      print('✅ Maximum discount test passed');
    });

    test('should reject invalid discount percentages', () {
      // Act & Assert
      expect(() => cart.applyDiscount(-5.0), throwsArgumentError);
      expect(() => cart.applyDiscount(150.0), throwsArgumentError);

      print('✅ Invalid discount rejection test passed');
    });
  });

  group('Cart Operations Tests', () {
    late ShoppingCart cart;

    setUp(() {
      cart = ShoppingCart();
      cart.addItem('Item1', 50.0, 1);
      cart.addItem('Item2', 30.0, 2);
      cart.applyDiscount(15.0);
    });

    test('should clear cart completely', () {
      // Act
      cart.clear();

      // Assert
      expect(cart.isEmpty, isTrue);
      expect(cart.itemCount, equals(0));
      expect(cart.subtotal, equals(0.0));
      expect(cart.total, equals(0.0));
      expect(cart.discountPercent, equals(0.0));
      expect(cart.items, isEmpty);

      print('✅ Cart clear test passed');
    });

    test('should calculate totals correctly with discount', () {
      // Assert
      expect(cart.subtotal, equals(110.0)); // 50 + 60
      expect(cart.discountAmount, equals(16.5)); // 15% of 110
      expect(cart.total, equals(93.5)); // 110 - 16.5

      print('✅ Total calculation test passed');
    });
  });

  group('Edge Case Tests', () {
    test('should handle very small prices', () {
      // Arrange
      ShoppingCart cart = ShoppingCart();

      // Act
      cart.addItem('Cheap Item', 0.01, 100);

      // Assert
      expect(cart.subtotal, equals(1.0));

      print('✅ Small price test passed');
    });

    test('should handle large quantities', () {
      // Arrange
      ShoppingCart cart = ShoppingCart();

      // Act
      cart.addItem('Bulk Item', 1.0, 10000);

      // Assert
      expect(cart.itemCount, equals(10000));
      expect(cart.subtotal, equals(10000.0));

      print('✅ Large quantity test passed');
    });

    test('should maintain precision with decimal calculations', () {
      // Arrange
      ShoppingCart cart = ShoppingCart();

      // Act
      cart.addItem('Precise Item', 19.99, 3);
      cart.applyDiscount(7.5);

      // Assert
      double expectedSubtotal = 59.97;
      double expectedDiscount = 4.49775;
      double expectedTotal = 55.47225;

      expect(cart.subtotal, closeTo(expectedSubtotal, 0.01));
      expect(cart.discountAmount, closeTo(expectedDiscount, 0.01));
      expect(cart.total, closeTo(expectedTotal, 0.01));

      print('✅ Decimal precision test passed');
    });
  });

  print('\n🎉 All shopping cart tests completed!');
}
```

---

## 🔧 Testing Different Types of Code

### Testing Functions

```dart
// math_utils.dart
class MathUtils {
  static bool isPrime(int number) {
    if (number < 2) return false;
    for (int i = 2; i <= number ~/ 2; i++) {
      if (number % i == 0) return false;
    }
    return true;
  }

  static List<int> fibonacci(int count) {
    if (count <= 0) return [];
    if (count == 1) return [0];

    List<int> sequence = [0, 1];
    for (int i = 2; i < count; i++) {
      sequence.add(sequence[i - 1] + sequence[i - 2]);
    }
    return sequence;
  }

  static double average(List<num> numbers) {
    if (numbers.isEmpty) {
      throw ArgumentError('Cannot calculate average of empty list');
    }
    return numbers.reduce((a, b) => a + b) / numbers.length;
  }
}
```

```dart
// test/math_utils_test.dart
import 'package:test/test.dart';
import '../math_utils.dart';

void main() {
  group('Prime Number Tests', () {
    test('should identify prime numbers correctly', () {
      expect(MathUtils.isPrime(2), isTrue);
      expect(MathUtils.isPrime(3), isTrue);
      expect(MathUtils.isPrime(5), isTrue);
      expect(MathUtils.isPrime(7), isTrue);
      expect(MathUtils.isPrime(11), isTrue);
      expect(MathUtils.isPrime(13), isTrue);
    });

    test('should identify non-prime numbers correctly', () {
      expect(MathUtils.isPrime(1), isFalse);
      expect(MathUtils.isPrime(4), isFalse);
      expect(MathUtils.isPrime(6), isFalse);
      expect(MathUtils.isPrime(8), isFalse);
      expect(MathUtils.isPrime(9), isFalse);
      expect(MathUtils.isPrime(10), isFalse);
    });

    test('should handle edge cases', () {
      expect(MathUtils.isPrime(0), isFalse);
      expect(MathUtils.isPrime(-1), isFalse);
      expect(MathUtils.isPrime(-5), isFalse);
    });
  });

  group('Fibonacci Tests', () {
    test('should generate correct fibonacci sequence', () {
      expect(MathUtils.fibonacci(0), equals([]));
      expect(MathUtils.fibonacci(1), equals([0]));
      expect(MathUtils.fibonacci(2), equals([0, 1]));
      expect(MathUtils.fibonacci(5), equals([0, 1, 1, 2, 3]));
      expect(MathUtils.fibonacci(8), equals([0, 1, 1, 2, 3, 5, 8, 13]));
    });
  });

  group('Average Tests', () {
    test('should calculate average correctly', () {
      expect(MathUtils.average([1, 2, 3, 4, 5]), equals(3.0));
      expect(MathUtils.average([10, 20, 30]), equals(20.0));
      expect(MathUtils.average([2.5, 3.5]), equals(3.0));
    });

    test('should throw error for empty list', () {
      expect(() => MathUtils.average([]), throwsArgumentError);
    });
  });
}
```

---

## 🧪 Test Organization and Best Practices

### Test Structure: Arrange-Act-Assert

```dart
test('should add items to cart correctly', () {
  // Arrange - Set up the test data
  ShoppingCart cart = ShoppingCart();
  String product = 'Laptop';
  double price = 999.99;
  int quantity = 1;

  // Act - Perform the action being tested
  cart.addItem(product, price, quantity);

  // Assert - Verify the results
  expect(cart.itemCount, equals(1));
  expect(cart.subtotal, equals(999.99));
});
```

### Using setUp and tearDown

```dart
group('User Authentication Tests', () {
  late UserService userService;
  late Database mockDatabase;

  setUp(() {
    // Runs before each test
    mockDatabase = MockDatabase();
    userService = UserService(mockDatabase);
    print('🔧 Test setup completed');
  });

  tearDown(() {
    // Runs after each test
    mockDatabase.clear();
    print('🧹 Test cleanup completed');
  });

  test('should authenticate valid user', () {
    // Test implementation
  });
});
```

### Test Categories and Naming

```dart
void main() {
  group('Unit Tests', () {
    // Test individual functions/methods
  });

  group('Integration Tests', () {
    // Test multiple components working together
  });

  group('Edge Case Tests', () {
    // Test boundary conditions and error cases
  });
}
```

---

## 📊 Testing Matchers Reference

### Common Matchers

```dart
test('matcher examples', () {
  // Equality
  expect(actual, equals(expected));
  expect(actual, same(expected)); // Identity comparison

  // Boolean
  expect(actual, isTrue);
  expect(actual, isFalse);

  // Null checks
  expect(actual, isNull);
  expect(actual, isNotNull);

  // Numeric
  expect(actual, greaterThan(5));
  expect(actual, lessThan(10));
  expect(actual, closeTo(3.14, 0.01)); // Within tolerance

  // Collections
  expect(list, isEmpty);
  expect(list, isNotEmpty);
  expect(list, hasLength(3));
  expect(list, contains('item'));
  expect(list, containsAll(['a', 'b']));

  // Strings
  expect(text, startsWith('Hello'));
  expect(text, endsWith('World'));
  expect(text, matches(RegExp(r'\d+')));

  // Exceptions
  expect(() => someFunction(), throwsException);
  expect(() => someFunction(), throwsArgumentError);
  expect(() => someFunction(), throwsA(isA<CustomException>()));
});
```

---

## 🎯 Testing Strategies

### Test-Driven Development (TDD)

```dart
// 1. Write test first (it will fail)
test('should calculate compound interest', () {
  expect(calculateCompoundInterest(1000, 0.05, 2), closeTo(1102.50, 0.01));
});

// 2. Write minimal code to make test pass
double calculateCompoundInterest(double principal, double rate, int years) {
  return principal * pow(1 + rate, years);
}

// 3. Refactor and improve while keeping tests green
```

### Testing Private Methods

```dart
// Don't test private methods directly - test through public interface
class BankAccount {
  double _balance = 0;

  void deposit(double amount) {
    _validateAmount(amount); // Private method
    _balance += amount;
  }

  void _validateAmount(double amount) {
    if (amount <= 0) throw ArgumentError('Amount must be positive');
  }

  double get balance => _balance;
}

// Test the private validation through public method
test('should reject negative deposits', () {
  BankAccount account = BankAccount();
  expect(() => account.deposit(-100), throwsArgumentError);
});
```

---

## 🚀 Advanced Testing Techniques

### Parameterized Tests

```dart
void main() {
  group('Password Validation Tests', () {
    // Test data
    List<Map<String, dynamic>> testCases = [
      {'password': 'weak', 'expected': false},
      {'password': 'StrongPass123!', 'expected': true},
      {'password': 'NoNumbers!', 'expected': false},
      {'password': 'nonumbers123', 'expected': false},
      {'password': 'NoSpecial123', 'expected': false},
    ];

    for (var testCase in testCases) {
      test('should validate "${testCase['password']}" as ${testCase['expected']}', () {
        bool result = PasswordValidator.isStrong(testCase['password']);
        expect(result, equals(testCase['expected']));
      });
    }
  });
}
```

### Testing Asynchronous Code

```dart
// Testing Futures
test('should fetch user data from API', () async {
  UserService service = UserService();

  User user = await service.fetchUser(123);

  expect(user.id, equals(123));
  expect(user.name, isNotNull);
});

// Testing Streams
test('should emit temperature readings', () async {
  TemperatureSensor sensor = TemperatureSensor();

  List<double> readings = [];
  await for (double temp in sensor.readTemperature().take(3)) {
    readings.add(temp);
  }

  expect(readings, hasLength(3));
  expect(readings.every((temp) => temp > 0), isTrue);
});
```

---

## 🧠 Key Testing Concepts

### The Testing Pyramid

```
    🔺 E2E Tests (Few, Slow, High Value)
   🔶🔶 Integration Tests (Some, Medium Speed)
  🟩🟩🟩 Unit Tests (Many, Fast, Low Level)
```

### Test Qualities (FIRST)

| Quality             | Meaning                          | Example                           |
| ------------------- | -------------------------------- | --------------------------------- |
| **Fast**            | Tests run quickly                | Avoid file I/O, network calls     |
| **Independent**     | Tests don't depend on each other | Each test sets up its own data    |
| **Repeatable**      | Same result every time           | No random values without seeds    |
| **Self-validating** | Clear pass/fail                  | Use proper assertions             |
| **Timely**          | Written close to production code | Write tests as you write features |

---
