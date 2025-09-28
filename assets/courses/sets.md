# Sets in Dart

Imagine you're running a **VIP club** 🍸 at the coolest party in town!

Your club has one **golden rule**: **"No duplicates allowed!"**

- 🎭 Each person can only enter **once** (even if they try multiple times)
- 🏷️ Everyone gets a **unique wristband**
- 📝 The **guest list** only shows each name **once**

You don't care about **when** people arrived or **what order** they're in - you just care that everyone is **unique** and **exclusive**!

👉 **Sets** in Dart work exactly like this VIP club:

> They store **unique items** with **no duplicates** allowed, and **order doesn't matter**!

---

## 🚫 The Problem: Duplicate Chaos

```dart
void main() {
  List<String> partyGuests = ['Alice', 'Bob', 'Alice', 'Charlie', 'Bob', 'Alice'];

  print('❌ Regular List allows duplicates:');
  print(partyGuests);
  // Output: [Alice, Bob, Alice, Charlie, Bob, Alice]

  print('\n😵 Problems:');
  print('- Alice appears 3 times!');
  print('- Bob appears 2 times!');
  print('- Confusing guest count!');
  print('- Wasted space!');
}
```

**Problems:**

- **Duplicate entries** clutter your data! 📋📋
- **Inaccurate counts** - how many unique guests? 🤷‍♀️
- **Wasted memory** storing the same thing multiple times 💾
- **Confusing logic** when checking membership 😵

---

## ✅ The Solution: VIP Set Club!

```dart
void main() {
  Set<String> vipGuests = {'Alice', 'Bob', 'Alice', 'Charlie', 'Bob', 'Alice'};

  print('✨ VIP Set automatically removes duplicates:');
  print(vipGuests);
  // Output: {Alice, Bob, Charlie}

  print('\n🎉 Benefits:');
  print('- Each guest appears exactly once!');
  print('- Clean and organized!');
  print('- Easy to count: ${vipGuests.length} unique guests');
}
```

**Output:**

```
✨ VIP Set automatically removes duplicates:
{Alice, Bob, Charlie}

🎉 Benefits:
- Each guest appears exactly once!
- Clean and organized!
- Easy to count: 3 unique guests
```

**Amazing!** Sets automatically handle duplicates for you! 🎪

---

## 🎮 Gaming Example: Unique Item Collection

```dart
void main() {
  print('🎮 TREASURE HUNTER GAME 🎮\n');

  Set<String> collectedItems = {};

  print('🗡️ Adventure begins! Collecting items...\n');

  // Player finds items (some are duplicates from different locations)
  List<String> foundItems = [
    'Magic Sword',
    'Health Potion',
    'Magic Sword',    // Duplicate!
    'Silver Key',
    'Health Potion',  // Duplicate!
    'Gold Coin',
    'Magic Sword',    // Another duplicate!
    'Ancient Map',
    'Gold Coin'       // Duplicate!
  ];

  for (String item in foundItems) {
    bool isNew = collectedItems.add(item);

    if (isNew) {
      print('✨ NEW ITEM COLLECTED: $item');
    } else {
      print('🔄 Already have $item - ignoring duplicate');
    }
  }

  print('\n🎒 FINAL INVENTORY:');
  print('─' * 30);
  int itemNumber = 1;
  for (String item in collectedItems) {
    print('$itemNumber. $item');
    itemNumber++;
  }

  print('─' * 30);
  print('📊 Total unique items: ${collectedItems.length}');
  print('🎯 Collection complete!');
}
```

**Output:**

```
🎮 TREASURE HUNTER GAME 🎮

🗡️ Adventure begins! Collecting items...

✨ NEW ITEM COLLECTED: Magic Sword
✨ NEW ITEM COLLECTED: Health Potion
🔄 Already have Magic Sword - ignoring duplicate
✨ NEW ITEM COLLECTED: Silver Key
🔄 Already have Health Potion - ignoring duplicate
✨ NEW ITEM COLLECTED: Gold Coin
🔄 Already have Magic Sword - ignoring duplicate
✨ NEW ITEM COLLECTED: Ancient Map
🔄 Already have Gold Coin - ignoring duplicate

🎒 FINAL INVENTORY:
──────────────────────────────
1. Magic Sword
2. Health Potion
3. Silver Key
4. Gold Coin
5. Ancient Map
──────────────────────────────
📊 Total unique items: 5
🎯 Collection complete!
```

---

## 🏫 School Example: Unique Student Skills

```dart
void main() {
  print('🏫 STUDENT SKILLS TRACKER 🏫\n');

  // Track skills learned by each student (no duplicates allowed!)
  Set<String> aliceSkills = {};
  Set<String> bobSkills = {};

  print('📚 Students are learning new skills...\n');

  // Alice learns skills (some repeated in different classes)
  List<String> aliceLearns = [
    'Math', 'Reading', 'Math', 'Art', 'Reading', 'Science', 'Math'
  ];

  print('=== Alice\'s Learning Journey ===');
  for (String skill in aliceLearns) {
    if (aliceSkills.add(skill)) {
      print('🌟 Alice mastered: $skill');
    } else {
      print('📖 Alice practiced: $skill (already mastered)');
    }
  }

  // Bob learns different skills
  List<String> bobLearns = [
    'Science', 'Art', 'Music', 'Science', 'Sports', 'Art'
  ];

  print('\n=== Bob\'s Learning Journey ===');
  for (String skill in bobLearns) {
    if (bobSkills.add(skill)) {
      print('🌟 Bob mastered: $skill');
    } else {
      print('📖 Bob practiced: $skill (already mastered)');
    }
  }

  print('\n📊 SKILL SUMMARY:');
  print('Alice\'s unique skills: $aliceSkills');
  print('Bob\'s unique skills: $bobSkills');

  // Find common skills
  Set<String> commonSkills = aliceSkills.intersection(bobSkills);
  print('🤝 Skills both students share: $commonSkills');

  // Find all skills in the class
  Set<String> allClassSkills = aliceSkills.union(bobSkills);
  print('🎓 All skills in the class: $allClassSkills');

  // Find Alice's unique skills
  Set<String> aliceOnlySkills = aliceSkills.difference(bobSkills);
  print('⭐ Skills only Alice has: $aliceOnlySkills');
}
```

**Output:**

```
🏫 STUDENT SKILLS TRACKER 🏫

📚 Students are learning new skills...

=== Alice's Learning Journey ===
🌟 Alice mastered: Math
🌟 Alice mastered: Reading
📖 Alice practiced: Math (already mastered)
🌟 Alice mastered: Art
📖 Alice practiced: Reading (already mastered)
🌟 Alice mastered: Science
📖 Alice practiced: Math (already mastered)

=== Bob's Learning Journey ===
🌟 Bob mastered: Science
🌟 Bob mastered: Art
🌟 Bob mastered: Music
📖 Bob practiced: Science (already mastered)
🌟 Bob mastered: Sports
📖 Bob practiced: Art (already mastered)

📊 SKILL SUMMARY:
Alice's unique skills: {Math, Reading, Art, Science}
Bob's unique skills: {Science, Art, Music, Sports}
🤝 Skills both students share: {Art, Science}
🎓 All skills in the class: {Math, Reading, Art, Science, Music, Sports}
⭐ Skills only Alice has: {Math, Reading}
```

---

## 🍕 Restaurant Example: Unique Pizza Toppings

```dart
void main() {
  print('🍕 MARIO\'S PIZZA CUSTOMIZER 🍕\n');

  Set<String> availableToppings = {
    'Pepperoni', 'Mushrooms', 'Bell Peppers', 'Sausage',
    'Onions', 'Olives', 'Pineapple', 'Extra Cheese'
  };

  print('🏪 Welcome to Mario\'s Pizza!');
  print('Available toppings: $availableToppings\n');

  // Customer orders (they might repeat toppings accidentally)
  print('👤 Customer 1 wants: Pepperoni, Mushrooms, Pepperoni, Cheese, Mushrooms');
  Set<String> pizza1Toppings = {'Pepperoni', 'Mushrooms', 'Pepperoni', 'Extra Cheese', 'Mushrooms'};

  print('🍕 Pizza 1 toppings: $pizza1Toppings');
  print('💰 Charged for ${pizza1Toppings.length} unique toppings\n');

  print('👤 Customer 2 wants: Pineapple, Sausage, Pineapple, Bell Peppers');
  Set<String> pizza2Toppings = {'Pineapple', 'Sausage', 'Pineapple', 'Bell Peppers'};

  print('🍕 Pizza 2 toppings: $pizza2Toppings');
  print('💰 Charged for ${pizza2Toppings.length} unique toppings\n');

  // Check for invalid toppings
  Set<String> pizza3Request = {'Pepperoni', 'Anchovies', 'Mushrooms'};
  print('👤 Customer 3 requests: $pizza3Request');

  Set<String> validToppings = pizza3Request.intersection(availableToppings);
  Set<String> invalidToppings = pizza3Request.difference(availableToppings);

  if (invalidToppings.isNotEmpty) {
    print('❌ Sorry! We don\'t have: $invalidToppings');
    print('✅ We can make it with: $validToppings');
  }

  // Popular toppings analysis
  Set<String> popularToday = pizza1Toppings.union(pizza2Toppings).union(validToppings);
  print('\n📊 DAILY STATS:');
  print('Most popular toppings today: $popularToday');
  print('Total unique toppings ordered: ${popularToday.length}');
}
```

---

## 🎵 Music Playlist: Unique Songs

```dart
void main() {
  print('🎵 SPOTIFY-STYLE PLAYLIST MANAGER 🎵\n');

  Set<String> myPlaylist = {};
  Set<String> friendsPlaylist = {
    'Shape of You', 'Blinding Lights', 'Watermelon Sugar', 'Good 4 U'
  };

  print('🎧 Creating your custom playlist...\n');

  // Add songs to playlist (with some attempted duplicates)
  List<String> songsToAdd = [
    'Bohemian Rhapsody',
    'Shape of You',      // Same as friend's
    'Imagine',
    'Bohemian Rhapsody', // Duplicate!
    'Billie Jean',
    'Shape of You',      // Another duplicate!
    'Hey Jude'
  ];

  for (String song in songsToAdd) {
    if (myPlaylist.add(song)) {
      print('🎶 Added: $song');
    } else {
      print('🔄 "$song" already in playlist - skipped');
    }
  }

  print('\n🎵 YOUR PLAYLIST:');
  print(myPlaylist);

  print('\n👥 FRIEND\'S PLAYLIST:');
  print(friendsPlaylist);

  // Discover shared music taste
  Set<String> sharedSongs = myPlaylist.intersection(friendsPlaylist);
  print('\n🤝 Songs you both like: $sharedSongs');

  // Get song recommendations from friend
  Set<String> recommendations = friendsPlaylist.difference(myPlaylist);
  print('💡 Friend recommends: $recommendations');

  // Create a party playlist combining both
  Set<String> partyPlaylist = myPlaylist.union(friendsPlaylist);
  print('🎉 Combined party playlist (${partyPlaylist.length} unique songs):');
  print(partyPlaylist);
}
```

---

## 🛒 Shopping Example: Unique Items Needed

```dart
void main() {
  print('🛒 SMART SHOPPING LIST MANAGER 🛒\n');

  // Different family members add items to shopping list
  Set<String> shoppingList = {};

  print('👨 Dad adds: Milk, Bread, Eggs');
  shoppingList.addAll(['Milk', 'Bread', 'Eggs']);

  print('👩 Mom adds: Milk, Apples, Bread, Butter');
  shoppingList.addAll(['Milk', 'Apples', 'Bread', 'Butter']);

  print('👧 Daughter adds: Cookies, Milk, Juice');
  shoppingList.addAll(['Cookies', 'Milk', 'Juice']);

  print('\n📝 CONSOLIDATED SHOPPING LIST:');
  print('─' * 30);
  int itemNumber = 1;
  for (String item in shoppingList) {
    print('$itemNumber. $item');
    itemNumber++;
  }

  print('─' * 30);
  print('📊 Total unique items to buy: ${shoppingList.length}');

  // Check what's already at home
  Set<String> itemsAtHome = {'Butter', 'Juice', 'Salt'};
  print('\n🏠 Items we already have at home: $itemsAtHome');

  // Remove items we already have
  Set<String> actuallyNeed = shoppingList.difference(itemsAtHome);
  print('🛍️ Items we actually need to buy: $actuallyNeed');

  // Calculate savings
  int originalItems = shoppingList.length;
  int itemsNeeded = actuallyNeed.length;
  int moneySaved = (originalItems - itemsNeeded) * 5; // Assume $5 per item

  print('💰 Money saved by checking at home first: \$${moneySaved}');
}
```

---

## 🎨 Art Class: Unique Colors Used

```dart
void main() {
  print('🎨 ART CLASS COLOR TRACKER 🎨\n');

  Set<String> availableColors = {
    'Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange',
    'Pink', 'Brown', 'Black', 'White'
  };

  print('🖌️ Ms. Johnson\'s art class has these colors: $availableColors\n');

  // Track colors used by each student
  Map<String, Set<String>> studentColors = {
    'Emma': <String>{},
    'Liam': <String>{},
    'Olivia': <String>{}
  };

  // Emma paints a sunset
  print('🌅 Emma is painting a sunset...');
  List<String> emmaUses = ['Red', 'Orange', 'Yellow', 'Red', 'Orange', 'Purple'];
  for (String color in emmaUses) {
    if (studentColors['Emma']!.add(color)) {
      print('  🎨 Emma uses $color for the first time');
    } else {
      print('  🔄 Emma uses more $color');
    }
  }

  // Liam paints a forest
  print('\n🌲 Liam is painting a forest...');
  List<String> liamUses = ['Green', 'Brown', 'Green', 'Blue', 'Brown', 'Yellow'];
  for (String color in liamUses) {
    if (studentColors['Liam']!.add(color)) {
      print('  🎨 Liam uses $color for the first time');
    } else {
      print('  🔄 Liam uses more $color');
    }
  }

  // Olivia paints a flower garden
  print('\n🌺 Olivia is painting a flower garden...');
  studentColors['Olivia']!.addAll(['Pink', 'Purple', 'Green', 'Yellow', 'White']);
  print('  🎨 Olivia uses: ${studentColors['Olivia']}');

  print('\n📊 CLASS COLOR USAGE ANALYSIS:');
  print('Emma used: ${studentColors['Emma']} (${studentColors['Emma']!.length} unique colors)');
  print('Liam used: ${studentColors['Liam']} (${studentColors['Liam']!.length} unique colors)');
  print('Olivia used: ${studentColors['Olivia']} (${studentColors['Olivia']!.length} unique colors)');

  // Find most popular colors
  Set<String> allUsedColors = studentColors['Emma']!
    .union(studentColors['Liam']!)
    .union(studentColors['Olivia']!);

  print('\n🌈 Colors used by the class: $allUsedColors');

  // Find unused colors
  Set<String> unusedColors = availableColors.difference(allUsedColors);
  print('😴 Colors nobody used today: $unusedColors');

  // Find shared colors (used by all students)
  Set<String> sharedByAll = studentColors['Emma']!
    .intersection(studentColors['Liam']!)
    .intersection(studentColors['Olivia']!);
  print('🤝 Colors used by all students: $sharedByAll');
}
```

---

## 🧠 Set Operations Deep Dive

### Union (Combine Sets)

```dart
void main() {
  Set<String> fruits = {'Apple', 'Banana', 'Orange'};
  Set<String> vegetables = {'Carrot', 'Broccoli', 'Apple'}; // Apple is in both!

  Set<String> produce = fruits.union(vegetables);
  print('🍎 Fruits: $fruits');
  print('🥕 Vegetables: $vegetables');
  print('🛒 All produce: $produce'); // Apple appears only once!
}
```

### Intersection (Common Items)

```dart
void main() {
  Set<String> aliceHobbies = {'Reading', 'Cooking', 'Gaming', 'Music'};
  Set<String> bobHobbies = {'Gaming', 'Sports', 'Music', 'Movies'};

  Set<String> commonHobbies = aliceHobbies.intersection(bobHobbies);
  print('👩 Alice likes: $aliceHobbies');
  print('👨 Bob likes: $bobHobbies');
  print('🤝 Both enjoy: $commonHobbies');
}
```

### Difference (What's Different)

```dart
void main() {
  Set<String> plannedFeatures = {'Login', 'Profile', 'Chat', 'Settings', 'Photos'};
  Set<String> completedFeatures = {'Login', 'Profile', 'Settings'};

  Set<String> remainingWork = plannedFeatures.difference(completedFeatures);
  print('📋 Planned features: $plannedFeatures');
  print('✅ Completed features: $completedFeatures');
  print('🔄 Still need to build: $remainingWork');
}
```

---

## 📊 Sets vs Other Collections

| Feature          | Set                | List               | Map                    |
| ---------------- | ------------------ | ------------------ | ---------------------- |
| **Duplicates**   | ❌ Not allowed     | ✅ Allowed         | ❌ Keys must be unique |
| **Order**        | ❌ Not guaranteed  | ✅ Maintains order | ❌ Not guaranteed      |
| **Index access** | ❌ No `set[0]`     | ✅ `list[0]`       | ✅ `map['key']`        |
| **Uniqueness**   | ✅ Automatic       | ❌ Manual          | ✅ For keys only       |
| **Best for**     | Unique collections | Ordered data       | Key-value pairs        |

---

## 🔍 Set Methods Reference

```dart
void main() {
  Set<String> mySet = {'Apple', 'Banana'};

  // Adding items
  mySet.add('Orange');           // Add single item
  mySet.addAll(['Grape', 'Kiwi']); // Add multiple items

  // Checking items
  bool hasApple = mySet.contains('Apple');        // Check if item exists
  bool isEmpty = mySet.isEmpty;                   // Check if set is empty
  bool isNotEmpty = mySet.isNotEmpty;            // Check if set has items
  int size = mySet.length;                       // Get number of items

  // Removing items
  bool removed = mySet.remove('Banana');         // Remove specific item
  mySet.removeWhere((fruit) => fruit.startsWith('K')); // Remove items matching condition
  mySet.clear();                                 // Remove all items

  // Set operations
  Set<String> set1 = {'A', 'B', 'C'};
  Set<String> set2 = {'B', 'C', 'D'};

  Set<String> union = set1.union(set2);          // Combine: {A, B, C, D}
  Set<String> intersection = set1.intersection(set2); // Common: {B, C}
  Set<String> difference = set1.difference(set2);     // Different: {A}

  print('Union: $union');
  print('Intersection: $intersection');
  print('Difference: $difference');
}
```

---

## 🎯 When to Use Sets

**✅ Perfect for:**

- **Removing duplicates** from data
- **Membership testing** (is this item in the collection?)
- **Mathematical operations** (union, intersection, difference)
- **Unique identifiers** (user IDs, product codes)
- **Tags and categories** (no duplicate tags)

**❌ Not ideal for:**

- **Ordered data** where position matters
- **Indexed access** (getting item at position 3)
- **Duplicate values** that are meaningful
- **Key-value relationships** (use Maps instead)

---

## 🚀 Practice Challenges

Try creating sets for these scenarios:

1. **🎓 Course Registration**: Track unique courses a student is enrolled in
2. **🏷️ Social Media Tags**: Manage hashtags (no duplicates allowed)
3. **🎪 Event Attendees**: Track unique visitors to avoid double-counting
4. **🎨 Color Palette**: Create unique color schemes for designs
5. **📚 Library Books**: Track unique books borrowed by a student

---

## 🎉 Remember This!

Sets are like **exclusive VIP clubs** 🎭:

- **🚫 No duplicates**: Each member is unique and special
- **🎪 No order**: Members don't line up in any particular order
- **⚡ Fast membership check**: Quickly know if someone belongs
- **🤝 Set operations**: Combine clubs, find common members, see differences
- **🎯 Purpose-built**: Perfect for when uniqueness matters most

**The Magic**: Sets automatically handle uniqueness for you, so you never have to worry about duplicates cluttering your data!

> **Think of it like**: "I'm creating a guest list where each person can only appear once, no matter how many times they try to RSVP!" 🎊✨

Sets make your data **clean**, **unique**, and **efficient**! 🚀
