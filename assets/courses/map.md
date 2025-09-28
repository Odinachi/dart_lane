# Maps in Dart

Imagine you're running a **magical library** 📚✨!

But this isn't just any library - each book has a **special code** written on it, and you need that code to find exactly what's inside:

- 📖 **"HP1"** → "Harry Potter and the Sorcerer's Stone"
- 📗 **"WOZ"** → "The Wonderful Wizard of Oz"
- 📘 **"ALW"** → "Alice's Adventures in Wonderland"

You can't just grab any book - you need to know the **secret code** to unlock its contents!

👉 A **Map** in Dart works exactly like this magical library:

> It stores **pairs** of things: a **key** (the secret code) and a **value** (what the code unlocks)!

---

## 🔍 The Problem: Finding Things Without Organization

```dart
void main() {
  // ❌ This is confusing and hard to manage!
  List<String> codes = ['HP1', 'WOZ', 'ALW'];
  List<String> books = ['Harry Potter', 'Wizard of Oz', 'Alice in Wonderland'];

  // How do I find what HP1 unlocks? I have to search both lists! 😵
  int index = codes.indexOf('HP1');
  if (index != -1) {
    print('HP1 unlocks: ${books[index]}');
  }
}
```

**Problems:**

- Two separate lists to maintain 📋📋
- Easy to mess up the order 😵
- Hard to find connections 🤷‍♀️

---

## ✅ The Solution: Maps Connect Keys to Values!

```dart
void main() {
  Map<String, String> magicalLibrary = {
    'HP1': 'Harry Potter and the Sorcerer\'s Stone',
    'WOZ': 'The Wonderful Wizard of Oz',
    'ALW': 'Alice\'s Adventures in Wonderland',
  };

  // Easy to find what any code unlocks!
  print('🔑 Code HP1 unlocks: ${magicalLibrary['HP1']}');
  print('🔑 Code WOZ unlocks: ${magicalLibrary['WOZ']}');

  print('\n📚 Complete magical library:');
  print(magicalLibrary);
}
```

**Output:**

```
🔑 Code HP1 unlocks: Harry Potter and the Sorcerer's Stone
🔑 Code WOZ unlocks: The Wonderful Wizard of Oz

📚 Complete magical library:
{HP1: Harry Potter and the Sorcerer's Stone, WOZ: The Wonderful Wizard of Oz, ALW: Alice's Adventures in Wonderland}
```

**Perfect!** Now each code is directly connected to its book! 🎯

---

## 🏪 Restaurant Menu Example

Let's create a restaurant where each dish has a special number:

```dart
void main() {
  Map<int, String> menu = {
    101: '🍕 Pepperoni Pizza',
    102: '🍔 Cheeseburger Deluxe',
    103: '🍝 Spaghetti Carbonara',
    104: '🥗 Caesar Salad',
    105: '🍰 Chocolate Cake',
  };

  Map<int, double> prices = {
    101: 12.99,
    102: 8.50,
    103: 14.25,
    104: 7.75,
    105: 6.99,
  };

  print('🍽️ WELCOME TO MARIO\'S RESTAURANT! 🍽️\n');

  // Customer orders by number
  int orderNumber = 103;

  if (menu.containsKey(orderNumber)) {
    String dish = menu[orderNumber]!;
    double price = prices[orderNumber]!;

    print('📋 Order #$orderNumber:');
    print('🍽️ Dish: $dish');
    print('💰 Price: \$${price.toStringAsFixed(2)}');
    print('✅ Order confirmed!');
  } else {
    print('❌ Sorry, item #$orderNumber not found on menu');
  }
}
```

**Output:**

```
🍽️ WELCOME TO MARIO'S RESTAURANT! 🍽️

📋 Order #103:
🍽️ Dish: 🍝 Spaghetti Carbonara
💰 Price: $14.25
✅ Order confirmed!
```

---

## 🎮 Player Inventory System

```dart
void main() {
  // Player's game inventory: item name → quantity
  Map<String, int> playerInventory = {
    'Health Potion': 5,
    'Magic Sword': 1,
    'Gold Coins': 150,
    'Shield': 1,
  };

  // Item values: item name → gold value
  Map<String, int> itemValues = {
    'Health Potion': 25,
    'Magic Sword': 500,
    'Gold Coins': 1,
    'Shield': 200,
    'Bow': 300,
  };

  print('🎮 PLAYER INVENTORY SYSTEM 🎮\n');

  // Display current inventory
  print('🎒 Current Inventory:');
  playerInventory.forEach((item, quantity) {
    int value = itemValues[item] ?? 0;
    int totalValue = value * quantity;
    print('  📦 $item: $quantity (${totalValue} gold each = $totalValue total)');
  });

  // Calculate total inventory value
  int totalWorth = 0;
  playerInventory.forEach((item, quantity) {
    int value = itemValues[item] ?? 0;
    totalWorth += value * quantity;
  });

  print('\n💎 Total Inventory Worth: $totalWorth gold');

  // Use an item
  String itemToUse = 'Health Potion';
  if (playerInventory.containsKey(itemToUse)) {
    int currentAmount = playerInventory[itemToUse]!;
    if (currentAmount > 0) {
      playerInventory[itemToUse] = currentAmount - 1;
      print('\n🧪 Used 1 $itemToUse! Remaining: ${playerInventory[itemToUse]}');
    } else {
      print('\n❌ No $itemToUse left to use!');
    }
  }

  // Find a new item
  String newItem = 'Bow';
  if (itemValues.containsKey(newItem)) {
    playerInventory[newItem] = (playerInventory[newItem] ?? 0) + 1;
    print('✨ Found a $newItem! Added to inventory.');
    print('🏹 Now you have ${playerInventory[newItem]} $newItem(s)');
  }

  print('\n🎒 Updated Inventory:');
  playerInventory.forEach((item, quantity) {
    print('  📦 $item: $quantity');
  });
}
```

**Output:**

```
🎮 PLAYER INVENTORY SYSTEM 🎮

🎒 Current Inventory:
  📦 Health Potion: 5 (125 gold each = 125 total)
  📦 Magic Sword: 1 (500 gold each = 500 total)
  📦 Gold Coins: 150 (150 gold each = 150 total)
  📦 Shield: 1 (200 gold each = 200 total)

💎 Total Inventory Worth: 975 gold

🧪 Used 1 Health Potion! Remaining: 4
✨ Found a Bow! Added to inventory.
🏹 Now you have 1 Bow(s)

🎒 Updated Inventory:
  📦 Health Potion: 4
  📦 Magic Sword: 1
  📦 Gold Coins: 150
  📦 Shield: 1
  📦 Bow: 1
```

---

## 📞 Phone Book Contact System

```dart
void main() {
  // Contact name → phone number
  Map<String, String> phoneBook = {
    'Mom': '555-0123',
    'Dad': '555-0124',
    'Best Friend': '555-0125',
    'Pizza Place': '555-PIZZA',
    'Doctor': '555-0126',
  };

  // Contact name → email
  Map<String, String> emailBook = {
    'Mom': 'mom@family.com',
    'Dad': 'dad@family.com',
    'Best Friend': 'bestie@email.com',
    'Doctor': 'appointments@clinic.com',
  };

  print('📱 SMART PHONE CONTACTS 📱\n');

  // Search for a contact
  String searchName = 'Mom';

  print('🔍 Searching for: $searchName\n');

  if (phoneBook.containsKey(searchName)) {
    print('📞 $searchName\'s phone: ${phoneBook[searchName]}');

    if (emailBook.containsKey(searchName)) {
      print('📧 $searchName\'s email: ${emailBook[searchName]}');
    } else {
      print('📧 No email on file for $searchName');
    }
  } else {
    print('❌ $searchName not found in contacts');
  }

  // Add a new contact
  String newContact = 'School';
  phoneBook[newContact] = '555-0127';
  emailBook[newContact] = 'info@school.edu';

  print('\n✅ Added new contact: $newContact');

  // List all contacts
  print('\n📋 ALL CONTACTS:');
  phoneBook.forEach((name, phone) {
    String email = emailBook[name] ?? 'No email';
    print('👤 $name: $phone | $email');
  });

  // Remove a contact
  String contactToRemove = 'Pizza Place';
  phoneBook.remove(contactToRemove);
  print('\n🗑️ Removed $contactToRemove from contacts');

  print('\n📊 Contact Statistics:');
  print('📞 Total contacts: ${phoneBook.length}');
  print('📧 Contacts with email: ${emailBook.length}');
}
```

**Output:**

```
📱 SMART PHONE CONTACTS 📱

🔍 Searching for: Mom

📞 Mom's phone: 555-0123
📧 Mom's email: mom@family.com

✅ Added new contact: School

📋 ALL CONTACTS:
👤 Mom: 555-0123 | mom@family.com
👤 Dad: 555-0124 | dad@family.com
👤 Best Friend: 555-0125 | bestie@email.com
👤 Pizza Place: 555-PIZZA | No email
👤 Doctor: 555-0126 | appointments@clinic.com
👤 School: 555-0127 | info@school.edu

🗑️ Removed Pizza Place from contacts

📊 Contact Statistics:
📞 Total contacts: 5
📧 Contacts with email: 5
```

---

## 🏫 Grade Management System

```dart
void main() {
  // Student name → grades in different subjects
  Map<String, Map<String, int>> studentGrades = {
    'Alice': {
      'Math': 92,
      'Science': 88,
      'English': 95,
      'History': 90,
    },
    'Bob': {
      'Math': 78,
      'Science': 85,
      'English': 80,
      'History': 77,
    },
    'Charlie': {
      'Math': 96,
      'Science': 94,
      'English': 89,
      'History': 93,
    },
  };

  print('🎓 GRADE MANAGEMENT SYSTEM 🎓\n');

  // Calculate averages for each student
  studentGrades.forEach((student, grades) {
    print('📊 $student\'s Report Card:');

    int total = 0;
    grades.forEach((subject, grade) {
      String letterGrade = getLetterGrade(grade);
      print('  📚 $subject: $grade% ($letterGrade)');
      total += grade;
    });

    double average = total / grades.length;
    String overallGrade = getLetterGrade(average.round());

    print('  🎯 Average: ${average.toStringAsFixed(1)}% ($overallGrade)');

    if (average >= 90) {
      print('  🏆 Honor Roll Student! 🏆');
    } else if (average >= 80) {
      print('  ⭐ Good Performance!');
    } else {
      print('  📈 Keep working hard!');
    }
    print('');
  });

  // Find top performer in each subject
  Map<String, String> subjectToppers = {};
  Map<String, int> subjectBestGrades = {};

  studentGrades.forEach((student, grades) {
    grades.forEach((subject, grade) {
      if (!subjectBestGrades.containsKey(subject) || grade > subjectBestGrades[subject]!) {
        subjectBestGrades[subject] = grade;
        subjectToppers[subject] = student;
      }
    });
  });

  print('🥇 SUBJECT CHAMPIONS:');
  subjectToppers.forEach((subject, student) {
    int grade = subjectBestGrades[subject]!;
    print('  🏆 $subject: $student ($grade%)');
  });
}

String getLetterGrade(int percentage) {
  if (percentage >= 90) return 'A';
  if (percentage >= 80) return 'B';
  if (percentage >= 70) return 'C';
  if (percentage >= 60) return 'D';
  return 'F';
}
```

**Output:**

```
🎓 GRADE MANAGEMENT SYSTEM 🎓

📊 Alice's Report Card:
  📚 Math: 92% (A)
  📚 Science: 88% (B)
  📚 English: 95% (A)
  📚 History: 90% (A)
  🎯 Average: 91.2% (A)
  🏆 Honor Roll Student! 🏆

📊 Bob's Report Card:
  📚 Math: 78% (C)
  📚 Science: 85% (B)
  📚 English: 80% (B)
  📚 History: 77% (C)
  🎯 Average: 80.0% (B)
  ⭐ Good Performance!

📊 Charlie's Report Card:
  📚 Math: 96% (A)
  📚 Science: 94% (A)
  📚 English: 89% (B)
  📚 History: 93% (A)
  🎯 Average: 93.0% (A)
  🏆 Honor Roll Student! 🏆

🥇 SUBJECT CHAMPIONS:
  🏆 Math: Charlie (96%)
  🏆 Science: Charlie (94%)
  🏆 English: Alice (95%)
  🏆 History: Charlie (93%)
```

---

## 🛒 Online Shopping Cart

```dart
void main() {
  // Product ID → Product info
  Map<String, Map<String, dynamic>> products = {
    'P001': {
      'name': 'Gaming Mouse',
      'price': 49.99,
      'category': 'Electronics',
      'stock': 15,
    },
    'P002': {
      'name': 'Mechanical Keyboard',
      'price': 129.99,
      'category': 'Electronics',
      'stock': 8,
    },
    'P003': {
      'name': 'Coffee Mug',
      'price': 12.99,
      'category': 'Kitchen',
      'stock': 25,
    },
  };

  // Shopping cart: Product ID → Quantity
  Map<String, int> shoppingCart = {};

  print('🛒 ONLINE SHOPPING SYSTEM 🛒\n');

  // Display available products
  print('🏪 Available Products:');
  products.forEach((id, info) {
    print('  🏷️ $id: ${info['name']} - \$${info['price']} (Stock: ${info['stock']})');
  });

  // Add items to cart
  addToCart('P001', 2, shoppingCart, products);
  addToCart('P002', 1, shoppingCart, products);
  addToCart('P003', 3, shoppingCart, products);
  addToCart('P001', 1, shoppingCart, products); // Add more of same item

  // Display cart
  displayCart(shoppingCart, products);

  // Remove item from cart
  print('\n🗑️ Removing 1 Gaming Mouse from cart...');
  if (shoppingCart.containsKey('P001')) {
    shoppingCart['P001'] = shoppingCart['P001']! - 1;
    if (shoppingCart['P001']! <= 0) {
      shoppingCart.remove('P001');
    }
  }

  displayCart(shoppingCart, products);
}

void addToCart(String productId, int quantity, Map<String, int> cart, Map<String, dynamic> products) {
  if (products.containsKey(productId)) {
    var product = products[productId];
    int stock = product['stock'];
    int currentInCart = cart[productId] ?? 0;

    if (currentInCart + quantity <= stock) {
      cart[productId] = currentInCart + quantity;
      print('✅ Added $quantity ${product['name']}(s) to cart');
    } else {
      print('❌ Not enough stock for ${product['name']}! Available: ${stock - currentInCart}');
    }
  }
}

void displayCart(Map<String, int> cart, Map<String, dynamic> products) {
  print('\n🛒 Shopping Cart:');

  if (cart.isEmpty) {
    print('  📭 Cart is empty');
    return;
  }

  double total = 0;

  cart.forEach((productId, quantity) {
    var product = products[productId];
    double price = product['price'];
    double itemTotal = price * quantity;
    total += itemTotal;

    print('  📦 ${product['name']} x$quantity = \$${itemTotal.toStringAsFixed(2)}');
  });

  print('  ─' * 30);
  print('  💰 Total: \$${total.toStringAsFixed(2)}');
}
```

---

## 🌍 Country Information System

```dart
void main() {
  // Country code → Country information
  Map<String, Map<String, dynamic>> worldData = {
    'US': {
      'name': 'United States',
      'capital': 'Washington D.C.',
      'population': 331900000,
      'currency': 'USD',
      'languages': ['English'],
      'continent': 'North America',
    },
    'JP': {
      'name': 'Japan',
      'capital': 'Tokyo',
      'population': 125800000,
      'currency': 'JPY',
      'languages': ['Japanese'],
      'continent': 'Asia',
    },
    'BR': {
      'name': 'Brazil',
      'capital': 'Brasília',
      'population': 215300000,
      'currency': 'BRL',
      'languages': ['Portuguese'],
      'continent': 'South America',
    },
    'DE': {
      'name': 'Germany',
      'capital': 'Berlin',
      'population': 83200000,
      'currency': 'EUR',
      'languages': ['German'],
      'continent': 'Europe',
    },
  };

  print('🌍 WORLD INFORMATION SYSTEM 🌍\n');

  // Look up a specific country
  String lookupCode = 'JP';
  if (worldData.containsKey(lookupCode)) {
    var country = worldData[lookupCode]!;

    print('🔍 Information for $lookupCode:');
    print('🏛️ Country: ${country['name']}');
    print('🏙️ Capital: ${country['capital']}');
    print('👥 Population: ${formatNumber(country['population'])}');
    print('💱 Currency: ${country['currency']}');
    print('🗣️ Languages: ${country['languages'].join(', ')}');
    print('🌎 Continent: ${country['continent']}');
  }

  // Find countries by continent
  print('\n🌎 Countries by Continent:');
  Map<String, List<String>> continentCountries = {};

  worldData.forEach((code, info) {
    String continent = info['continent'];
    if (!continentCountries.containsKey(continent)) {
      continentCountries[continent] = [];
    }
    continentCountries[continent]!.add(info['name']);
  });

  continentCountries.forEach((continent, countries) {
    print('  🌍 $continent: ${countries.join(', ')}');
  });

  // Find most populous country
  String mostPopulousCode = '';
  int maxPopulation = 0;

  worldData.forEach((code, info) {
    if (info['population'] > maxPopulation) {
      maxPopulation = info['population'];
      mostPopulousCode = code;
    }
  });

  print('\n👑 Most Populous Country: ${worldData[mostPopulousCode]!['name']} (${formatNumber(maxPopulation)} people)');
}

String formatNumber(int number) {
  return number.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
}
```

---

## 🧠 Key Map Operations Summary

### Creating Maps

```dart
// Empty map
Map<String, int> empty = {};
Map<String, int> empty2 = <String, int>{};

// Map with initial values
Map<String, int> scores = {
  'Alice': 95,
  'Bob': 87,
  'Charlie': 92,
};
```

### Essential Map Methods

| Method                 | Purpose               | Example                         |
| ---------------------- | --------------------- | ------------------------------- |
| `map[key]`             | Get value for key     | `String name = map['key'];`     |
| `map[key] = value`     | Set/update value      | `map['key'] = 'new value';`     |
| `containsKey(key)`     | Check if key exists   | `if (map.containsKey('key'))`   |
| `containsValue(value)` | Check if value exists | `if (map.containsValue(42))`    |
| `remove(key)`          | Remove key-value pair | `map.remove('key');`            |
| `clear()`              | Remove all pairs      | `map.clear();`                  |
| `isEmpty`              | Check if empty        | `if (map.isEmpty)`              |
| `length`               | Get number of pairs   | `int size = map.length;`        |
| `keys`                 | Get all keys          | `for (String key in map.keys)`  |
| `values`               | Get all values        | `for (int value in map.values)` |

### Looping Through Maps

```dart
// Method 1: forEach
map.forEach((key, value) {
  print('$key: $value');
});

// Method 2: for-in with entries
for (MapEntry entry in map.entries) {
  print('${entry.key}: ${entry.value}');
}

// Method 3: for-in with keys
for (String key in map.keys) {
  print('$key: ${map[key]}');
}
```

---

## 🎯 When to Use Maps

**✅ Perfect for:**

- **Lookups**: Find information using a unique identifier
- **Dictionaries**: Word definitions, translations
- **Configurations**: Settings with names and values
- **Caching**: Store computed results with keys
- **Indexing**: Quick access to objects by ID

**❌ Not ideal for:**

- **Ordered data**: Use Lists when order matters
- **Duplicate keys**: Maps automatically overwrite duplicates
- **Simple counting**: Use integers or Lists

---

## 🚀 Practice Challenges

Try creating maps for these scenarios:

1. **🏥 Hospital**: Patient ID → Medical records
2. **🎬 Movie Database**: Movie title → Rating, genre, year
3. **🌡️ Weather Station**: City name → Temperature, humidity
4. **📚 Library System**: Book ISBN → Title, author, available copies
5. **🎯 Sports Team**: Player number → Name, position, stats

---

## 📊 Map vs Other Data Structures

| Structure | When to Use                   | Example                    |
| --------- | ----------------------------- | -------------------------- |
| **List**  | Ordered items, duplicates OK  | Shopping list, high scores |
| **Set**   | Unique items, no order needed | Tags, categories           |
| **Map**   | Key-value pairs, fast lookup  | Phone book, dictionary     |

---

## 🎉 Remember This!

Maps are like having a **super-smart filing cabinet** 🗄️:

- **🏷️ Every folder has a label** (key) and **📄 contents** (value)
- **🔍 Instant lookup** - give the label, get the contents immediately
- **📝 Easy updates** - change contents without moving folders
- **🗂️ Perfect organization** - everything has its place and name

**The Magic**: Instead of searching through piles of data, you can instantly find exactly what you need with the right key! 🔑✨

> **Think of it like**: "Hey Map, show me what's under key 'favorite_pizza'" → "🍕 Here it is: Pepperoni with extra cheese!"

Maps make your data **organized**, **fast**, and **easy to use**! 🎪🚀
