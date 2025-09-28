# Enums in Dart

Imagine you're organizing a **pizza restaurant** 🍕!

You have different pizza sizes, but you don't want people to type random words like:

- "big" 🤔
- "huge" 🤷‍♀️
- "extra-large-supreme-mega-size" 😵

Instead, you want **exactly 3 choices**:

- Small 🍕
- Medium 🍕🍕
- Large 🍕🍕🍕

👉 An **enum** is like having a **menu with fixed choices** - no substitutions allowed!

> Enums give you a **limited set of named options** that are **safe** and **clear**!

---

## 🚫 The Problem: Random Strings

```dart
void orderPizza(String size) {
  print('Ordering a $size pizza');
}

void main() {
  orderPizza('small');      // ✅ OK
  orderPizza('medium');     // ✅ OK
  orderPizza('LARGE');      // 🤔 Different case
  orderPizza('gigantic');   // ❌ Not a real size!
  orderPizza('smal');       // ❌ Typo!
}
```

**Problems:**

- **Typos** cause bugs 🐛
- **Different cases** cause confusion 🤷‍♀️
- **Invalid options** are allowed 😱
- **No autocomplete** help 💭

---

## ✅ The Solution: Enums!

```dart
enum PizzaSize {
  small,
  medium,
  large
}

void orderPizza(PizzaSize size) {
  print('Ordering a ${size.name} pizza 🍕');
}

void main() {
  orderPizza(PizzaSize.small);   // ✅ Perfect!
  orderPizza(PizzaSize.medium);  // ✅ Perfect!
  orderPizza(PizzaSize.large);   // ✅ Perfect!

  // orderPizza('gigantic');     // ❌ Compiler error - can't do this!
}
```

**Output:**

```
Ordering a small pizza 🍕
Ordering a medium pizza 🍕
Ordering a large pizza 🍕
```

**Amazing benefits:**

- **No typos** possible! ✨
- **Autocomplete** works perfectly 🎯
- **Only valid options** allowed 🛡️
- **Clear and readable** code 📖

---

## 🎮 Gaming Example: Player Status

```dart
enum PlayerStatus {
  idle,
  running,
  jumping,
  fighting,
  dead
}

class GamePlayer {
  String name;
  PlayerStatus status;
  int health;

  GamePlayer(this.name, this.status, this.health);

  void displayStatus() {
    String emoji = getStatusEmoji();
    String description = getStatusDescription();

    print('🎮 Player: $name');
    print('$emoji Status: ${status.name} - $description');
    print('❤️ Health: $health/100');
    print('');
  }

  String getStatusEmoji() {
    switch (status) {
      case PlayerStatus.idle:
        return '😴';
      case PlayerStatus.running:
        return '🏃‍♂️';
      case PlayerStatus.jumping:
        return '🦘';
      case PlayerStatus.fighting:
        return '⚔️';
      case PlayerStatus.dead:
        return '💀';
    }
  }

  String getStatusDescription() {
    switch (status) {
      case PlayerStatus.idle:
        return 'Standing around, waiting for action';
      case PlayerStatus.running:
        return 'Moving quickly across the battlefield';
      case PlayerStatus.jumping:
        return 'Leaping over obstacles';
      case PlayerStatus.fighting:
        return 'Engaged in combat with enemies';
      case PlayerStatus.dead:
        return 'Game over - respawn needed';
    }
  }

  void changeStatus(PlayerStatus newStatus) {
    print('🔄 ${name} changed from ${status.name} to ${newStatus.name}');
    status = newStatus;
  }
}

void main() {
  print('🎮 ADVENTURE GAME STATUS TRACKER\n');

  GamePlayer player = GamePlayer('DragonSlayer', PlayerStatus.idle, 100);

  // Show initial status
  player.displayStatus();

  // Player starts running
  player.changeStatus(PlayerStatus.running);
  player.displayStatus();

  // Player encounters obstacle
  player.changeStatus(PlayerStatus.jumping);
  player.displayStatus();

  // Battle time!
  player.changeStatus(PlayerStatus.fighting);
  player.health = 25;
  player.displayStatus();

  // Oh no!
  player.changeStatus(PlayerStatus.dead);
  player.health = 0;
  player.displayStatus();
}
```

**Output:**

```
🎮 ADVENTURE GAME STATUS TRACKER

🎮 Player: DragonSlayer
😴 Status: idle - Standing around, waiting for action
❤️ Health: 100/100

🔄 DragonSlayer changed from idle to running
🎮 Player: DragonSlayer
🏃‍♂️ Status: running - Moving quickly across the battlefield
❤️ Health: 100/100

🔄 DragonSlayer changed from running to jumping
🎮 Player: DragonSlayer
🦘 Status: jumping - Leaping over obstacles
❤️ Health: 100/100

🔄 DragonSlayer changed from jumping to fighting
🎮 Player: DragonSlayer
⚔️ Status: fighting - Engaged in combat with enemies
❤️ Health: 25/100

🔄 DragonSlayer changed from fighting to dead
🎮 Player: DragonSlayer
💀 Status: dead - Game over - respawn needed
❤️ Health: 0/100
```

---

## 🌤️ Weather App Example

```dart
enum WeatherCondition {
  sunny,
  cloudy,
  rainy,
  snowy,
  stormy
}

class WeatherReport {
  String city;
  WeatherCondition condition;
  int temperature;

  WeatherReport(this.city, this.condition, this.temperature);

  void displayWeather() {
    String emoji = getWeatherEmoji();
    String description = getWeatherDescription();
    String clothing = getClothingAdvice();

    print('🌍 Weather in $city:');
    print('$emoji Condition: ${condition.name} - $description');
    print('🌡️ Temperature: ${temperature}°F');
    print('👕 Clothing advice: $clothing');
    print('🎯 Activity: ${getActivitySuggestion()}');
    print('');
  }

  String getWeatherEmoji() {
    switch (condition) {
      case WeatherCondition.sunny:
        return '☀️';
      case WeatherCondition.cloudy:
        return '☁️';
      case WeatherCondition.rainy:
        return '🌧️';
      case WeatherCondition.snowy:
        return '❄️';
      case WeatherCondition.stormy:
        return '⛈️';
    }
  }

  String getWeatherDescription() {
    switch (condition) {
      case WeatherCondition.sunny:
        return 'Clear skies and bright sunshine';
      case WeatherCondition.cloudy:
        return 'Overcast with gray clouds';
      case WeatherCondition.rainy:
        return 'Steady rainfall expected';
      case WeatherCondition.snowy:
        return 'Snow falling, roads may be slippery';
      case WeatherCondition.stormy:
        return 'Thunderstorms with lightning';
    }
  }

  String getClothingAdvice() {
    switch (condition) {
      case WeatherCondition.sunny:
        return 'Light clothes, sunglasses, sunscreen';
      case WeatherCondition.cloudy:
        return 'Light jacket, comfortable clothes';
      case WeatherCondition.rainy:
        return 'Raincoat, umbrella, waterproof shoes';
      case WeatherCondition.snowy:
        return 'Heavy coat, warm boots, gloves';
      case WeatherCondition.stormy:
        return 'Stay indoors if possible!';
    }
  }

  String getActivitySuggestion() {
    switch (condition) {
      case WeatherCondition.sunny:
        return 'Perfect for outdoor sports, picnics, or beach trips';
      case WeatherCondition.cloudy:
        return 'Good for hiking, walking, or outdoor activities';
      case WeatherCondition.rainy:
        return 'Great day for indoor activities, reading, or movies';
      case WeatherCondition.snowy:
        return 'Time for snowball fights, skiing, or hot cocoa';
      case WeatherCondition.stormy:
        return 'Board games, video games, or cozy indoor time';
    }
  }
}

void main() {
  print('🌤️ WEATHER FORECAST CENTER\n');

  List<WeatherReport> forecasts = [
    WeatherReport('New York', WeatherCondition.sunny, 75),
    WeatherReport('Seattle', WeatherCondition.rainy, 58),
    WeatherReport('Chicago', WeatherCondition.stormy, 62),
    WeatherReport('Denver', WeatherCondition.snowy, 28),
    WeatherReport('Los Angeles', WeatherCondition.cloudy, 68),
  ];

  for (WeatherReport report in forecasts) {
    report.displayWeather();
  }

  print('📱 Stay safe and check weather updates regularly!');
}
```

**Output:**

```
🌤️ WEATHER FORECAST CENTER

🌍 Weather in New York:
☀️ Condition: sunny - Clear skies and bright sunshine
🌡️ Temperature: 75°F
👕 Clothing advice: Light clothes, sunglasses, sunscreen
🎯 Activity: Perfect for outdoor sports, picnics, or beach trips

🌍 Weather in Seattle:
🌧️ Condition: rainy - Steady rainfall expected
🌡️ Temperature: 58°F
👕 Clothing advice: Raincoat, umbrella, waterproof shoes
🎯 Activity: Great day for indoor activities, reading, or movies

🌍 Weather in Chicago:
⛈️ Condition: stormy - Thunderstorms with lightning
🌡️ Temperature: 62°F
👕 Clothing advice: Stay indoors if possible!
🎯 Activity: Board games, video games, or cozy indoor time

🌍 Weather in Denver:
❄️ Condition: snowy - Snow falling, roads may be slippery
🌡️ Temperature: 28°F
👕 Clothing advice: Heavy coat, warm boots, gloves
🎯 Activity: Time for snowball fights, skiing, or hot cocoa

🌍 Weather in Los Angeles:
☁️ Condition: cloudy - Overcast with gray clouds
🌡️ Temperature: 68°F
👕 Clothing advice: Light jacket, comfortable clothes
🎯 Activity: Good for hiking, walking, or outdoor activities

📱 Stay safe and check weather updates regularly!
```

---

## 🚦 Traffic Light System

```dart
enum TrafficLight {
  red,
  yellow,
  green
}

class TrafficController {
  TrafficLight currentLight;
  int timeRemaining;

  TrafficController(this.currentLight, this.timeRemaining);

  void displayStatus() {
    String emoji = getLightEmoji();
    String instruction = getDriverInstruction();
    String nextLight = getNextLight();

    print('$emoji Current Light: ${currentLight.name.toUpperCase()}');
    print('⏰ Time remaining: ${timeRemaining} seconds');
    print('🚗 Driver instruction: $instruction');
    print('🔄 Next: $nextLight');
    print('');
  }

  String getLightEmoji() {
    switch (currentLight) {
      case TrafficLight.red:
        return '🔴';
      case TrafficLight.yellow:
        return '🟡';
      case TrafficLight.green:
        return '🟢';
    }
  }

  String getDriverInstruction() {
    switch (currentLight) {
      case TrafficLight.red:
        return 'STOP! Do not proceed';
      case TrafficLight.yellow:
        return 'CAUTION! Prepare to stop';
      case TrafficLight.green:
        return 'GO! Proceed safely';
    }
  }

  String getNextLight() {
    switch (currentLight) {
      case TrafficLight.red:
        return 'Green light coming up';
      case TrafficLight.yellow:
        return 'Red light next';
      case TrafficLight.green:
        return 'Yellow light next';
    }
  }

  void changeLight() {
    TrafficLight oldLight = currentLight;

    switch (currentLight) {
      case TrafficLight.red:
        currentLight = TrafficLight.green;
        timeRemaining = 30;
        break;
      case TrafficLight.yellow:
        currentLight = TrafficLight.red;
        timeRemaining = 45;
        break;
      case TrafficLight.green:
        currentLight = TrafficLight.yellow;
        timeRemaining = 5;
        break;
    }

    print('🔄 Light changed from ${oldLight.name} to ${currentLight.name}');
  }

  void countdown() {
    if (timeRemaining > 0) {
      timeRemaining--;
      if (timeRemaining == 0) {
        print('⏰ Time\'s up! Light is changing...');
        changeLight();
      }
    }
  }
}

void main() {
  print('🚦 SMART TRAFFIC CONTROL SYSTEM\n');

  TrafficController intersection = TrafficController(TrafficLight.red, 10);

  // Simulate traffic light cycle
  for (int second = 1; second <= 15; second++) {
    print('⏱️ === SECOND $second ===');
    intersection.displayStatus();
    intersection.countdown();
    print('');
  }
}
```

---

## 🎵 Music Player Example

```dart
enum PlaybackState {
  stopped,
  playing,
  paused,
  loading
}

enum RepeatMode {
  off,
  one,
  all
}

class MusicPlayer {
  String currentSong;
  PlaybackState state;
  RepeatMode repeatMode;
  int volume;

  MusicPlayer(this.currentSong, this.state, this.repeatMode, this.volume);

  void displayPlayerStatus() {
    String stateEmoji = getStateEmoji();
    String repeatEmoji = getRepeatEmoji();

    print('🎵 === MUSIC PLAYER ===');
    print('🎧 Current song: $currentSong');
    print('$stateEmoji Playback: ${state.name}');
    print('$repeatEmoji Repeat: ${repeatMode.name}');
    print('🔊 Volume: $volume%');
    print('');
  }

  String getStateEmoji() {
    switch (state) {
      case PlaybackState.stopped:
        return '⏹️';
      case PlaybackState.playing:
        return '▶️';
      case PlaybackState.paused:
        return '⏸️';
      case PlaybackState.loading:
        return '⏳';
    }
  }

  String getRepeatEmoji() {
    switch (repeatMode) {
      case RepeatMode.off:
        return '➡️';
      case RepeatMode.one:
        return '🔂';
      case RepeatMode.all:
        return '🔁';
    }
  }

  void play() {
    if (state == PlaybackState.stopped || state == PlaybackState.paused) {
      state = PlaybackState.playing;
      print('▶️ Now playing: $currentSong');
    } else if (state == PlaybackState.playing) {
      print('🎵 Already playing: $currentSong');
    }
  }

  void pause() {
    if (state == PlaybackState.playing) {
      state = PlaybackState.paused;
      print('⏸️ Paused: $currentSong');
    } else {
      print('⚠️ Cannot pause - not currently playing');
    }
  }

  void stop() {
    state = PlaybackState.stopped;
    print('⏹️ Stopped playback');
  }

  void toggleRepeat() {
    switch (repeatMode) {
      case RepeatMode.off:
        repeatMode = RepeatMode.one;
        print('🔂 Repeat one song enabled');
        break;
      case RepeatMode.one:
        repeatMode = RepeatMode.all;
        print('🔁 Repeat all songs enabled');
        break;
      case RepeatMode.all:
        repeatMode = RepeatMode.off;
        print('➡️ Repeat disabled');
        break;
    }
  }
}

void main() {
  print('🎵 SPOTIFY-STYLE MUSIC PLAYER\n');

  MusicPlayer player = MusicPlayer(
    'Shape of You - Ed Sheeran',
    PlaybackState.stopped,
    RepeatMode.off,
    75
  );

  player.displayPlayerStatus();

  // Test player controls
  print('🎮 TESTING PLAYER CONTROLS:');
  player.play();
  player.displayPlayerStatus();

  player.pause();
  player.displayPlayerStatus();

  player.play();
  player.toggleRepeat();
  player.toggleRepeat();
  player.toggleRepeat();

  player.stop();
  player.displayPlayerStatus();
}
```

---

## 📱 Phone Battery Example

```dart
enum BatteryLevel {
  critical,  // 0-10%
  low,       // 11-25%
  medium,    // 26-50%
  good,      // 51-75%
  excellent  // 76-100%
}

enum ChargingStatus {
  notCharging,
  charging,
  fastCharging,
  wirelessCharging
}

class PhoneBattery {
  int percentage;
  ChargingStatus chargingStatus;

  PhoneBattery(this.percentage, this.chargingStatus);

  BatteryLevel get batteryLevel {
    if (percentage <= 10) return BatteryLevel.critical;
    if (percentage <= 25) return BatteryLevel.low;
    if (percentage <= 50) return BatteryLevel.medium;
    if (percentage <= 75) return BatteryLevel.good;
    return BatteryLevel.excellent;
  }

  void displayBatteryStatus() {
    String levelEmoji = getBatteryEmoji();
    String chargingEmoji = getChargingEmoji();
    String warning = getBatteryWarning();

    print('📱 === PHONE BATTERY STATUS ===');
    print('$levelEmoji Battery: $percentage% (${batteryLevel.name})');
    print('$chargingEmoji Charging: ${chargingStatus.name}');
    if (warning.isNotEmpty) {
      print('⚠️ Warning: $warning');
    }
    print('🕒 Estimated time: ${getTimeEstimate()}');
    print('');
  }

  String getBatteryEmoji() {
    switch (batteryLevel) {
      case BatteryLevel.critical:
        return '🪫';
      case BatteryLevel.low:
        return '🔋';
      case BatteryLevel.medium:
        return '🔋';
      case BatteryLevel.good:
        return '🔋';
      case BatteryLevel.excellent:
        return '🔋';
    }
  }

  String getChargingEmoji() {
    switch (chargingStatus) {
      case ChargingStatus.notCharging:
        return '🔌❌';
      case ChargingStatus.charging:
        return '🔌';
      case ChargingStatus.fastCharging:
        return '⚡';
      case ChargingStatus.wirelessCharging:
        return '🔄';
    }
  }

  String getBatteryWarning() {
    switch (batteryLevel) {
      case BatteryLevel.critical:
        return 'Phone will shut down soon! Charge immediately!';
      case BatteryLevel.low:
        return 'Low battery. Consider charging soon.';
      case BatteryLevel.medium:
      case BatteryLevel.good:
      case BatteryLevel.excellent:
        return '';
    }
  }

  String getTimeEstimate() {
    if (chargingStatus == ChargingStatus.notCharging) {
      switch (batteryLevel) {
        case BatteryLevel.critical:
          return '5-10 minutes remaining';
        case BatteryLevel.low:
          return '2-3 hours remaining';
        case BatteryLevel.medium:
          return '6-8 hours remaining';
        case BatteryLevel.good:
          return '12-15 hours remaining';
        case BatteryLevel.excellent:
          return '20+ hours remaining';
      }
    } else {
      int timeToFull = (100 - percentage) ~/ getChargingSpeed();
      return '$timeToFull minutes to full charge';
    }
  }

  int getChargingSpeed() {
    switch (chargingStatus) {
      case ChargingStatus.notCharging:
        return 0;
      case ChargingStatus.charging:
        return 2; // 2% per minute
      case ChargingStatus.fastCharging:
        return 5; // 5% per minute
      case ChargingStatus.wirelessCharging:
        return 1; // 1% per minute
    }
  }

  void simulateUsage(int minutes) {
    if (chargingStatus == ChargingStatus.notCharging) {
      percentage = (percentage - minutes).clamp(0, 100);
      print('📱 Used phone for $minutes minutes');
    } else {
      int chargeGained = minutes * getChargingSpeed();
      percentage = (percentage + chargeGained).clamp(0, 100);
      print('🔌 Charged for $minutes minutes');
    }
  }
}

void main() {
  print('📱 SMART PHONE BATTERY MONITOR\n');

  // Different battery scenarios
  List<PhoneBattery> phones = [
    PhoneBattery(8, ChargingStatus.notCharging),     // Critical
    PhoneBattery(20, ChargingStatus.charging),       // Low, charging
    PhoneBattery(45, ChargingStatus.fastCharging),   // Medium, fast charging
    PhoneBattery(65, ChargingStatus.wirelessCharging), // Good, wireless
    PhoneBattery(90, ChargingStatus.notCharging),    // Excellent
  ];

  for (int i = 0; i < phones.length; i++) {
    print('📱 PHONE ${i + 1}:');
    phones[i].displayBatteryStatus();
  }

  // Simulate charging the first phone
  print('🔌 CHARGING SIMULATION:');
  PhoneBattery chargingPhone = phones[0];
  chargingPhone.chargingStatus = ChargingStatus.fastCharging;

  for (int minute = 1; minute <= 5; minute++) {
    print('⏰ Minute $minute:');
    chargingPhone.simulateUsage(1);
    chargingPhone.displayBatteryStatus();
  }
}
```

---

## 🧠 Enum Properties and Methods

### Using .name Property

```dart
enum Color {
  red,
  green,
  blue
}

void main() {
  Color favoriteColor = Color.red;

  print('My favorite color is: ${favoriteColor.name}'); // red
  print('Uppercase: ${favoriteColor.name.toUpperCase()}'); // RED
}
```

### Using .values Property

```dart
enum DaysOfWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday
}

void main() {
  print('📅 All days of the week:');

  for (DaysOfWeek day in DaysOfWeek.values) {
    String emoji = day == DaysOfWeek.saturday || day == DaysOfWeek.sunday ? '🎉' : '💼';
    print('$emoji ${day.name}');
  }
}
```

### Enhanced Enums (Advanced)

```dart
enum Planet {
  mercury(3.303e+23, 2.4397e6),
  venus(4.869e+24, 6.0518e6),
  earth(5.976e+24, 6.37814e6),
  mars(6.421e+23, 3.3972e6);

  const Planet(this.mass, this.radius);

  final double mass;       // in kilograms
  final double radius;     // in meters

  double get surfaceGravity => 6.67300E-11 * mass / (radius * radius);

  double surfaceWeight(double mass) => mass * surfaceGravity;
}

void main() {
  print('🪐 PLANETARY DATA\n');

  double earthWeight = 75; // kg

  for (Planet planet in Planet.values) {
    double weight = planet.surfaceWeight(earthWeight);
    print('${planet.name}: ${weight.toStringAsFixed(1)} kg');
  }
}
```

---

## 📊 Quick Reference Guide

### Basic Enum Syntax

```dart
enum MyEnum {
  option1,
  option2,
  option3
}
```

### Using Enums

```dart
// Create enum value
MyEnum choice = MyEnum.option1;

// Get string name
String name = choice.name; // "option1"

// Compare enum values
if (choice == MyEnum.option1) {
  print('First option selected');
}

// Switch statement
switch (choice) {
  case MyEnum.option1:
    print('Handle option 1');
    break;
  case MyEnum.option2:
    print('Handle option 2');
    break;
  case MyEnum.option3:
    print('Handle option 3');
    break;
}

// Get all values
List<MyEnum> allOptions = MyEnum.values;
```

### Common Patterns

| Use Case       | Example                     | When to Use               |
| -------------- | --------------------------- | ------------------------- |
| **States**     | `playing, paused, stopped`  | Object has limited states |
| **Options**    | `small, medium, large`      | Fixed set of choices      |
| **Categories** | `food, drinks, desserts`    | Classification system     |
| **Priorities** | `low, medium, high, urgent` | Ranking or importance     |

---

## 🎯 When to Use Enums

**✅ Perfect for:**

- **Limited options** (pizza sizes, colors, directions)
- **State management** (loading, success, error)
- **Categories** (user roles, priority levels)
- **Configuration** (themes, languages, modes)

**❌ Not ideal for:**

- **Dynamic options** that change at runtime
- **Large sets** of values (hundreds of options)
- **User-generated** content
- **Numeric ranges** (use regular numbers instead)

---

## 🚀 Practice Challenges

Try creating enums for these scenarios:

1. **🎮 Game Difficulty**: Easy, Normal, Hard, Expert
2. **🌈 Theme Colors**: Light, Dark, Auto, Custom
3. **📧 Email Status**: Unread, Read, Archived, Deleted
4. **🚗 Vehicle Types**: Car, Truck, Motorcycle, Bus
5. **🎭 User Roles**: Guest, User, Admin, SuperAdmin

---

## 🎉 Remember This!

Enums are like **restaurant menus** 🍽️:

- **📋 Fixed choices** - You can only order what's on the menu
- **🔍 Clear options** - Each dish has a specific name
- **🚫 No substitutions** - Can't make up your own items
- **✅ Safe ordering** - No confusion about what you're getting

**The Magic**: Enums prevent bugs by **limiting your choices** to only valid options - like having guard rails on a mountain road! 🛡️🏔️

**Pro Tip**: When you find yourself using strings or numbers for categories, ask "Could this be an enum instead?" Often the answer is YES! 🎯✨
