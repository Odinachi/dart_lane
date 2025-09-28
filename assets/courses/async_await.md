# async/await in Dart

Imagine you ordered pizza 🍕 for dinner, but it takes 30 minutes to arrive.

Do you just sit by the door staring at it for 30 minutes? **NO WAY!**

Instead, you:
- Keep watching TV 📺
- Text your friends 📱
- Maybe tidy up a bit 🧹
- **Then** answer the door when the pizza arrives!

👉 That's exactly what `async/await` does in programming:

> It lets your app **keep working** while waiting for slow things to finish, then handles the result when it's ready!

---

## 🎯 The Problem Without async/await

```dart
// ❌ This would freeze everything!
void badExample() {
  print('Ordering pizza...');
  // If this took 30 seconds, everything would freeze!
  // Your app would look broken to users! 😱
  print('Pizza arrived!');
}
```

**Problem**: The entire app stops working while waiting!

---

## ✅ The Solution: async/await

```dart
Future<String> orderPizza() async {
  print('📞 Calling pizza place...');
  await Future.delayed(Duration(seconds: 2)); // Wait 2 seconds
  return '🍕 Pizza delivered!';
}

void main() async {
  print('🏠 I\'m hungry, ordering food...');
  
  String result = await orderPizza();
  
  print(result);
  print('😋 Time to eat!');
}
```

**Output:**
```
🏠 I'm hungry, ordering food...
📞 Calling pizza place...
🍕 Pizza delivered!
😋 Time to eat!
```

---

## 🔍 Understanding the Keywords

### `async`
- Put this on functions that might take time
- Like putting a "⏰ SLOW" warning sign on a function
- **Must use this** if your function has `await` inside

```dart
// ✅ Correct
Future<void> slowFunction() async {
  await Future.delayed(Duration(seconds: 1));
}

// ❌ Wrong - missing async
Future<void> brokenFunction() {
  await Future.delayed(Duration(seconds: 1)); // ERROR!
}
```

### `await`
- Means "stop here and wait for this to finish"
- Like pressing pause ⏸️ until something is ready
- **Can only be used** inside `async` functions

```dart
void main() async {
  print('Starting...');
  await Future.delayed(Duration(seconds: 1)); // Wait 1 second
  print('1 second later!');
}
```

### `Future<T>`
- A promise to give you something later
- `Future<String>` = "I'll give you text later"
- `Future<int>` = "I'll give you a number later"

---

## 🏃‍♀️ Step-by-Step Example

Let's watch someone get ready for school:

```dart
Future<void> brushTeeth() async {
  print('🦷 Brushing teeth...');
  await Future.delayed(Duration(seconds: 2));
  print('✨ Teeth are clean!');
}

Future<void> eatBreakfast() async {
  print('🥞 Making breakfast...');
  await Future.delayed(Duration(seconds: 3));
  print('😋 Breakfast eaten!');
}

Future<void> packBag() async {
  print('🎒 Packing school bag...');
  await Future.delayed(Duration(seconds: 1));
  print('📚 Bag is ready!');
}

void main() async {
  print('⏰ Getting ready for school!\n');
  
  // Do each task one after another
  await brushTeeth();
  print('');
  
  await eatBreakfast();
  print('');
  
  await packBag();
  print('');
  
  print('🚌 Ready for the school bus!');
}
```

**Output:**
```
⏰ Getting ready for school!

🦷 Brushing teeth...
✨ Teeth are clean!

🥞 Making breakfast...
😋 Breakfast eaten!

🎒 Packing school bag...
📚 Bag is ready!

🚌 Ready for the school bus!
```

---

## 🕐 Different Wait Times

```dart
Future<String> fastTask() async {
  await Future.delayed(Duration(milliseconds: 500)); // Half second
  return '⚡ Fast task done!';
}

Future<String> mediumTask() async {
  await Future.delayed(Duration(seconds: 2)); // 2 seconds
  return '🚶 Medium task done!';
}

Future<String> slowTask() async {
  await Future.delayed(Duration(seconds: 4)); // 4 seconds
  return '🐌 Slow task done!';
}

void main() async {
  print('Starting all tasks...\n');
  
  String result1 = await fastTask();
  print(result1);
  
  String result2 = await mediumTask();
  print(result2);
  
  String result3 = await slowTask();
  print(result3);
  
  print('\n🎉 All done!');
}
```

---

## 🎮 Interactive Game Example

```dart
Future<int> rollDice() async {
  print('🎲 Rolling dice...');
  await Future.delayed(Duration(seconds: 1));
  
  int result = DateTime.now().millisecond % 6 + 1; // Random 1-6
  return result;
}

Future<String> playTurn(String playerName) async {
  print('\n🎯 $playerName\'s turn!');
  
  int roll = await rollDice();
  print('🎲 $playerName rolled: $roll');
  
  if (roll == 6) {
    return '$playerName wins! 🏆';
  } else if (roll >= 4) {
    return '$playerName did pretty good! 😊';
  } else {
    return '$playerName needs more practice! 😅';
  }
}

void main() async {
  print('🎮 Welcome to the Dice Game!');
  
  String result1 = await playTurn('Alice');
  print(result1);
  
  String result2 = await playTurn('Bob');
  print(result2);
  
  String result3 = await playTurn('Charlie');
  print(result3);
  
  print('\n🎉 Game Over!');
}
```

**Sample Output:**
```
🎮 Welcome to the Dice Game!

🎯 Alice's turn!
🎲 Rolling dice...
🎲 Alice rolled: 4
Alice did pretty good! 😊

🎯 Bob's turn!
🎲 Rolling dice...
🎲 Bob rolled: 6
Bob wins! 🏆

🎯 Charlie's turn!
🎲 Rolling dice...
🎲 Charlie rolled: 2
Charlie needs more practice! 😅

🎉 Game Over!
```

---

## 📱 Real App Example: Loading User Info

```dart
Future<String> loadUserName() async {
  print('👤 Loading user name...');
  await Future.delayed(Duration(seconds: 1));
  return 'Sarah Johnson';
}

Future<int> loadUserAge() async {
  print('🎂 Loading user age...');
  await Future.delayed(Duration(seconds: 1));
  return 25;
}

Future<String> loadUserCity() async {
  print('🏙️ Loading user city...');
  await Future.delayed(Duration(seconds: 1));
  return 'New York';
}

Future<void> displayUserProfile() async {
  print('📱 Opening user profile...\n');
  
  // Load each piece of info one by one
  String name = await loadUserName();
  print('✅ Name: $name\n');
  
  int age = await loadUserAge();
  print('✅ Age: $age\n');
  
  String city = await loadUserCity();
  print('✅ City: $city\n');
  
  print('🎉 Profile loaded completely!');
  print('📋 Summary: $name, age $age, lives in $city');
}

void main() async {
  await displayUserProfile();
}
```

**Output:**
```
📱 Opening user profile...

👤 Loading user name...
✅ Name: Sarah Johnson

🎂 Loading user age...
✅ Age: 25

🏙️ Loading user city...
✅ City: New York

🎉 Profile loaded completely!
📋 Summary: Sarah Johnson, age 25, lives in New York
```

---

## ⚠️ Common Mistakes

### Mistake 1: Forgetting `async`
```dart
// ❌ WRONG - This will cause an error!
void brokenFunction() {
  await Future.delayed(Duration(seconds: 1)); // ERROR!
}

// ✅ CORRECT - Add async
Future<void> fixedFunction() async {
  await Future.delayed(Duration(seconds: 1)); // Works!
}
```

### Mistake 2: Forgetting `await`
```dart
Future<String> getMessage() async {
  await Future.delayed(Duration(seconds: 1));
  return 'Hello!';
}

void main() async {
  // ❌ WRONG - This doesn't wait!
  String message = getMessage(); // This gives you a Future, not a String!
  
  // ✅ CORRECT - Use await
  String message = await getMessage(); // This gives you the actual String
  print(message);
}
```

---

## 🧠 Quick Reference

### Basic Pattern
```dart
Future<ReturnType> functionName() async {
  // Do some work
  await somethingThatTakesTime();
  // Do more work
  return result;
}
```

### Using It
```dart
void main() async {
  ReturnType result = await functionName();
  print(result);
}
```

### Key Rules
1. ✅ Functions with `await` inside **must** be marked `async`
2. ✅ Use `await` when you need to **wait** for something to finish
3. ✅ `await` can **only** be used inside `async` functions
4. ✅ `async` functions **always** return a `Future`

---

## 🎉 Remember This!

`async/await` is like **ordering food delivery** 🥡:

1. **`async`** = "This restaurant takes orders that take time"
2. **`await`** = "I'll wait here until my food arrives"
3. **While waiting**, the restaurant keeps taking other orders
4. **When ready**, you get exactly what you ordered!

Your code stays **smooth** and **responsive** instead of freezing up! 🎯