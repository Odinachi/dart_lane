# Higher-Order Functions in Dart

Imagine you're the **manager of a pizza restaurant** 🍕 during rush hour!

You have different **specialized workers**:

- 👨‍🍳 **Pizza Chef** (makes the pizza)
- 📞 **Phone Operator** (takes orders)
- 🚚 **Delivery Driver** (delivers food)

But here's the cool part: You have a **Smart Task Manager** that can work with ANY of these specialists! You just tell it:

> "Hey Smart Manager, take this Pizza Chef and make them work on Order #5!"

or

> "Hey Smart Manager, take this Delivery Driver and send them to Main Street!"

👉 **Higher-Order Functions** work exactly like this Smart Manager:

> They can **accept other functions as workers** and **coordinate their tasks**, or even **create new specialized workers** on demand!

---

## 🚫 The Problem: Repetitive Management Code

```dart
void makeMargaritaPizza() {
  print('🍕 Getting dough...');
  print('🍅 Adding tomato sauce...');
  print('🧀 Adding mozzarella cheese...');
  print('🔥 Baking in oven...');
  print('✅ Margherita pizza ready!');
}

void makePepperoniPizza() {
  print('🍕 Getting dough...');
  print('🍅 Adding tomato sauce...');
  print('🧀 Adding mozzarella cheese...');
  print('🍖 Adding pepperoni...');
  print('🔥 Baking in oven...');
  print('✅ Pepperoni pizza ready!');
}

void makeVeggiePizza() {
  print('🍕 Getting dough...');
  print('🍅 Adding tomato sauce...');
  print('🧀 Adding mozzarella cheese...');
  print('🥬 Adding vegetables...');
  print('🔥 Baking in oven...');
  print('✅ Veggie pizza ready!');
}
```

**Problems:**

- Lots of repeated code! 📋📋📋
- Hard to maintain! 😵
- What if we want to add a new topping process? 🤷‍♀️

---

## ✅ The Solution: Smart Pizza Manager (Higher-Order Function)

```dart
// Higher-order function that takes a "topping specialist" function
void makePizza(String pizzaType, Function addToppings) {
  print('🍕 Getting dough...');
  print('🍅 Adding tomato sauce...');
  print('🧀 Adding mozzarella cheese...');

  // Call the specialist function to add specific toppings
  addToppings();

  print('🔥 Baking in oven...');
  print('✅ $pizzaType pizza ready!');
}

// Topping specialist functions
void addPepperoni() {
  print('🍖 Adding pepperoni slices...');
}

void addVeggies() {
  print('🥬 Adding bell peppers, mushrooms, and olives...');
}

void addHawaiian() {
  print('🍍 Adding pineapple and ham...');
}

void main() {
  print('🏪 MARIO\'S PIZZA SHOP - RUSH HOUR! 🏪\n');

  makePizza('Pepperoni', addPepperoni);
  print('');
  makePizza('Veggie Supreme', addVeggies);
  print('');
  makePizza('Hawaiian', addHawaiian);

  // Using anonymous function for custom order
  print('');
  makePizza('Meat Lovers', () {
    print('🥓 Adding bacon...');
    print('🍖 Adding pepperoni...');
    print('🌭 Adding sausage...');
  });
}
```

**Output:**

```
🏪 MARIO'S PIZZA SHOP - RUSH HOUR! 🏪

🍕 Getting dough...
🍅 Adding tomato sauce...
🧀 Adding mozzarella cheese...
🍖 Adding pepperoni slices...
🔥 Baking in oven...
✅ Pepperoni pizza ready!

🍕 Getting dough...
🍅 Adding tomato sauce...
🧀 Adding mozzarella cheese...
🥬 Adding bell peppers, mushrooms, and olives...
🔥 Baking in oven...
✅ Veggie Supreme pizza ready!

🍕 Getting dough...
🍅 Adding tomato sauce...
🧀 Adding mozzarella cheese...
🍍 Adding pineapple and ham...
🔥 Baking in oven...
✅ Hawaiian pizza ready!

🍕 Getting dough...
🍅 Adding tomato sauce...
🧀 Adding mozzarella cheese...
🥓 Adding bacon...
🍖 Adding pepperoni...
🌭 Adding sausage...
🔥 Baking in oven...
✅ Meat Lovers pizza ready!
```

**Amazing!** One smart manager function handles all the different pizza types! 🎉

---

## 🎮 Gaming Example: Player Actions System

```dart
class Player {
  String name;
  int health = 100;
  int experience = 0;

  Player(this.name);

  void displayStats() {
    print('👤 $name - Health: $health HP, XP: $experience');
  }
}

// Higher-order function that performs an action on a player
void performAction(Player player, String actionName, Function action) {
  print('⚡ $actionName in progress...');
  action(player);
  print('✅ $actionName completed!\n');
}

// Different action functions
void healPlayer(Player player) {
  player.health += 20;
  if (player.health > 100) player.health = 100;
  print('💚 ${player.name} restored 20 health!');
}

void gainExperience(Player player) {
  player.experience += 50;
  print('⭐ ${player.name} gained 50 experience!');
}

void takeDamage(Player player) {
  player.health -= 15;
  if (player.health < 0) player.health = 0;
  print('💥 ${player.name} took 15 damage!');
}

void levelUp(Player player) {
  player.experience += 100;
  player.health = 100;
  print('🎉 ${player.name} leveled up! Full health restored!');
}

void main() {
  print('🎮 ADVENTURE GAME - PLAYER ACTIONS 🎮\n');

  Player hero = Player('Sir Brave');

  print('=== Starting Stats ===');
  hero.displayStats();
  print('');

  // Use higher-order function with different actions
  performAction(hero, 'Healing Potion', healPlayer);
  hero.displayStats();

  performAction(hero, 'Combat Training', gainExperience);
  hero.displayStats();

  performAction(hero, 'Monster Attack', takeDamage);
  hero.displayStats();

  performAction(hero, 'Quest Completion', levelUp);
  hero.displayStats();

  // Custom action using anonymous function
  performAction(hero, 'Magic Ritual', (Player p) {
    p.health += 30;
    p.experience += 25;
    print('✨ ${p.name} performed a magic ritual!');
    print('🔮 Gained health and magical knowledge!');
  });
  hero.displayStats();
}
```

**Output:**

```
🎮 ADVENTURE GAME - PLAYER ACTIONS 🎮

=== Starting Stats ===
👤 Sir Brave - Health: 100 HP, XP: 0

⚡ Healing Potion in progress...
💚 Sir Brave restored 20 health!
✅ Healing Potion completed!

👤 Sir Brave - Health: 100 HP, XP: 0
⚡ Combat Training in progress...
⭐ Sir Brave gained 50 experience!
✅ Combat Training completed!

👤 Sir Brave - Health: 100 HP, XP: 50
⚡ Monster Attack in progress...
💥 Sir Brave took 15 damage!
✅ Monster Attack completed!

👤 Sir Brave - Health: 85 HP, XP: 50
⚡ Quest Completion in progress...
🎉 Sir Brave leveled up! Full health restored!
✅ Quest Completion completed!

👤 Sir Brave - Health: 100 HP, XP: 150
⚡ Magic Ritual in progress...
✨ Sir Brave performed a magic ritual!
🔮 Gained health and magical knowledge!
✅ Magic Ritual completed!

👤 Sir Brave - Health: 100 HP, XP: 175
```

---

## 🏭 Function Factory: Creating Specialized Workers

Higher-order functions can also **return new functions**:

```dart
// Function that creates greeting functions for different languages
Function createGreeter(String language) {
  switch (language) {
    case 'english':
      return (String name) => print('👋 Hello, $name!');
    case 'spanish':
      return (String name) => print('👋 ¡Hola, $name!');
    case 'french':
      return (String name) => print('👋 Bonjour, $name!');
    case 'japanese':
      return (String name) => print('👋 Konnichiwa, $name!');
    default:
      return (String name) => print('👋 Hi, $name!');
  }
}

// Function that creates math operations
Function createMathOperation(String operation) {
  switch (operation) {
    case 'add':
      return (int a, int b) {
        int result = a + b;
        print('➕ $a + $b = $result');
        return result;
      };
    case 'multiply':
      return (int a, int b) {
        int result = a * b;
        print('✖️ $a × $b = $result');
        return result;
      };
    case 'subtract':
      return (int a, int b) {
        int result = a - b;
        print('➖ $a - $b = $result');
        return result;
      };
    default:
      return (int a, int b) => a;
  }
}

// Function that creates countdown functions
Function createCountdown(int start) {
  return () {
    for (int i = start; i > 0; i--) {
      print('⏰ $i...');
    }
    print('🚀 BLAST OFF!');
  };
}

void main() {
  print('🏭 FUNCTION FACTORY - CUSTOM WORKERS 🏭\n');

  // Create different greeting specialists
  print('=== Language Greeting Service ===');
  var englishGreeter = createGreeter('english');
  var spanishGreeter = createGreeter('spanish');
  var frenchGreeter = createGreeter('french');
  var japaneseGreeter = createGreeter('japanese');

  englishGreeter('Alice');
  spanishGreeter('Carlos');
  frenchGreeter('Marie');
  japaneseGreeter('Yuki');

  // Create different math specialists
  print('\n=== Math Operation Service ===');
  var adder = createMathOperation('add');
  var multiplier = createMathOperation('multiply');
  var subtractor = createMathOperation('subtract');

  adder(15, 25);
  multiplier(7, 8);
  subtractor(50, 18);

  // Create custom countdown specialists
  print('\n=== Countdown Service ===');
  var rocketCountdown = createCountdown(5);
  var gameCountdown = createCountdown(3);

  print('🚀 Rocket Launch:');
  rocketCountdown();

  print('\n🎮 Game Start:');
  gameCountdown();
}
```

**Output:**

```
🏭 FUNCTION FACTORY - CUSTOM WORKERS 🏭

=== Language Greeting Service ===
👋 Hello, Alice!
👋 ¡Hola, Carlos!
👋 Bonjour, Marie!
👋 Konnichiwa, Yuki!

=== Math Operation Service ===
➕ 15 + 25 = 40
✖️ 7 × 8 = 56
➖ 50 - 18 = 32

=== Countdown Service ===
🚀 Rocket Launch:
⏰ 5...
⏰ 4...
⏰ 3...
⏰ 2...
⏰ 1...
🚀 BLAST OFF!

🎮 Game Start:
⏰ 3...
⏰ 2...
⏰ 1...
🚀 BLAST OFF!
```

---

## 📱 Event Handler System

```dart
class Button {
  String label;
  Function? onPressed;

  Button(this.label, {this.onPressed});

  void click() {
    print('🖱️ Button "$label" clicked!');
    if (onPressed != null) {
      onPressed!();
    }
  }
}

class App {
  List<String> notifications = [];
  int likes = 0;
  bool isPlaying = false;

  void showNotification(String message) {
    notifications.add(message);
    print('🔔 Notification: $message');
  }

  void addLike() {
    likes++;
    print('❤️ Liked! Total likes: $likes');
  }

  void toggleMusic() {
    isPlaying = !isPlaying;
    String status = isPlaying ? 'Playing' : 'Stopped';
    print('🎵 Music $status');
  }

  void displayStats() {
    print('\n📊 App Stats:');
    print('💬 Notifications: ${notifications.length}');
    print('❤️ Total Likes: $likes');
    print('🎵 Music: ${isPlaying ? "Playing" : "Stopped"}');
    print('');
  }
}

// Higher-order function that creates button handlers
Function createButtonHandler(App app, String actionType) {
  switch (actionType) {
    case 'notification':
      return () => app.showNotification('You have a new message!');
    case 'like':
      return () => app.addLike();
    case 'music':
      return () => app.toggleMusic();
    case 'share':
      return () => app.showNotification('Content shared successfully!');
    default:
      return () => print('🤷‍♀️ Unknown action');
  }
}

void main() {
  print('📱 MOBILE APP - EVENT SYSTEM 📱\n');

  App myApp = App();

  // Create buttons with different handlers
  Button notificationBtn = Button('Notify Me', onPressed: createButtonHandler(myApp, 'notification'));
  Button likeBtn = Button('Like Post', onPressed: createButtonHandler(myApp, 'like'));
  Button musicBtn = Button('Play/Pause', onPressed: createButtonHandler(myApp, 'music'));
  Button shareBtn = Button('Share', onPressed: createButtonHandler(myApp, 'share'));

  // Custom button with anonymous function
  Button customBtn = Button('Custom Action', onPressed: () {
    myApp.showNotification('Custom action performed!');
    myApp.addLike();
    print('✨ Bonus points awarded!');
  });

  List<Button> buttons = [notificationBtn, likeBtn, musicBtn, shareBtn, customBtn];

  print('=== User Interaction Simulation ===');

  // Simulate user clicks
  for (Button button in buttons) {
    button.click();
    myApp.displayStats();
  }

  // More interactions
  print('=== More User Actions ===');
  likeBtn.click();
  likeBtn.click();
  musicBtn.click(); // Toggle music off
  notificationBtn.click();

  myApp.displayStats();
}
```

---

## 🔄 Data Processing Pipeline

```dart
// Higher-order function that applies transformations to a list
List<T> processData<T>(List<T> data, List<Function> transformations) {
  List<T> result = List.from(data);

  for (Function transform in transformations) {
    result = result.map((item) => transform(item)).cast<T>().toList();
  }

  return result;
}

// Higher-order function that filters data based on conditions
List<T> filterData<T>(List<T> data, Function condition) {
  return data.where((item) => condition(item)).toList();
}

// Higher-order function that aggregates data
R aggregateData<T, R>(List<T> data, R initialValue, Function aggregator) {
  R result = initialValue;
  for (T item in data) {
    result = aggregator(result, item);
  }
  return result;
}

void main() {
  print('🔄 DATA PROCESSING PIPELINE 🔄\n');

  // Student scores data
  List<int> rawScores = [85, 92, 78, 96, 88, 73, 91, 87, 84, 95];

  print('📊 Original scores: $rawScores');

  // Define transformation functions
  Function addBonusPoints = (int score) => score + 5;
  Function applyPercentage = (int score) => (score * 1.1).round();
  Function capAt100 = (int score) => score > 100 ? 100 : score;

  // Process data through multiple transformations
  List<int> processedScores = processData(rawScores, [
    addBonusPoints,
    applyPercentage,
    capAt100
  ]);

  print('✨ Processed scores: $processedScores');

  // Filter high performers
  List<int> highScores = filterData(processedScores, (int score) => score >= 95);
  print('🏆 High performers (95+): $highScores');

  // Filter students needing help
  List<int> needHelp = filterData(processedScores, (int score) => score < 85);
  print('📚 Need extra help (<85): $needHelp');

  // Calculate statistics using aggregation
  int totalScore = aggregateData(processedScores, 0, (int sum, int score) => sum + score);
  double averageScore = totalScore / processedScores.length;

  int maxScore = aggregateData(processedScores, 0, (int max, int score) => score > max ? score : max);
  int minScore = aggregateData(processedScores, 100, (int min, int score) => score < min ? score : min);

  print('\n📈 Statistics:');
  print('   Total: $totalScore points');
  print('   Average: ${averageScore.toStringAsFixed(1)}');
  print('   Highest: $maxScore');
  print('   Lowest: $minScore');

  // Process student names with transformations
  List<String> studentNames = ['alice smith', 'bob johnson', 'charlie brown'];

  print('\n👥 Student Name Processing:');
  print('Original names: $studentNames');

  List<String> formattedNames = processData(studentNames, [
    (String name) => name.split(' ').map((word) =>
      word[0].toUpperCase() + word.substring(1)).join(' '), // Title case
    (String name) => 'Student: $name', // Add prefix
  ]);

  print('Formatted names: $formattedNames');
}
```

---

## 🎨 Animation System

```dart
class AnimationController {
  String target;

  AnimationController(this.target);

  // Higher-order function that runs an animation with a callback
  void animate(String animationType, Function onComplete) {
    print('🎬 Starting $animationType animation on $target...');

    // Simulate animation duration
    switch (animationType) {
      case 'fadeIn':
        print('✨ $target fading in: 0% → 25% → 50% → 75% → 100%');
        break;
      case 'slideUp':
        print('📈 $target sliding up: ⬇️ → ⬆️');
        break;
      case 'bounce':
        print('🏀 $target bouncing: ⬇️ → ⬆️ → ⬇️ → ⬆️');
        break;
      case 'rotate':
        print('🔄 $target rotating: 0° → 90° → 180° → 270° → 360°');
        break;
    }

    print('✅ $animationType animation completed!');
    onComplete(); // Call the completion handler
  }

  // Higher-order function that chains multiple animations
  void chainAnimations(List<String> animations, List<Function> callbacks) {
    for (int i = 0; i < animations.length; i++) {
      animate(animations[i], i < callbacks.length ? callbacks[i] : () {});
    }
  }
}

// Higher-order function that creates animation completion handlers
Function createCompletionHandler(String message) {
  return () => print('🎉 $message');
}

// Higher-order function that creates a sequence runner
Function createSequenceRunner(List<Function> actions) {
  return () {
    print('🎭 Running action sequence...');
    for (Function action in actions) {
      action();
    }
    print('🎊 Sequence complete!');
  };
}

void main() {
  print('🎨 ANIMATION SYSTEM DEMO 🎨\n');

  AnimationController logoController = AnimationController('Company Logo');
  AnimationController menuController = AnimationController('Navigation Menu');

  // Single animations with completion handlers
  logoController.animate('fadeIn', createCompletionHandler('Logo is now visible!'));
  print('');

  menuController.animate('slideUp', createCompletionHandler('Menu is ready for interaction!'));
  print('');

  // Chain multiple animations
  print('=== Chained Animations ===');
  AnimationController heroController = AnimationController('Hero Image');

  heroController.chainAnimations(
    ['fadeIn', 'bounce', 'rotate'],
    [
      createCompletionHandler('Hero image appeared!'),
      createCompletionHandler('Hero image bounced!'),
      createCompletionHandler('Hero image rotated!'),
    ]
  );

  print('');

  // Create complex animation sequences
  print('=== Complex Animation Sequence ===');

  Function showNotification = () => print('💬 "Welcome!" notification shown');
  Function enableUserInput = () => print('⌨️ User input enabled');
  Function startBackgroundMusic = () => print('🎵 Background music started');
  Function showTutorial = () => print('📖 Tutorial popup displayed');

  Function welcomeSequence = createSequenceRunner([
    showNotification,
    enableUserInput,
    startBackgroundMusic,
    showTutorial,
  ]);

  AnimationController appController = AnimationController('Main App');
  appController.animate('fadeIn', welcomeSequence);
}
```

---

## 🧠 Built-in Higher-Order Functions

Dart has many built-in higher-order functions for collections:

```dart
void main() {
  print('🔧 BUILT-IN HIGHER-ORDER FUNCTIONS 🔧\n');

  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  List<String> fruits = ['apple', 'banana', 'cherry', 'date'];

  print('Original numbers: $numbers');
  print('Original fruits: $fruits\n');

  // MAP - Transform each element
  print('=== MAP (Transform) ===');
  var doubled = numbers.map((n) => n * 2).toList();
  print('Doubled: $doubled');

  var uppercased = fruits.map((fruit) => fruit.toUpperCase()).toList();
  print('Uppercased: $uppercased');

  var withEmojis = fruits.map((fruit) => '$fruit 🍎').toList();
  print('With emojis: $withEmojis\n');

  // WHERE - Filter elements
  print('=== WHERE (Filter) ===');
  var evenNumbers = numbers.where((n) => n % 2 == 0).toList();
  print('Even numbers: $evenNumbers');

  var longFruits = fruits.where((fruit) => fruit.length > 5).toList();
  print('Long fruit names: $longFruits\n');

  // REDUCE - Combine all elements into one
  print('=== REDUCE (Combine) ===');
  var sum = numbers.reduce((a, b) => a + b);
  print('Sum of all numbers: $sum');

  var longestFruit = fruits.reduce((a, b) => a.length > b.length ? a : b);
  print('Longest fruit name: $longestFruit\n');

  // FOLD - Like reduce but with initial value
  print('=== FOLD (Accumulate) ===');
  var product = numbers.fold(1, (prev, curr) => prev * curr);
  print('Product of all numbers: $product');

  var sentence = fruits.fold('I like: ', (prev, fruit) => prev + fruit + ' ');
  print('Sentence: $sentence\n');

  // forEach - Execute function for each element
  print('=== forEach (Execute) ===');
  numbers.where((n) => n <= 5).forEach((n) {
    String stars = '⭐' * n;
    print('Number $n: $stars');
  });

  print('\n🎊 All built-in higher-order functions demonstrated!');
}
```

**Output:**

```
🔧 BUILT-IN HIGHER-ORDER FUNCTIONS 🔧

Original numbers: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
Original fruits: [apple, banana, cherry, date]

=== MAP (Transform) ===
Doubled: [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
Uppercased: [APPLE, BANANA, CHERRY, DATE]
With emojis: [apple 🍎, banana 🍎, cherry 🍎, date 🍎]

=== WHERE (Filter) ===
Even numbers: [2, 4, 6, 8, 10]
Long fruit names: [banana, cherry]

=== REDUCE (Combine) ===
Sum of all numbers: 55
Longest fruit name: banana

=== FOLD (Accumulate) ===
Product of all numbers: 3628800
Sentence: I like: apple banana cherry date

=== forEach (Execute) ===
Number 1: ⭐
Number 2: ⭐⭐
Number 3: ⭐⭐⭐
Number 4: ⭐⭐⭐⭐
Number 5: ⭐⭐⭐⭐⭐

🎊 All built-in higher-order functions demonstrated!
```

---

## 📊 Quick Reference Guide

### Types of Higher-Order Functions

| Type                 | What it Does                          | Example                  |
| -------------------- | ------------------------------------- | ------------------------ |
| **Takes Function**   | Accepts another function as parameter | `list.map(transform)`    |
| **Returns Function** | Creates and returns a new function    | `createValidator(rules)` |
| **Both**             | Takes and returns functions           | `compose(f1, f2)`        |

### Common Patterns

```dart
// Function that takes another function
void executeWithTiming(Function task) {
  var start = DateTime.now();
  task();
  var end = DateTime.now();
  print('Task took: ${end.difference(start).inMilliseconds}ms');
}

// Function that returns a function
Function createMultiplier(int factor) {
  return (int number) => number * factor;
}

// Function that both takes and returns functions
Function compose(Function f1, Function f2) {
  return (input) => f1(f2(input));
}
```

### Built-in Higher-Order Functions

| Method      | Purpose                 | Example                             |
| ----------- | ----------------------- | ----------------------------------- |
| `map()`     | Transform elements      | `list.map((x) => x * 2)`            |
| `where()`   | Filter elements         | `list.where((x) => x > 5)`          |
| `reduce()`  | Combine to single value | `list.reduce((a, b) => a + b)`      |
| `fold()`    | Accumulate with initial | `list.fold(0, (sum, x) => sum + x)` |
| `forEach()` | Execute for each        | `list.forEach(print)`               |
| `any()`     | Check if any match      | `list.any((x) => x > 10)`           |
| `every()`   | Check if all match      | `list.every((x) => x > 0)`          |

---

## 🎯 When to Use Higher-Order Functions

**✅ Perfect for:**

- **Reusable logic** with customizable behavior
- **Event handling** systems
- **Data processing** pipelines
- **Configuration** and setup functions
- **Callback** systems

**❌ Not needed for:**

- Simple, one-time operations
- When function logic is tightly coupled
- Performance-critical code (overhead consideration)

---

## 🚀 Practice Challenges

Try creating higher-order functions for these scenarios:

1. **🎯 Validator Factory**: Create validators for emails, passwords, phone numbers
2. **🎨 Theme Generator**: Functions that create UI themes with different colors/styles
3. **📊 Chart Builder**: Functions that take data and create different chart types
4. **🔔 Notification System**: Create different notification handlers (email, SMS, push)

---

## 🎉 Remember This!

Higher-Order Functions are like having **super-smart assistants** 🤖✨:

- **📦 Function Containers**: They can hold other functions like boxes hold tools
- **🏭 Function Factories**: They can create new specialized functions on demand
- **🎛️ Control Centers**: They coordinate how other functions work together
- **⚡ Power Multipliers**: They make your code more flexible and reusable

**The Magic**: Instead of writing the same code over and over, you write smart functions that can work with different behaviors - like having one pizza-making process that works with any topping specialist! 🍕👨‍🍳

> **Think of it like**: "I have a Smart Manager that can work with ANY specialist - just tell them what to do!" 📋✨

Higher-Order Functions make your code more **modular**, **flexible**, and **powerful**! 🚀
