# Custom Exceptions in Dart

Imagine you're the **principal of a magical school** 🏫✨!

Your school has some **basic rules** that everyone knows:
- 📚 "No running in the hallways"
- 🍎 "No food fights in the cafeteria"
- 📱 "No phones during class"

But your school is **special**! You also have **unique magical rules**:
- 🪄 "No turning classmates into frogs!"
- 🔮 "Crystal balls must be returned to the library!"
- 🧙‍♀️ "Flying is only allowed in Broomstick Class!"

When students break regular rules, you give them **regular detention**. But when they break your **special magical rules**, you need **special magical consequences**!

👉 **Custom exceptions** are like creating your own **special rule violations** with **custom consequences**!

---

## 🚨 The Problem: Generic Error Messages

```dart
void checkMagicalRules(bool turningStudentsIntoFrogs) {
  if (turningStudentsIntoFrogs) {
    throw Exception('Student violated a rule!');
  }
  print('✅ All students are following the rules!');
}

void main() {
  try {
    checkMagicalRules(true);
  } catch (e) {
    print('❌ $e');
  }
}
```

**Output:**
```
❌ Exception: Student violated a rule!
```

**Problem**: This is too vague! What rule? Which student? What should happen next?

---

## ✨ The Solution: Custom Magical Exceptions

Let's create **specific exceptions** for our magical school:

### 🐸 Frog Transformation Exception

```dart
class FrogTransformationException implements Exception {
  final String studentName;
  final String transformedBy;
  final int duration; // minutes
  
  FrogTransformationException(this.studentName, this.transformedBy, this.duration);
  
  @override
  String toString() {
    return '🐸 MAGICAL VIOLATION: $transformedBy turned $studentName into a frog for $duration minutes!';
  }
  
  String getReversalSpell() {
    return '✨ Reversal spell: "Ribbitus Reversus Immediatus!"';
  }
  
  int getDetentionHours() {
    return duration ~/ 10; // 1 hour detention per 10 minutes of frog time
  }
}
```

### 📚 Library Crystal Ball Exception

```dart
class CrystalBallException implements Exception {
  final String studentName;
  final String crystalBallType;
  final bool isReturned;
  
  CrystalBallException(this.studentName, this.crystalBallType, {this.isReturned = false});
  
  @override
  String toString() {
    if (isReturned) {
      return '✅ $studentName returned the $crystalBallType crystal ball safely!';
    } else {
      return '🔮 LIBRARY VIOLATION: $studentName has not returned the $crystalBallType crystal ball!';
    }
  }
  
  double getLateFee() {
    return isReturned ? 0.0 : 5.50; // $5.50 late fee
  }
  
  String getLibrarianMessage() {
    return isReturned 
      ? '📚 Librarian: "Thank you for returning it safely!"'
      : '📚 Librarian: "Please return it immediately to avoid extra fees!"';
  }
}
```

### 🧹 Unauthorized Flying Exception

```dart
class UnauthorizedFlyingException implements Exception {
  final String studentName;
  final String location;
  final int altitude; // feet
  final bool hasPermit;
  
  UnauthorizedFlyingException(this.studentName, this.location, this.altitude, {this.hasPermit = false});
  
  @override
  String toString() {
    return '🧹 FLYING VIOLATION: $studentName caught flying at ${altitude}ft in $location without proper permit!';
  }
  
  String getSafetyWarning() {
    if (altitude > 100) {
      return '⚠️ DANGER: Flying above 100ft without certification is extremely dangerous!';
    } else if (altitude > 50) {
      return '⚠️ WARNING: Medium altitude flying requires supervision!';
    } else {
      return 'ℹ️ Low altitude flight - still requires permit for safety!';
    }
  }
  
  int getSuspensionDays() {
    if (altitude > 100) return 5;
    if (altitude > 50) return 3;
    return 1;
  }
}
```

---

## 🏫 Complete School System

```dart
class MagicalSchoolSystem {
  List<String> currentStudents = ['Alice', 'Bob', 'Charlie', 'Diana'];
  Map<String, int> studentPoints = {
    'Alice': 50,
    'Bob': 45,
    'Charlie': 55,
    'Diana': 40
  };
  
  void checkFrogTransformation(String caster, String victim, int minutes) {
    print('🔍 Checking for unauthorized frog transformations...');
    
    if (caster != victim && minutes > 0) {
      var exception = FrogTransformationException(victim, caster, minutes);
      
      print('🚨 MAGICAL RULE VIOLATION DETECTED!');
      print(exception.toString());
      print(exception.getReversalSpell());
      
      int detentionHours = exception.getDetentionHours();
      print('⏰ Detention assigned: $detentionHours hours');
      
      // Deduct house points
      if (studentPoints.containsKey(caster)) {
        studentPoints[caster] = (studentPoints[caster]! - 10).clamp(0, 100);
        print('📉 ${caster} loses 10 house points! New total: ${studentPoints[caster]}');
      }
      
      throw exception;
    }
    
    print('✅ No unauthorized transformations detected');
  }
  
  void checkCrystalBallReturn(String student, String ballType, bool returned) {
    print('🔮 Checking crystal ball returns...');
    
    var exception = CrystalBallException(student, ballType, isReturned: returned);
    
    if (!returned) {
      print('🚨 LIBRARY VIOLATION!');
      print(exception.toString());
      print('💰 Late fee: \$${exception.getLateFee()}');
      print(exception.getLibrarianMessage());
      throw exception;
    } else {
      print(exception.toString());
      print(exception.getLibrarianMessage());
    }
  }
  
  void checkUnauthorizedFlying(String student, String location, int altitude, bool hasPermit) {
    print('🧹 Monitoring airspace for unauthorized flying...');
    
    if (!hasPermit) {
      var exception = UnauthorizedFlyingException(student, location, altitude, hasPermit: hasPermit);
      
      print('🚨 FLYING VIOLATION!');
      print(exception.toString());
      print(exception.getSafetyWarning());
      
      int suspensionDays = exception.getSuspensionDays();
      print('⏰ Suspension: $suspensionDays days');
      
      // Deduct more points for dangerous flying
      if (studentPoints.containsKey(student)) {
        int pointsLost = altitude > 50 ? 20 : 10;
        studentPoints[student] = (studentPoints[student]! - pointsLost).clamp(0, 100);
        print('📉 $student loses $pointsLost house points! New total: ${studentPoints[student]}');
      }
      
      throw exception;
    }
    
    print('✅ All flying activities are properly authorized');
  }
  
  void printHousePoints() {
    print('\n🏆 CURRENT HOUSE POINTS:');
    studentPoints.forEach((student, points) {
      String emoji = points >= 50 ? '🌟' : points >= 40 ? '⭐' : '📚';
      print('  $emoji $student: $points points');
    });
    print('');
  }
}

void main() {
  var school = MagicalSchoolSystem();
  
  print('🏫 WELCOME TO HOGWARTS PROGRAMMING SCHOOL!');
  print('═' * 50);
  
  school.printHousePoints();
  
  // Scenario 1: Someone turns a classmate into a frog
  print('📖 SCENARIO 1: Unauthorized Transformation');
  print('─' * 30);
  try {
    school.checkFrogTransformation('Bob', 'Alice', 30);
  } catch (e) {
    if (e is FrogTransformationException) {
      print('🎭 Resolution: Alice was quickly changed back!');
      print('📝 Incident logged in student record');
    }
  }
  
  print('\n📖 SCENARIO 2: Crystal Ball Check');
  print('─' * 30);
  try {
    school.checkCrystalBallReturn('Charlie', 'Future-Seeing', false);
  } catch (e) {
    if (e is CrystalBallException) {
      print('📞 Parents have been notified about the late fee');
    }
  }
  
  print('\n📖 SCENARIO 3: Dangerous Flying');
  print('─' * 30);
  try {
    school.checkUnauthorizedFlying('Diana', 'Great Hall', 120, false);
  } catch (e) {
    if (e is UnauthorizedFlyingException) {
      print('🚑 School nurse alerted for safety check');
      print('✉️ Flying instructor will provide remedial lessons');
    }
  }
  
  print('\n📖 SCENARIO 4: Good Student Behavior');
  print('─' * 30);
  try {
    school.checkCrystalBallReturn('Alice', 'Wisdom', true);
    school.checkUnauthorizedFlying('Bob', 'Quidditch Pitch', 30, true);
    print('✅ No violations - excellent behavior!');
  } catch (e) {
    print('❌ Unexpected issue: $e');
  }
  
  school.printHousePoints();
  print('📊 End of day report complete!');
}
```

**Output:**
```
🏫 WELCOME TO HOGWARTS PROGRAMMING SCHOOL!
══════════════════════════════════════════════════

🏆 CURRENT HOUSE POINTS:
  🌟 Alice: 50 points
  ⭐ Bob: 45 points
  🌟 Charlie: 55 points
  📚 Diana: 40 points

📖 SCENARIO 1: Unauthorized Transformation
──────────────────────────────
🔍 Checking for unauthorized frog transformations...
🚨 MAGICAL RULE VIOLATION DETECTED!
🐸 MAGICAL VIOLATION: Bob turned Alice into a frog for 30 minutes!
✨ Reversal spell: "Ribbitus Reversus Immediatus!"
⏰ Detention assigned: 3 hours
📉 Bob loses 10 house points! New total: 35
🎭 Resolution: Alice was quickly changed back!
📝 Incident logged in student record

📖 SCENARIO 2: Crystal Ball Check
──────────────────────────────
🔮 Checking crystal ball returns...
🚨 LIBRARY VIOLATION!
🔮 LIBRARY VIOLATION: Charlie has not returned the Future-Seeing crystal ball!
💰 Late fee: $5.5
📚 Librarian: "Please return it immediately to avoid extra fees!"
📞 Parents have been notified about the late fee

📖 SCENARIO 3: Dangerous Flying
──────────────────────────────
🧹 Monitoring airspace for unauthorized flying...
🚨 FLYING VIOLATION!
🧹 FLYING VIOLATION: Diana caught flying at 120ft in Great Hall without proper permit!
⚠️ DANGER: Flying above 100ft without certification is extremely dangerous!
⏰ Suspension: 5 days
📉 Diana loses 20 house points! New total: 20
🚑 School nurse alerted for safety check
✉️ Flying instructor will provide remedial lessons

📖 SCENARIO 4: Good Student Behavior
──────────────────────────────
🔮 Checking crystal ball returns...
✅ Alice returned the Wisdom crystal ball safely!
📚 Librarian: "Thank you for returning it safely!"
🧹 Monitoring airspace for unauthorized flying...
✅ All flying activities are properly authorized
✅ No violations - excellent behavior!

🏆 CURRENT HOUSE POINTS:
  🌟 Alice: 50 points
  📚 Bob: 35 points
  🌟 Charlie: 55 points
  📚 Diana: 20 points

📊 End of day report complete!
```

---

## 🎮 Gaming Application: Custom Game Exceptions

```dart
class InsufficientCoinsException implements Exception {
  final int required;
  final int available;
  final String item;
  
  InsufficientCoinsException(this.required, this.available, this.item);
  
  @override
  String toString() {
    int shortage = required - available;
    return '💰 Not enough coins! Need $required for $item, but only have $available. Short by $shortage coins.';
  }
  
  List<String> getEarningTips() {
    return [
      '🎯 Complete daily quests for bonus coins',
      '🏆 Win battles against other players',
      '💎 Trade items you don\'t need',
      '🎰 Try your luck at the coin slots'
    ];
  }
}

class LevelTooLowException implements Exception {
  final int currentLevel;
  final int requiredLevel;
  final String feature;
  
  LevelTooLowException(this.currentLevel, this.requiredLevel, this.feature);
  
  @override
  String toString() {
    int levelsNeeded = requiredLevel - currentLevel;
    return '📊 Level too low! $feature requires level $requiredLevel, but you\'re only level $currentLevel. Need $levelsNeeded more levels.';
  }
  
  int getXPNeeded() {
    int levelsNeeded = requiredLevel - currentLevel;
    return levelsNeeded * 1000; // Assume 1000 XP per level
  }
}

class InventoryFullException implements Exception {
  final String item;
  final int maxSlots;
  
  InventoryFullException(this.item, this.maxSlots);
  
  @override
  String toString() {
    return '🎒 Inventory full! Cannot add $item. Maximum $maxSlots slots occupied.';
  }
  
  List<String> getManagementTips() {
    return [
      '🗑️ Sell items you don\'t need',
      '📦 Store items in your vault',
      '🎁 Give items to friends',
      '⬆️ Upgrade your bag for more slots'
    ];
  }
}

class GameSystem {
  void purchaseItem(String item, int cost, int playerCoins, int playerLevel, int requiredLevel, int inventorySlots) {
    print('🛒 Attempting to purchase: $item');
    print('💰 Cost: $cost coins');
    print('📊 Required level: $requiredLevel');
    print('');
    
    // Check level requirement
    if (playerLevel < requiredLevel) {
      var levelException = LevelTooLowException(playerLevel, requiredLevel, item);
      print('❌ ${levelException.toString()}');
      print('⚡ XP needed: ${levelException.getXPNeeded()}');
      throw levelException;
    }
    
    // Check coin requirement
    if (playerCoins < cost) {
      var coinException = InsufficientCoinsException(cost, playerCoins, item);
      print('❌ ${coinException.toString()}');
      print('💡 Ways to earn more coins:');
      coinException.getEarningTips().forEach((tip) => print('  $tip'));
      throw coinException;
    }
    
    // Check inventory space
    if (inventorySlots >= 20) {
      var inventoryException = InventoryFullException(item, 20);
      print('❌ ${inventoryException.toString()}');
      print('🧹 Inventory management tips:');
      inventoryException.getManagementTips().forEach((tip) => print('  $tip'));
      throw inventoryException;
    }
    
    print('✅ Purchase successful! Enjoy your $item! 🎉');
  }
}

void main() {
  var gameSystem = GameSystem();
  
  print('🎮 EPIC ADVENTURE GAME - ITEM SHOP');
  print('═' * 40);
  
  // Player stats
  int playerLevel = 8;
  int playerCoins = 150;
  int inventorySlots = 18;
  
  print('📊 Player Stats:');
  print('  📈 Level: $playerLevel');
  print('  💰 Coins: $playerCoins');
  print('  🎒 Inventory: $inventorySlots/20 slots');
  print('');
  
  // Test different scenarios
  
  print('🔥 ATTEMPT 1: Legendary Sword');
  print('─' * 25);
  try {
    gameSystem.purchaseItem('Legendary Sword', 200, playerCoins, playerLevel, 5, inventorySlots);
  } catch (e) {
    print('🔄 Purchase failed - trying something else...\n');
  }
  
  print('🧪 ATTEMPT 2: Health Potion');
  print('─' * 25);
  try {
    gameSystem.purchaseItem('Health Potion', 50, playerCoins, playerLevel, 3, inventorySlots);
  } catch (e) {
    print('🔄 Purchase failed\n');
  }
  
  print('⚔️ ATTEMPT 3: Dragon Weapon');
  print('─' * 25);
  try {
    gameSystem.purchaseItem('Dragon Weapon', 100, playerCoins, playerLevel, 15, inventorySlots);
  } catch (e) {
    print('🔄 Purchase failed\n');
  }
  
  print('🎒 ATTEMPT 4: Magic Ring (Full Inventory)');
  print('─' * 35);
  try {
    gameSystem.purchaseItem('Magic Ring', 75, playerCoins, playerLevel, 5, 20); // Full inventory
  } catch (e) {
    print('🔄 Purchase failed\n');
  }
}
```

---

## 🏥 Medical App: Health Monitoring

```dart
class CriticalVitalsException implements Exception {
  final String vitalType;
  final double currentValue;
  final double normalMin;
  final double normalMax;
  final String units;
  
  CriticalVitalsException(this.vitalType, this.currentValue, this.normalMin, this.normalMax, this.units);
  
  @override
  String toString() {
    String status = currentValue < normalMin ? 'TOO LOW' : 'TOO HIGH';
    return '🚨 CRITICAL: $vitalType is $status! Current: $currentValue$units (Normal: $normalMin-$normalMax$units)';
  }
  
  String getUrgencyLevel() {
    double variance = currentValue < normalMin ? 
      (normalMin - currentValue) / normalMin : 
      (currentValue - normalMax) / normalMax;
      
    if (variance > 0.5) return '🔴 EMERGENCY';
    if (variance > 0.3) return '🟡 URGENT';
    return '🟠 MONITOR CLOSELY';
  }
  
  List<String> getRecommendations() {
    if (vitalType == 'Heart Rate') {
      return currentValue < normalMin ? 
        ['💊 Check for underlying conditions', '🏃 Light exercise may help'] :
        ['😌 Rest immediately', '💧 Drink water', '🧘 Practice breathing exercises'];
    } else if (vitalType == 'Blood Pressure') {
      return currentValue < normalMin ?
        ['🧂 Increase salt intake slightly', '💧 Stay hydrated'] :
        ['🧂 Reduce sodium', '🥗 Eat more fruits and vegetables', '🚶 Light walking'];
    }
    return ['👨‍⚕️ Consult healthcare provider immediately'];
  }
}

void monitorVitals(String patientName, double heartRate, double systolic, double diastolic) {
  print('🏥 MONITORING VITALS FOR $patientName');
  print('─' * 40);
  print('💓 Heart Rate: ${heartRate}bpm');
  print('🩸 Blood Pressure: $systolic/$diastolic mmHg');
  print('');
  
  try {
    // Check heart rate (normal: 60-100 bpm)
    if (heartRate < 60 || heartRate > 100) {
      var hrException = CriticalVitalsException('Heart Rate', heartRate, 60, 100, 'bpm');
      print(hrException.toString());
      print('⚠️ Urgency: ${hrException.getUrgencyLevel()}');
      print('📋 Recommendations:');
      hrException.getRecommendations().forEach((rec) => print('  $rec'));
      throw hrException;
    }
    
    // Check systolic blood pressure (normal: 90-140 mmHg)
    if (systolic < 90 || systolic > 140) {
      var bpException = CriticalVitalsException('Blood Pressure', systolic, 90, 140, 'mmHg');
      print(bpException.toString());
      print('⚠️ Urgency: ${bpException.getUrgencyLevel()}');
      print('📋 Recommendations:');
      bpException.getRecommendations().forEach((rec) => print('  $rec'));
      throw bpException;
    }
    
    print('✅ All vitals are within normal range!');
    print('💚 Patient status: STABLE');
    
  } catch (e) {
    print('\n📞 Alert sent to medical team');
    print('📱 Family members notified');
  }
  
  print('\n' + '═' * 40 + '\n');
}

void main() {
  print('🏥 HOSPITAL MONITORING SYSTEM');
  print('═' * 40);
  
  // Monitor different patients
  monitorVitals('John Smith', 45, 120, 80);    // Low heart rate
  monitorVitals('Mary Johnson', 110, 160, 95); // High heart rate & BP
  monitorVitals('Bob Wilson', 72, 115, 78);    // Normal vitals
}
```

---

## 🧠 Key Concepts Summary

### Why Create Custom Exceptions?

| Benefit | Description | Example |
|---------|-------------|---------|
| **🎯 Specific** | Exact problem identification | `InsufficientCoinsException` vs generic `Exception` |
| **📊 Informative** | Rich context and data | Include current/required values, suggestions |
| **🛠️ Actionable** | Provide solutions | Give tips for earning coins, managing inventory |
| **🎭 Professional** | Clean, organized error handling | Different exception types for different problems |

### Custom Exception Structure

```dart
class YourCustomException implements Exception {
  // 📋 Properties (data about the problem)
  final String problemDetails;
  final int currentValue;
  final int expectedValue;
  
  // 🏗️ Constructor (how to create the exception)
  YourCustomException(this.problemDetails, this.currentValue, this.expectedValue);
  
  // 📝 toString (the main error message)
  @override
  String toString() {
    return 'CustomError: $problemDetails (Expected: $expectedValue, Got: $currentValue)';
  }
  
  // 🛠️ Helper methods (additional functionality)
  String getSolution() {
    return 'Try doing X to fix this problem';
  }
}
```

---

## 🎯 When to Create Custom Exceptions

**✅ Great for:**
- **Business rules**: Banking limits, game restrictions, medical thresholds
- **User-friendly errors**: Clear messages with helpful suggestions  
- **Domain-specific problems**: Shopping cart issues, account problems
- **Rich error context**: Include relevant data and next steps

**❌ Don't need them for:**
- **Simple validation**: Use built-in exceptions
- **One-time errors**: Generic Exception is fine
- **System errors**: File not found, network issues

---

## 🚀 Practice Challenges

Create custom exceptions for these scenarios:

1. **🏪 E-commerce**: `OutOfStockException`, `InvalidCouponException`, `ShippingException`
2. **🎓 School System**: `GradeException`, `AttendanceException`, `CourseException`
3. **🏦 Banking**: `InsufficientFundsException`, `AccountFrozenException`, `DailyLimitException`
4. **🎵 Music App**: `PlaylistFullException`, `SongUnavailableException`, `SubscriptionException`

---

## 🎉 Remember This!

Custom exceptions are like having **specialized emergency responders** 🚨:

- **🔥 Fire Department**: `FireException` with water trucks and ladders
- **👮 Police**: `CrimeException` with investigation procedures  
- **🚑 Ambulance**: `MedicalException` with first aid protocols
- **⚡ Electrician**: `PowerException` with safety equipment

Each one knows **exactly what went wrong** and **exactly how to help**! 

Instead of just saying "Something bad happened," they say "Here's the specific problem, here's why it happened, and here's how to fix it!" 🛠️✨

**Pro Tip**: Great custom exceptions don't just report problems - they **guide users toward solutions**! 🌟