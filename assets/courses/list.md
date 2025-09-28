# Lists in Dart

Imagine you're organizing a **pizza party** 🍕 for your friends!

You need to keep track of:

- 👥 **Guest list** (who's coming)
- 🍕 **Pizza flavors** (what to order)
- 🎵 **Playlist** (songs to play)
- 🎮 **Games** (fun activities)

Instead of writing each thing on separate pieces of paper, you put them all on **one organized list**!

👉 A **List** in Dart works exactly like this party planning list:

> It's a **container** that holds multiple items in a **specific order**, and you can easily **add**, **remove**, or **find** things!

---

## 🎁 The Magic of Lists

```dart
void main() {
  // Create a guest list for the party
  List<String> guests = ['Alice', 'Bob', 'Charlie', 'Diana'];

  print('🎉 Party Guest List: $guests');
  print('📊 Total guests: ${guests.length}');
  print('👋 First guest: ${guests[0]}');
  print('🎊 Last guest: ${guests[guests.length - 1]}');
}
```

**Output:**

```
🎉 Party Guest List: [Alice, Bob, Charlie, Diana]
📊 Total guests: 4
👋 First guest: Alice
🎊 Last guest: Diana
```

---

## 🔢 Understanding List Indexes

Lists are like **hotel rooms** with **room numbers**! Each item has a specific position:

```dart
void main() {
  List<String> pizzaFlavors = ['Pepperoni', 'Hawaiian', 'Veggie', 'Margherita'];

  print('🏨 PIZZA HOTEL - Room Numbers:');
  print('');

  for (int i = 0; i < pizzaFlavors.length; i++) {
    print('🚪 Room $i: ${pizzaFlavors[i]}');
  }

  print('');
  print('📍 Quick Access:');
  print('First pizza (room 0): ${pizzaFlavors[0]}');
  print('Second pizza (room 1): ${pizzaFlavors[1]}');
  print('Last pizza: ${pizzaFlavors.last}');
}
```

**Output:**

```
🏨 PIZZA HOTEL - Room Numbers:

🚪 Room 0: Pepperoni
🚪 Room 1: Hawaiian
🚪 Room 2: Veggie
🚪 Room 3: Margherita

📍 Quick Access:
First pizza (room 0): Pepperoni
Second pizza (room 1): Hawaiian
Last pizza: Margherita
```

---

## ➕ Adding Items to Lists

### Adding to the End

```dart
void main() {
  List<String> shoppingCart = ['Apples', 'Bread'];

  print('🛒 Shopping Cart: $shoppingCart');

  // Add one item
  shoppingCart.add('Milk');
  print('➕ Added Milk: $shoppingCart');

  // Add multiple items
  shoppingCart.addAll(['Eggs', 'Cheese', 'Butter']);
  print('➕ Added dairy products: $shoppingCart');

  print('📊 Total items: ${shoppingCart.length}');
}
```

**Output:**

```
🛒 Shopping Cart: [Apples, Bread]
➕ Added Milk: [Apples, Bread, Milk]
➕ Added dairy products: [Apples, Bread, Milk, Eggs, Cheese, Butter]
📊 Total items: 6
```

### Adding at Specific Positions

```dart
void main() {
  List<String> playlist = ['Song A', 'Song C', 'Song D'];

  print('🎵 Original Playlist: $playlist');

  // Insert at specific position (index 1)
  playlist.insert(1, 'Song B');
  print('🎶 Inserted Song B at position 1: $playlist');

  // Insert multiple songs at once
  playlist.insertAll(0, ['Intro', 'Welcome']);
  print('🎼 Added intro songs: $playlist');
}
```

**Output:**

```
🎵 Original Playlist: [Song A, Song C, Song D]
🎶 Inserted Song B at position 1: [Song A, Song B, Song C, Song D]
🎼 Added intro songs: [Intro, Welcome, Song A, Song B, Song C, Song D]
```

---

## ➖ Removing Items from Lists

```dart
void main() {
  List<String> todoList = ['Wake up', 'Brush teeth', 'Eat breakfast', 'Go to school', 'Do homework'];

  print('📝 Original Todo List: $todoList');
  print('');

  // Remove specific item
  todoList.remove('Brush teeth');
  print('✅ Completed: Brush teeth');
  print('📝 Updated list: $todoList');

  // Remove by index
  String completed = todoList.removeAt(0);
  print('✅ Completed: $completed');
  print('📝 Updated list: $todoList');

  // Remove last item
  String lastTask = todoList.removeLast();
  print('✅ Completed: $lastTask');
  print('📝 Final list: $todoList');

  // Remove multiple items
  todoList.removeRange(0, 2);
  print('✅ Completed multiple tasks');
  print('📝 Remaining: $todoList');
}
```

**Output:**

```
📝 Original Todo List: [Wake up, Brush teeth, Eat breakfast, Go to school, Do homework]

✅ Completed: Brush teeth
📝 Updated list: [Wake up, Eat breakfast, Go to school, Do homework]
✅ Completed: Wake up
📝 Updated list: [Eat breakfast, Go to school, Do homework]
✅ Completed: Do homework
📝 Final list: [Eat breakfast, Go to school]
✅ Completed multiple tasks
📝 Remaining: []
```

---

## 🔍 Finding and Checking Items

```dart
void main() {
  List<String> students = ['Alice', 'Bob', 'Charlie', 'Diana', 'Eve'];

  print('👥 Class Roster: $students\n');

  // Check if someone is in the class
  String checkStudent = 'Bob';
  if (students.contains(checkStudent)) {
    print('✅ $checkStudent is in the class!');
    print('📍 Position: ${students.indexOf(checkStudent)}');
  } else {
    print('❌ $checkStudent is not in the class');
  }

  // Find where someone sits
  print('📍 Charlie sits at position: ${students.indexOf('Charlie')}');

  // Check if list is empty
  print('📊 Class is empty: ${students.isEmpty}');
  print('📊 Class has students: ${students.isNotEmpty}');

  // Get first and last students
  print('🥇 First student: ${students.first}');
  print('🏁 Last student: ${students.last}');
}
```

**Output:**

```
👥 Class Roster: [Alice, Bob, Charlie, Diana, Eve]

✅ Bob is in the class!
📍 Position: 1
📍 Charlie sits at position: 2
📊 Class is empty: false
📊 Class has students: true
🥇 First student: Alice
🏁 Last student: Eve
```

---

## 🔄 Looping Through Lists

### For-Each Loop (Easiest)

```dart
void main() {
  List<String> iceCreamFlavors = ['Vanilla', 'Chocolate', 'Strawberry', 'Mint'];

  print('🍦 ICE CREAM MENU:');
  print('');

  for (String flavor in iceCreamFlavors) {
    print('🍨 Delicious $flavor ice cream!');
  }
}
```

### For Loop with Index

```dart
void main() {
  List<String> subjects = ['Math', 'Science', 'History', 'Art'];

  print('📚 CLASS SCHEDULE:');
  print('');

  for (int i = 0; i < subjects.length; i++) {
    print('📖 Period ${i + 1}: ${subjects[i]}');
  }
}
```

### Advanced Iteration

```dart
void main() {
  List<int> scores = [85, 92, 78, 96, 89];

  print('📊 GAME SCORES ANALYSIS:');
  print('');

  // Using forEach method
  scores.forEach((score) {
    if (score >= 90) {
      print('🏆 Excellent score: $score');
    } else if (score >= 80) {
      print('👍 Good score: $score');
    } else {
      print('📈 Keep practicing: $score');
    }
  });
}
```

**Output:**

```
📊 GAME SCORES ANALYSIS:

👍 Good score: 85
🏆 Excellent score: 92
📈 Keep practicing: 78
🏆 Excellent score: 96
👍 Good score: 89
```

---

## 🛠️ List Operations and Methods

```dart
void main() {
  List<int> numbers = [1, 2, 3, 4, 5];

  print('🔢 Original numbers: $numbers\n');

  // Reverse the list
  List<int> reversed = numbers.reversed.toList();
  print('🔄 Reversed: $reversed');

  // Sort the list (works with a copy)
  List<int> unsorted = [5, 2, 8, 1, 9, 3];
  print('🔀 Unsorted: $unsorted');
  unsorted.sort();
  print('📈 Sorted: $unsorted');

  // Get a portion of the list
  List<int> portion = numbers.sublist(1, 4);
  print('✂️ Portion (index 1-3): $portion');

  // Clear all items
  List<String> tempList = ['A', 'B', 'C'];
  print('📝 Before clear: $tempList');
  tempList.clear();
  print('🗑️ After clear: $tempList');
}
```

**Output:**

```
🔢 Original numbers: [1, 2, 3, 4, 5]

🔄 Reversed: [5, 4, 3, 2, 1]
🔀 Unsorted: [5, 2, 8, 1, 9, 3]
📈 Sorted: [1, 2, 3, 5, 8, 9]
✂️ Portion (index 1-3): [2, 3, 4]
📝 Before clear: [A, B, C]
🗑️ After clear: []
```

---

## 🎮 Interactive Game Example

```dart
void main() {
  List<String> playerInventory = [];
  List<String> availableItems = ['Sword', 'Shield', 'Potion', 'Key', 'Map'];

  print('🎮 ADVENTURE GAME - INVENTORY SYSTEM\n');

  // Player finds items
  print('🗡️ You found a Sword!');
  playerInventory.add('Sword');

  print('🛡️ You found a Shield!');
  playerInventory.add('Shield');

  print('🧪 You found 3 Potions!');
  for (int i = 0; i < 3; i++) {
    playerInventory.add('Potion');
  }

  // Display inventory
  print('\n🎒 YOUR INVENTORY:');
  for (int i = 0; i < playerInventory.length; i++) {
    print('  ${i + 1}. ${playerInventory[i]}');
  }

  // Count specific items
  int potionCount = 0;
  for (String item in playerInventory) {
    if (item == 'Potion') potionCount++;
  }

  print('\n📊 INVENTORY STATS:');
  print('📦 Total items: ${playerInventory.length}');
  print('🧪 Potions: $potionCount');
  print('⚔️ Weapons: ${playerInventory.contains('Sword') ? 1 : 0}');
  print('🛡️ Shields: ${playerInventory.contains('Shield') ? 1 : 0}');

  // Use a potion
  if (playerInventory.contains('Potion')) {
    print('\n💚 You used a potion to restore health!');
    playerInventory.remove('Potion');
    print('🧪 Potions remaining: ${playerInventory.where((item) => item == 'Potion').length}');
  }
}
```

**Output:**

```
🎮 ADVENTURE GAME - INVENTORY SYSTEM

🗡️ You found a Sword!
🛡️ You found a Shield!
🧪 You found 3 Potions!

🎒 YOUR INVENTORY:
  1. Sword
  2. Shield
  3. Potion
  4. Potion
  5. Potion

📊 INVENTORY STATS:
📦 Total items: 5
🧪 Potions: 3
⚔️ Weapons: 1
🛡️ Shields: 1

💚 You used a potion to restore health!
🧪 Potions remaining: 2
```

---

## 📚 Different Types of Lists

### String Lists

```dart
void main() {
  List<String> bookTitles = [
    'Harry Potter',
    'Lord of the Rings',
    'The Hunger Games',
    'Percy Jackson'
  ];

  print('📚 LIBRARY COLLECTION:\n');

  for (String book in bookTitles) {
    print('📖 "$book" - Available for checkout');
  }
}
```

### Number Lists

```dart
void main() {
  List<int> temperatures = [72, 75, 68, 82, 77, 71, 79];

  print('🌡️ WEEKLY TEMPERATURE REPORT:\n');

  int total = 0;
  for (int temp in temperatures) {
    total += temp;
    String description = temp > 75 ? 'Warm 🌞' : temp < 70 ? 'Cool 🧥' : 'Nice 😊';
    print('📊 ${temp}°F - $description');
  }

  double average = total / temperatures.length;
  print('\n📈 Average temperature: ${average.toStringAsFixed(1)}°F');
}
```

### Mixed Data Lists

```dart
void main() {
  // List of Maps (like a contact book)
  List<Map<String, dynamic>> contacts = [
    {'name': 'Alice', 'age': 25, 'city': 'New York'},
    {'name': 'Bob', 'age': 30, 'city': 'Los Angeles'},
    {'name': 'Charlie', 'age': 22, 'city': 'Chicago'},
  ];

  print('📱 CONTACT BOOK:\n');

  for (Map<String, dynamic> contact in contacts) {
    print('👤 ${contact['name']}');
    print('   🎂 Age: ${contact['age']}');
    print('   🏙️ City: ${contact['city']}\n');
  }
}
```

---

## 🎯 List Best Practices

### Creating Lists

```dart
void main() {
  // Different ways to create lists

  // 1. Empty list
  List<String> emptyList = [];
  List<String> emptyList2 = <String>[];

  // 2. List with initial values
  List<int> numbers = [1, 2, 3, 4, 5];

  // 3. Fixed-length list
  List<String> fixedList = List.filled(3, 'placeholder');
  print('Fixed list: $fixedList');

  // 4. Generated list
  List<int> squares = List.generate(5, (index) => index * index);
  print('Squares: $squares');

  // 5. List from other collections
  List<String> fromSet = {'apple', 'banana', 'cherry'}.toList();
  print('From set: $fromSet');
}
```

### Safe List Operations

```dart
void main() {
  List<String> fruits = ['apple', 'banana', 'cherry'];

  // Safe way to access items
  int index = 1;
  if (index < fruits.length) {
    print('✅ Safe access: ${fruits[index]}');
  } else {
    print('❌ Index out of bounds!');
  }

  // Safe way to check if empty
  if (fruits.isNotEmpty) {
    print('✅ First fruit: ${fruits.first}');
    print('✅ Last fruit: ${fruits.last}');
  }

  // Safe removal
  if (fruits.contains('banana')) {
    fruits.remove('banana');
    print('✅ Removed banana: $fruits');
  }
}
```

---

## 📊 Quick Reference Guide

### Essential List Methods

| Method       | Purpose                  | Example                  |
| ------------ | ------------------------ | ------------------------ |
| `add()`      | Add item to end          | `list.add('item')`       |
| `insert()`   | Add at specific position | `list.insert(0, 'item')` |
| `remove()`   | Remove specific item     | `list.remove('item')`    |
| `removeAt()` | Remove by index          | `list.removeAt(0)`       |
| `contains()` | Check if item exists     | `list.contains('item')`  |
| `indexOf()`  | Find item position       | `list.indexOf('item')`   |
| `length`     | Get list size            | `list.length`            |
| `isEmpty`    | Check if empty           | `list.isEmpty`           |
| `clear()`    | Remove all items         | `list.clear()`           |
| `sort()`     | Sort items               | `list.sort()`            |

### Common Patterns

```dart
// Loop through with index
for (int i = 0; i < list.length; i++) {
  print('${i}: ${list[i]}');
}

// Loop through items only
for (String item in list) {
  print(item);
}

// Check before accessing
if (list.isNotEmpty) {
  print(list.first);
}
```

---

## 🚀 Practice Challenges

Try creating these lists:

1. **🎵 Music Playlist**: Create a playlist, add songs, remove duplicates
2. **🛒 Shopping List**: Add items, mark as bought (remove), calculate total
3. **📝 Grade Tracker**: Store grades, calculate average, find highest/lowest
4. **👥 Friend List**: Manage friends, check if someone is a friend, sort alphabetically

---

## 🎉 Remember This!

Lists are like **organized containers** 📦:

- **📋 Ordered**: Items stay in the order you put them
- **🔢 Indexed**: Each item has a number (starting from 0)
- **📈 Dynamic**: Can grow or shrink as needed
- **🔍 Searchable**: Easy to find and check items
- **🔄 Flexible**: Add, remove, or change items anytime

**The Magic**: Lists help you organize multiple related items so you can work with them efficiently - just like organizing your room with labeled boxes! 🏠✨

**Pro Tip**: Always check if a list is empty before accessing `first` or `last` to avoid errors! 🛡️
