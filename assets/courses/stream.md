# Streams in Dart

Imagine you're watching your favorite **Netflix series** 📺✨!

The episodes don't all download at once and fill up your phone's memory. Instead, they **stream** to you **one by one**, **exactly when you need them**:

- 🎬 Episode 1 arrives → You watch it
- 🎬 Episode 2 arrives → You watch it
- 🎬 Episode 3 arrives → You watch it
- And so on...

Meanwhile, you can **pause**, **skip**, or even **do other things** while waiting for the next episode!

👉 A **Stream** in Dart works exactly like Netflix:

> It delivers **multiple values over time**, one by one, and your app can **react to each value** as it arrives!

---

## 🚫 The Problem: Getting Everything at Once

```dart
// ❌ This is like downloading an entire movie series at once
Future<List<String>> getAllEpisodesAtOnce() async {
  // Wait for ALL episodes to be ready (could take forever!)
  await Future.delayed(Duration(seconds: 10));

  return [
    'Episode 1: The Beginning',
    'Episode 2: The Mystery',
    'Episode 3: The Plot Twist',
    'Episode 4: The Climax',
    'Episode 5: The Finale'
  ];

  // Problems:
  // - User waits 10 seconds with nothing happening 😴
  // - All episodes loaded into memory at once 💾💥
  // - Can't watch anything until EVERYTHING is ready ⏰
}
```

**Problems:**

- Long waiting times with no feedback! 😵
- Memory overload! 💥
- No way to react to individual pieces! 🤷‍♀️

---

## ✅ The Solution: Streaming Episodes

```dart
Stream<String> watchSeries() async* {
  await Future.delayed(Duration(seconds: 1));
  yield '🎬 Episode 1: The Beginning';

  await Future.delayed(Duration(seconds: 1));
  yield '🎬 Episode 2: The Mystery';

  await Future.delayed(Duration(seconds: 1));
  yield '🎬 Episode 3: The Plot Twist';

  await Future.delayed(Duration(seconds: 1));
  yield '🎬 Episode 4: The Climax';

  await Future.delayed(Duration(seconds: 1));
  yield '🎬 Episode 5: The Finale';
}

void main() async {
  print('📺 Starting Netflix binge session...\n');

  await for (String episode in watchSeries()) {
    print('✨ Now streaming: $episode');
    print('🍿 *munching popcorn while watching*');
    print('');
  }

  print('🎊 Series completed! What a journey!');
}
```

**Output:**

```
📺 Starting Netflix binge session...

✨ Now streaming: 🎬 Episode 1: The Beginning
🍿 *munching popcorn while watching*

✨ Now streaming: 🎬 Episode 2: The Mystery
🍿 *munching popcorn while watching*

✨ Now streaming: 🎬 Episode 3: The Plot Twist
🍿 *munching popcorn while watching*

✨ Now streaming: 🎬 Episode 4: The Climax
🍿 *munching popcorn while watching*

✨ Now streaming: 🎬 Episode 5: The Finale
🍿 *munching popcorn while watching*

🎊 Series completed! What a journey!
```

**Perfect!** Each episode arrives just when you need it! 🎪

---

## 🎵 Music Streaming Example

```dart
Stream<Map<String, dynamic>> playPlaylist() async* {
  List<Map<String, dynamic>> songs = [
    {'title': 'Happy Song', 'artist': 'Joy Band', 'duration': 3},
    {'title': 'Dance Floor', 'artist': 'Beat Masters', 'duration': 4},
    {'title': 'Chill Vibes', 'artist': 'Relaxed', 'duration': 5},
    {'title': 'Rock Anthem', 'artist': 'Thunder', 'duration': 4},
    {'title': 'Love Ballad', 'artist': 'Heart Strings', 'duration': 6},
  ];

  for (var song in songs) {
    yield song;
    // Simulate song duration
    await Future.delayed(Duration(seconds: 1)); // Faster for demo
  }
}

void main() async {
  print('🎵 SPOTIFY-STYLE MUSIC PLAYER 🎵\n');

  int songNumber = 1;

  await for (var song in playPlaylist()) {
    print('🎶 Track $songNumber: ${song['title']}');
    print('👤 Artist: ${song['artist']}');
    print('⏱️ Duration: ${song['duration']}:00');
    print('🔊 ♪♫♪ Now playing... ♪♫♪');
    print('📊 [████████████████████] 100%\n');

    songNumber++;
  }

  print('🎉 Playlist finished! Time to discover new music!');
}
```

**Output:**

```
🎵 SPOTIFY-STYLE MUSIC PLAYER 🎵

🎶 Track 1: Happy Song
👤 Artist: Joy Band
⏱️ Duration: 3:00
🔊 ♪♫♪ Now playing... ♪♫♪
📊 [████████████████████] 100%

🎶 Track 2: Dance Floor
👤 Artist: Beat Masters
⏱️ Duration: 4:00
🔊 ♪♫♪ Now playing... ♪♫♪
📊 [████████████████████] 100%

🎶 Track 3: Chill Vibes
👤 Artist: Relaxed
⏱️ Duration: 5:00
🔊 ♪♫♪ Now playing... ♪♫♪
📊 [████████████████████] 100%

🎶 Track 4: Rock Anthem
👤 Artist: Thunder
⏱️ Duration: 4:00
🔊 ♪♫♪ Now playing... ♪♫♪
📊 [████████████████████] 100%

🎶 Track 5: Love Ballad
👤 Artist: Heart Strings
⏱️ Duration: 6:00
🔊 ♪♫♪ Now playing... ♪♫♪
📊 [████████████████████] 100%

🎉 Playlist finished! Time to discover new music!
```

---

## 📱 Social Media Feed Stream

```dart
Stream<Map<String, dynamic>> socialMediaFeed() async* {
  List<Map<String, dynamic>> posts = [
    {
      'user': '@sarah_codes',
      'content': 'Just built my first Flutter app! 🚀',
      'likes': 127,
      'time': '2 min ago'
    },
    {
      'user': '@tech_guru',
      'content': 'Streams in Dart are amazing for real-time data! 💡',
      'likes': 89,
      'time': '5 min ago'
    },
    {
      'user': '@coffee_lover',
      'content': 'Perfect coding fuel ☕ What\'s your go-to drink?',
      'likes': 203,
      'time': '8 min ago'
    },
    {
      'user': '@design_wizard',
      'content': 'New UI design for a travel app 🌎✈️',
      'likes': 156,
      'time': '12 min ago'
    },
    {
      'user': '@dart_fan',
      'content': 'async* and yield are my new favorite keywords! 🎯',
      'likes': 94,
      'time': '15 min ago'
    },
  ];

  for (var post in posts) {
    await Future.delayed(Duration(milliseconds: 800)); // New post every 0.8 seconds
    yield post;
  }
}

void main() async {
  print('📱 SOCIAL MEDIA FEED 📱');
  print('🔄 Pull to refresh...\n');

  await for (var post in socialMediaFeed()) {
    print('┌─────────────────────────────────────┐');
    print('│ ${post['user'].padRight(35)} │');
    print('├─────────────────────────────────────┤');
    print('│ ${post['content'].padRight(35)} │');
    print('├─────────────────────────────────────┤');
    print('│ ❤️ ${post['likes'].toString().padRight(3)} 💬 12 🔄 5 ${post['time'].padLeft(15)} │');
    print('└─────────────────────────────────────┘');
    print('');
  }

  print('📲 End of feed - Check back later for more posts!');
}
```

---

## 🌡️ Temperature Sensor Stream

```dart
Stream<double> temperatureSensor() async* {
  // Simulate a temperature sensor that reads every 2 seconds
  double baseTemp = 72.0; // Starting temperature in Fahrenheit

  for (int i = 0; i < 10; i++) {
    // Simulate temperature fluctuations
    double variation = (DateTime.now().millisecond % 6) - 3; // Random -3 to +3
    double currentTemp = baseTemp + variation;

    yield currentTemp;
    await Future.delayed(Duration(milliseconds: 500)); // Faster for demo
  }
}

Stream<String> weatherAlerts(Stream<double> tempStream) async* {
  await for (double temp in tempStream) {
    if (temp > 80) {
      yield '🔥 HIGH TEMPERATURE ALERT: ${temp.toStringAsFixed(1)}°F - Stay hydrated!';
    } else if (temp < 65) {
      yield '❄️ COLD TEMPERATURE ALERT: ${temp.toStringAsFixed(1)}°F - Bundle up!';
    } else {
      yield '🌡️ Temperature Normal: ${temp.toStringAsFixed(1)}°F - Perfect weather!';
    }
  }
}

void main() async {
  print('🌡️ SMART HOME TEMPERATURE MONITORING 🌡️\n');
  print('📊 Monitoring temperature every 2 seconds...\n');

  Stream<double> tempStream = temperatureSensor();
  Stream<String> alertStream = weatherAlerts(tempStream);

  await for (String alert in alertStream) {
    String timestamp = DateTime.now().toString().substring(11, 19);
    print('[$timestamp] $alert');
  }

  print('\n📱 Monitoring session complete. Sensor going to sleep mode.');
}
```

**Output:**

```
🌡️ SMART HOME TEMPERATURE MONITORING 🌡️

📊 Monitoring temperature every 2 seconds...

[14:32:15] 🌡️ Temperature Normal: 74.0°F - Perfect weather!
[14:32:16] 🌡️ Temperature Normal: 75.0°F - Perfect weather!
[14:32:17] ❄️ COLD TEMPERATURE ALERT: 69.0°F - Bundle up!
[14:32:18] 🌡️ Temperature Normal: 73.0°F - Perfect weather!
[14:32:19] 🔥 HIGH TEMPERATURE ALERT: 74.0°F - Stay hydrated!
[14:32:20] 🌡️ Temperature Normal: 72.0°F - Perfect weather!
[14:32:21] 🌡️ Temperature Normal: 71.0°F - Perfect weather!
[14:32:22] ❄️ COLD TEMPERATURE ALERT: 69.0°F - Bundle up!
[14:32:23] 🌡️ Temperature Normal: 75.0°F - Perfect weather!
[14:32:24] 🌡️ Temperature Normal: 74.0°F - Perfect weather!

📱 Monitoring session complete. Sensor going to sleep mode.
```

---

## 🎮 Game Events Stream

```dart
enum GameEventType { spawn, powerup, damage, levelup, win, lose }

class GameEvent {
  final GameEventType type;
  final String message;
  final int score;
  final DateTime timestamp;

  GameEvent(this.type, this.message, this.score) : timestamp = DateTime.now();

  String get emoji {
    switch (type) {
      case GameEventType.spawn: return '👾';
      case GameEventType.powerup: return '⚡';
      case GameEventType.damage: return '💥';
      case GameEventType.levelup: return '🆙';
      case GameEventType.win: return '🏆';
      case GameEventType.lose: return '💀';
    }
  }
}

Stream<GameEvent> gameEventStream() async* {
  List<GameEvent> events = [
    GameEvent(GameEventType.spawn, 'Enemy spaceship appeared!', 0),
    GameEvent(GameEventType.damage, 'Player took 10 damage!', 0),
    GameEvent(GameEventType.powerup, 'Shield power-up collected!', 500),
    GameEvent(GameEventType.spawn, 'Boss enemy spawned!', 0),
    GameEvent(GameEventType.damage, 'Boss dealt 25 damage!', 0),
    GameEvent(GameEventType.powerup, 'Double shot acquired!', 750),
    GameEvent(GameEventType.levelup, 'Advanced to Level 2!', 1000),
    GameEvent(GameEventType.win, 'Boss defeated!', 2500),
  ];

  for (var event in events) {
    await Future.delayed(Duration(milliseconds: 600));
    yield event;
  }
}

void main() async {
  print('🎮 SPACE SHOOTER GAME 🎮');
  print('🚀 Starting game...\n');

  int totalScore = 0;

  await for (GameEvent event in gameEventStream()) {
    totalScore += event.score;
    String timeStr = event.timestamp.toString().substring(11, 19);

    print('${event.emoji} [$timeStr] ${event.message}');

    if (event.score > 0) {
      print('   💰 +${event.score} points! Total: $totalScore');
    }

    // React to specific events
    switch (event.type) {
      case GameEventType.damage:
        print('   🚨 Health warning: Take cover!');
        break;
      case GameEventType.powerup:
        print('   ✨ Power-up activated! You feel stronger!');
        break;
      case GameEventType.levelup:
        print('   🎊 Congratulations! New abilities unlocked!');
        break;
      case GameEventType.win:
        print('   🎉 Victory achieved! Well played!');
        break;
      default:
        break;
    }

    print('');
  }

  print('🎯 FINAL SCORE: $totalScore points');
  print('🏁 Game Over! Thanks for playing!');
}
```

---

## 💾 File Download Progress Stream

```dart
Stream<Map<String, dynamic>> downloadFile(String fileName, int fileSizeKB) async* {
  int downloadedKB = 0;
  int chunkSize = fileSizeKB ~/ 10; // Download in 10 chunks

  while (downloadedKB < fileSizeKB) {
    await Future.delayed(Duration(milliseconds: 200)); // Simulate download time

    downloadedKB += chunkSize;
    if (downloadedKB > fileSizeKB) downloadedKB = fileSizeKB;

    double progress = downloadedKB / fileSizeKB;
    int progressPercent = (progress * 100).round();

    yield {
      'fileName': fileName,
      'downloadedKB': downloadedKB,
      'totalKB': fileSizeKB,
      'progress': progress,
      'progressPercent': progressPercent,
      'isComplete': downloadedKB >= fileSizeKB,
    };
  }
}

String createProgressBar(double progress, int width) {
  int filledWidth = (progress * width).round();
  String filled = '█' * filledWidth;
  String empty = '░' * (width - filledWidth);
  return filled + empty;
}

void main() async {
  print('📁 FILE DOWNLOAD MANAGER 📁\n');

  List<Map<String, int>> files = [
    {'name': 'awesome_game.zip', 'size': 2500},
    {'name': 'holiday_photos.zip', 'size': 1800},
    {'name': 'music_collection.mp3', 'size': 3200},
  ];

  for (var fileInfo in files) {
    String fileName = fileInfo['name'] ?? '';
    int fileSize = fileInfo['size'] ?? 0;

    print('⬇️ Starting download: $fileName (${fileSize}KB)');
    print('');

    await for (var progress in downloadFile(fileName, fileSize)) {
      String progressBar = createProgressBar(progress['progress'], 20);

      print('\r📋 ${progress['fileName']}');
      print('📊 [$progressBar] ${progress['progressPercent']}%');
      print('💾 ${progress['downloadedKB']}KB / ${progress['totalKB']}KB');

      if (progress['isComplete']) {
        print('✅ Download complete!');
        print('🎉 File saved successfully!\n');
      } else {
        print('⏳ Downloading...\n');
      }
    }
  }

  print('🎊 All downloads completed! Enjoy your files!');
}
```

---

## 🧠 Stream Operations and Transformations

```dart
Stream<int> numberStream() async* {
  for (int i = 1; i <= 10; i++) {
    await Future.delayed(Duration(milliseconds: 100));
    yield i;
  }
}

void main() async {
  print('🔧 STREAM OPERATIONS DEMO 🔧\n');

  // Original stream
  print('=== Original Numbers ===');
  await for (int number in numberStream()) {
    print('📍 $number');
  }

  // Transform with map
  print('\n=== Doubled Numbers (map) ===');
  await for (int doubled in numberStream().map((n) => n * 2)) {
    print('✖️ $doubled');
  }

  // Filter with where
  print('\n=== Even Numbers Only (where) ===');
  await for (int even in numberStream().where((n) => n % 2 == 0)) {
    print('⚡ $even');
  }

  // Take first few
  print('\n=== First 5 Numbers (take) ===');
  await for (int first in numberStream().take(5)) {
    print('🎯 $first');
  }

  // Skip some
  print('\n=== Skip First 3 (skip) ===');
  await for (int skipped in numberStream().skip(3)) {
    print('🚀 $skipped');
  }

  // Combine operations
  print('\n=== Complex: Skip 2, Take 4, Double, Only Even ===');
  await for (int complex in numberStream()
      .skip(2)
      .take(4)
      .map((n) => n * 2)
      .where((n) => n % 4 == 0)) {
    print('🎪 $complex');
  }
}
```

---

## 🚨 Error Handling in Streams

```dart
Stream<String> unstableNetworkStream() async* {
  List<String> data = ['Data 1', 'Data 2', 'Data 3', 'Data 4', 'Data 5'];

  for (int i = 0; i < data.length; i++) {
    await Future.delayed(Duration(milliseconds: 300));

    // Simulate network error on 3rd item
    if (i == 2) {
      throw Exception('🌐 Network connection lost!');
    }

    yield '📦 ${data[i]}';
  }
}

void main() async {
  print('🌐 NETWORK DATA STREAM WITH ERROR HANDLING 🌐\n');

  try {
    await for (String data in unstableNetworkStream()) {
      print('✅ Received: $data');
    }
  } catch (error) {
    print('🚨 Error caught: $error');
    print('🔄 Attempting to reconnect...');

    // Handle the error gracefully
    print('💡 Switching to offline mode...');
    print('📱 Using cached data instead!');
  }

  print('\n🛡️ App continues running smoothly despite the error!');
}
```

---

## 📊 Different Ways to Listen to Streams

### 1. **Using await for (Most Common)**

```dart
void listenWithAwaitFor() async {
  print('🎧 Method 1: await for loop');

  await for (String episode in watchSeries()) {
    print('📺 Watching: $episode');
  }

  print('✅ Series finished!');
}
```

### 2. **Using .listen() Method**

```dart
void listenWithListenMethod() {
  print('🎧 Method 2: .listen() method');

  watchSeries().listen(
    (String episode) {
      print('📺 Streaming: $episode');
    },
    onError: (error) {
      print('❌ Error: $error');
    },
    onDone: () {
      print('✅ All episodes watched!');
    },
  );
}
```

### 3. **Using Stream Subscription**

```dart
void listenWithSubscription() {
  print('🎧 Method 3: Stream subscription');

  var subscription = watchSeries().listen((String episode) {
    print('📺 Now playing: $episode');
  });

  // You can pause, resume, or cancel
  // subscription.pause();
  // subscription.resume();
  // subscription.cancel();
}
```

---

## 🎭 Stream vs Future vs Regular Functions

```dart
void demonstrateDifferences() async {
  print('🎭 UNDERSTANDING THE DIFFERENCES 🎭\n');

  // Regular function - returns one value immediately
  String regularFunction() {
    return '📦 One value returned immediately';
  }

  // Future - returns one value later
  Future<String> futureFunction() async {
    await Future.delayed(Duration(seconds: 1));
    return '⏰ One value returned after waiting';
  }

  // Stream - returns multiple values over time
  Stream<String> streamFunction() async* {
    await Future.delayed(Duration(milliseconds: 500));
    yield '🌊 First value from stream';

    await Future.delayed(Duration(milliseconds: 500));
    yield '🌊 Second value from stream';

    await Future.delayed(Duration(milliseconds: 500));
    yield '🌊 Third value from stream';
  }

  print('=== Regular Function ===');
  String regular = regularFunction();
  print(regular);

  print('\n=== Future Function ===');
  String future = await futureFunction();
  print(future);

  print('\n=== Stream Function ===');
  await for (String streamValue in streamFunction()) {
    print(streamValue);
  }
}
```

---

## 📚 Quick Reference Guide

### Stream Creation

| Method   | Purpose                             | Example                                |
| -------- | ----------------------------------- | -------------------------------------- |
| `async*` | Create stream function              | `Stream<String> myStream() async* { }` |
| `yield`  | Send one value                      | `yield 'Hello';`                       |
| `yield*` | Send all values from another stream | `yield* anotherStream();`              |

### Stream Operations

| Method     | Purpose              | Example                                |
| ---------- | -------------------- | -------------------------------------- |
| `map()`    | Transform each value | `stream.map((x) => x * 2)`             |
| `where()`  | Filter values        | `stream.where((x) => x > 5)`           |
| `take()`   | Take first N values  | `stream.take(5)`                       |
| `skip()`   | Skip first N values  | `stream.skip(3)`                       |
| `listen()` | Listen to stream     | `stream.listen((data) => print(data))` |

### Stream Listening

| Pattern       | Use Case                        | Example                                 |
| ------------- | ------------------------------- | --------------------------------------- |
| **await for** | Process each value sequentially | `await for (var data in stream) { }`    |
| **listen()**  | React to values asynchronously  | `stream.listen((data) => handle(data))` |
| **first**     | Get only the first value        | `var first = await stream.first;`       |
| **last**      | Get only the last value         | `var last = await stream.last;`         |

---

## 🎯 When to Use Streams

**✅ Perfect for:**

- **Real-time data**: Chat messages, live updates, sensor data
- **User interactions**: Button clicks, form inputs, gestures
- **File operations**: Reading large files, download progress
- **Network data**: API responses, WebSocket connections
- **Media playback**: Audio/video streaming

**❌ Not needed for:**

- **One-time operations** (use Future instead)
- **Static data** (use regular variables)
- **Simple calculations** (use regular functions)

---

## 🚀 Practice Challenges

Try creating streams for these scenarios:

1. **📈 Stock Prices**: Stream live stock price updates
2. **💬 Chat Messages**: Stream incoming chat messages
3. **🎲 Dice Rolls**: Stream random dice roll results
4. **🌡️ Weather Updates**: Stream hourly weather data
5. **📊 Server Logs**: Stream real-time server log entries

---

## 🎉 Remember This!

Streams are like having a **smart TV channel** 📺:

- **🎬 Episodes arrive over time**: Values come one by one, not all at once
- **⏸️ You can pause and resume**: Control when to listen
- **📱 You stay responsive**: Your app doesn't freeze waiting
- **🔄 Interactive experience**: React to each piece of data immediately
- **📡 Real-time updates**: Perfect for live data that changes often

**The Magic**: Instead of waiting for everything to be ready, you get immediate feedback as soon as each piece arrives - just like binge-watching your favorite series! 🍿✨

> **Think of it like**: "I don't want to wait for the entire season to download - just stream me each episode as it's ready!" 🎪🚀

Streams make your apps **responsive**, **interactive**, and perfect for **real-time experiences**! 🌟
