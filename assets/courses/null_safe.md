# Null Safety in Dart

Imagine you're a **detective** 🕵️‍♀️ investigating a mystery!

You have a **special box** 📦 that might contain a **crucial clue**... or it might be **completely empty**!

Before you reach in and try to examine the clue, you need to **check if there's actually something there**. Otherwise, you might grab at thin air and your whole investigation could fall apart! 💥

👉 **Null Safety** works exactly like this detective work:

> It makes sure you **always check if something exists** before you try to use it, preventing your app from crashing!

---

## 💥 The Problem: The Billion Dollar Mistake

```dart
void main() {
  String playerName; // ❌ Forgot to give it a value!

  print('Welcome, ${playerName.toUpperCase()}!'); // 💥 CRASH!
  // ERROR: Null check operator used on a null value
}
```

**What happened?**

- `playerName` was never given a value, so it's `null`
- We tried to call `.toUpperCase()` on nothing!
- The app crashes because you can't make "nothing" uppercase! 😵

This type of error is so common and costly that it's called **"The Billion Dollar Mistake"** in programming! 💸

---

## ✅ The Solution: Null Safety Protection

Dart's null safety acts like a **smart bodyguard** 🛡️ for your code:

```dart
void main() {
  String playerName = 'Alex'; // ✅ Must have a value!

  print('Welcome, ${playerName.toUpperCase()}!'); // ✅ Safe!
}
```

**Output:**

```
Welcome, ALEX!
```

**The Magic:** Dart **guarantees** that `playerName` will always have a value, so it's safe to use!

---

## 🎮 Gaming Example: Player Profile

```dart
class PlayerProfile {
  String name;           // ✅ Never null - always has a name
  int level;            // ✅ Never null - always has a level
  String? nickname;     // ❓ Might be null - nickname is optional
  DateTime? lastLogin;  // ❓ Might be null - new players haven't logged in yet

  PlayerProfile(this.name, this.level);

  void displayProfile() {
    print('🎮 PLAYER PROFILE 🎮');
    print('👤 Name: $name');
    print('📊 Level: $level');

    // Safe way to handle nullable nickname
    if (nickname != null) {
      print('✨ Nickname: "$nickname"');
    } else {
      print('✨ No nickname set');
    }

    // Safe way to handle nullable last login
    if (lastLogin != null) {
      print('⏰ Last seen: ${lastLogin.toString()}');
    } else {
      print('⏰ First time playing!');
    }
  }

  void setNickname(String newNickname) {
    nickname = newNickname;
    print('✅ Nickname updated to: "$newNickname"');
  }

  void login() {
    lastLogin = DateTime.now();
    print('🔓 $name logged in successfully!');
  }
}

void main() {
  // Create new player
  PlayerProfile player = PlayerProfile('DragonSlayer', 1);
  player.displayProfile();

  print('\n--- After setting nickname ---');
  player.setNickname('FireMaster');
  player.login();
  player.displayProfile();
}
```

**Output:**

```
🎮 PLAYER PROFILE 🎮
👤 Name: DragonSlayer
📊 Level: 1
✨ No nickname set
⏰ First time playing!

--- After setting nickname ---
✅ Nickname updated to: "FireMaster"
🔓 DragonSlayer logged in successfully!
🎮 PLAYER PROFILE 🎮
👤 Name: DragonSlayer
📊 Level: 1
✨ Nickname: "FireMaster"
⏰ Last seen: 2024-01-15 14:30:25.123
```

---

## 📱 Real App Example: Contact Manager

```dart
class Contact {
  String name;
  String phoneNumber;
  String? email;        // Optional - not everyone has email
  String? address;      // Optional - might not have address
  String? birthday;     // Optional - might not know birthday

  Contact(this.name, this.phoneNumber);

  void displayContact() {
    print('📞 CONTACT DETAILS');
    print('─' * 20);
    print('👤 Name: $name');
    print('📱 Phone: $phoneNumber');

    // Method 1: Check if not null
    if (email != null) {
      print('📧 Email: $email');
    }

    // Method 2: Use null-aware operator
    print('🏠 Address: ${address ?? "Not provided"}');
    print('🎂 Birthday: ${birthday ?? "Unknown"}');
  }

  void sendEmail(String message) {
    if (email != null) {
      print('📧 Sending email to $email: "$message"');
    } else {
      print('❌ Cannot send email - no email address on file');
    }
  }

  void updateEmail(String? newEmail) {
    email = newEmail;
    if (newEmail != null) {
      print('✅ Email updated to: $newEmail');
    } else {
      print('🗑️ Email removed from contact');
    }
  }
}

void main() {
  print('📱 CONTACT MANAGER APP\n');

  // Create contacts with different information
  Contact contact1 = Contact('Alice Johnson', '555-0123');
  Contact contact2 = Contact('Bob Smith', '555-0124');

  // Add some optional information
  contact1.email = 'alice@email.com';
  contact1.address = '123 Main St';
  contact1.birthday = 'March 15';

  contact2.address = '456 Oak Ave';
  // Bob doesn't have email or birthday

  print('=== Contact 1 ===');
  contact1.displayContact();
  contact1.sendEmail('Happy Birthday!');

  print('\n=== Contact 2 ===');
  contact2.displayContact();
  contact2.sendEmail('Hello there!'); // This will show error message

  print('\n=== Updating Contact Info ===');
  contact2.updateEmail('bob@newmail.com');
  contact2.sendEmail('Welcome message!'); // Now this works
}
```

**Output:**

```
📱 CONTACT MANAGER APP

=== Contact 1 ===
📞 CONTACT DETAILS
────────────────────
👤 Name: Alice Johnson
📱 Phone: 555-0123
📧 Email: alice@email.com
🏠 Address: 123 Main St
🎂 Birthday: March 15
📧 Sending email to alice@email.com: "Happy Birthday!"

=== Contact 2 ===
📞 CONTACT DETAILS
────────────────────
👤 Name: Bob Smith
📱 Phone: 555-0124
🏠 Address: 456 Oak Ave
🎂 Birthday: Unknown
❌ Cannot send email - no email address on file

=== Updating Contact Info ===
✅ Email updated to: bob@newmail.com
📧 Sending email to bob@newmail.com: "Welcome message!"
```

---

## 🛒 E-commerce Shopping Cart

```dart
class Product {
  String name;
  double price;
  String? description;    // Optional product description
  String? imageUrl;      // Optional product image
  double? discountPercent; // Optional discount

  Product(this.name, this.price);

  double get finalPrice {
    if (discountPercent != null) {
      return price * (1 - discountPercent! / 100);
    }
    return price;
  }

  void displayProduct() {
    print('📦 $name - \$${price.toStringAsFixed(2)}');

    if (description != null) {
      print('   📝 $description');
    }

    if (discountPercent != null) {
      print('   🏷️ ${discountPercent!.toStringAsFixed(0)}% OFF! Final price: \$${finalPrice.toStringAsFixed(2)}');
    }

    if (imageUrl != null) {
      print('   🖼️ Image available');
    } else {
      print('   📷 No image available');
    }
  }
}

class ShoppingCart {
  List<Product> items = [];
  String? couponCode;     // Optional coupon
  String? deliveryAddress; // Optional delivery address

  void addProduct(Product product) {
    items.add(product);
    print('✅ Added ${product.name} to cart');
  }

  double get subtotal {
    double total = 0;
    for (Product product in items) {
      total += product.finalPrice;
    }
    return total;
  }

  double get total {
    double finalTotal = subtotal;

    // Apply coupon if available
    if (couponCode != null) {
      if (couponCode == 'SAVE10') {
        finalTotal *= 0.9; // 10% off
        print('🎟️ Coupon "$couponCode" applied: 10% discount!');
      } else if (couponCode == 'WELCOME20') {
        finalTotal *= 0.8; // 20% off
        print('🎟️ Coupon "$couponCode" applied: 20% discount!');
      }
    }

    return finalTotal;
  }

  void applyCoupon(String code) {
    couponCode = code;
    print('🎫 Coupon code "$code" added');
  }

  void setDeliveryAddress(String address) {
    deliveryAddress = address;
    print('🚚 Delivery address set to: $address');
  }

  void displayCart() {
    print('\n🛒 SHOPPING CART');
    print('═' * 30);

    if (items.isEmpty) {
      print('📭 Cart is empty');
      return;
    }

    for (int i = 0; i < items.length; i++) {
      print('${i + 1}. ${items[i].name} - \$${items[i].finalPrice.toStringAsFixed(2)}');
    }

    print('─' * 30);
    print('💰 Subtotal: \$${subtotal.toStringAsFixed(2)}');
    print('🏆 Total: \$${total.toStringAsFixed(2)}');

    if (deliveryAddress != null) {
      print('📍 Delivering to: $deliveryAddress');
    } else {
      print('❌ No delivery address set');
    }
  }

  bool canCheckout() {
    return items.isNotEmpty && deliveryAddress != null;
  }

  void checkout() {
    if (canCheckout()) {
      print('✅ Order confirmed! Total: \$${total.toStringAsFixed(2)}');
      print('🚚 Shipping to: $deliveryAddress');
    } else {
      print('❌ Cannot checkout:');
      if (items.isEmpty) print('   - Cart is empty');
      if (deliveryAddress == null) print('   - No delivery address');
    }
  }
}

void main() {
  print('🛍️ DART ELECTRONICS STORE\n');

  // Create products
  Product laptop = Product('Gaming Laptop', 1299.99);
  laptop.description = 'High-performance laptop for gaming and work';
  laptop.discountPercent = 15;
  laptop.imageUrl = 'laptop.jpg';

  Product mouse = Product('Wireless Mouse', 49.99);
  mouse.description = 'Ergonomic wireless mouse';
  // No discount or image for mouse

  Product keyboard = Product('Mechanical Keyboard', 129.99);
  keyboard.discountPercent = 10;
  // No description or image for keyboard

  // Display products
  print('🏪 AVAILABLE PRODUCTS:');
  laptop.displayProduct();
  print('');
  mouse.displayProduct();
  print('');
  keyboard.displayProduct();

  // Shopping experience
  ShoppingCart cart = ShoppingCart();

  print('\n🛒 SHOPPING SESSION:');
  cart.addProduct(laptop);
  cart.addProduct(mouse);

  cart.displayCart();

  print('\n📋 Adding coupon and address...');
  cart.applyCoupon('SAVE10');
  cart.setDeliveryAddress('123 Tech Street, Silicon Valley');

  cart.displayCart();

  print('\n💳 CHECKOUT ATTEMPT:');
  cart.checkout();
}
```

---

## 🚦 Different Ways to Handle Null Values

### 1. **Null Check with if statement**

```dart
void main() {
  String? userInput;

  print('🔍 Method 1: if statement check');
  if (userInput != null) {
    print('Input length: ${userInput.length}');
  } else {
    print('No input provided');
  }
}
```

### 2. **Null-aware operator (??)**

```dart
void main() {
  String? userName;

  print('🔍 Method 2: null-aware operator');
  String displayName = userName ?? 'Guest User';
  print('Welcome, $displayName!');

  // Can also use with expressions
  print('Character count: ${(userName ?? '').length}');
}
```

### 3. **Null-aware assignment (??=)**

```dart
void main() {
  String? config;

  print('🔍 Method 3: null-aware assignment');
  config ??= 'Default Settings'; // Only assigns if config is null
  print('Config: $config');

  config ??= 'New Settings'; // Won't change because config is not null
  print('Config after second assignment: $config');
}
```

### 4. **Null assertion operator (!)**

```dart
void main() {
  String? guaranteedValue = 'I promise this has a value';

  print('🔍 Method 4: null assertion (use carefully!)');
  print('Length: ${guaranteedValue!.length}'); // ⚠️ Only use when 100% sure!

  // ❌ NEVER do this if the value might be null:
  // String? riskyValue;
  // print(riskyValue!.length); // This would crash!
}
```

### 5. **Null-aware method calls (?.)**

```dart
void main() {
  String? possiblyNullString;

  print('🔍 Method 5: null-aware method calls');
  print('Uppercase: ${possiblyNullString?.toUpperCase()}'); // Returns null if string is null

  possiblyNullString = 'hello world';
  print('Uppercase: ${possiblyNullString?.toUpperCase()}'); // Now it works!
}
```

**Output:**

```
🔍 Method 5: null-aware method calls
Uppercase: null
Uppercase: HELLO WORLD
```

---

## 🏥 Medical Records System

```dart
class Patient {
  String name;
  int age;
  String? bloodType;        // Might not be tested yet
  String? allergies;        // Might not have any
  DateTime? lastVisit;      // New patients haven't visited
  String? emergencyContact; // Might not have provided

  Patient(this.name, this.age);

  void displayMedicalInfo() {
    print('🏥 PATIENT RECORD');
    print('─' * 25);
    print('👤 Name: $name');
    print('🎂 Age: $age');

    // Blood type with safety check
    print('🩸 Blood Type: ${bloodType ?? "Not tested"}');

    // Allergies with safety check
    if (allergies != null && allergies!.isNotEmpty) {
      print('⚠️ Allergies: $allergies');
    } else {
      print('✅ No known allergies');
    }

    // Last visit information
    if (lastVisit != null) {
      Duration timeSinceVisit = DateTime.now().difference(lastVisit!);
      print('📅 Last visit: ${timeSinceVisit.inDays} days ago');
    } else {
      print('📅 First-time patient');
    }

    // Emergency contact
    print('📞 Emergency contact: ${emergencyContact ?? "Not provided"}');
  }

  void updateBloodType(String type) {
    bloodType = type;
    print('🩸 Blood type updated to: $type');
  }

  void addAllergy(String allergy) {
    if (allergies == null) {
      allergies = allergy;
    } else {
      allergies = '$allergies, $allergy';
    }
    print('⚠️ Allergy added: $allergy');
  }

  void recordVisit() {
    lastVisit = DateTime.now();
    print('📝 Visit recorded for ${DateTime.now()}');
  }

  void setEmergencyContact(String contact) {
    emergencyContact = contact;
    print('📞 Emergency contact set: $contact');
  }

  bool isReadyForSurgery() {
    return bloodType != null &&
           allergies != null &&
           emergencyContact != null;
  }

  void checkSurgeryReadiness() {
    print('\n🏥 SURGERY READINESS CHECK:');

    if (isReadyForSurgery()) {
      print('✅ Patient is ready for surgery');
    } else {
      print('❌ Patient not ready for surgery. Missing:');
      if (bloodType == null) print('   - Blood type test');
      if (allergies == null) print('   - Allergy information');
      if (emergencyContact == null) print('   - Emergency contact');
    }
  }
}

void main() {
  print('🏥 HOSPITAL MANAGEMENT SYSTEM\n');

  // New patient admission
  Patient patient = Patient('Sarah Johnson', 34);

  print('=== Initial Admission ===');
  patient.displayMedicalInfo();
  patient.checkSurgeryReadiness();

  print('\n=== Updating Records ===');
  patient.updateBloodType('O+');
  patient.addAllergy('Penicillin');
  patient.setEmergencyContact('John Johnson (555) 123-4567');
  patient.recordVisit();

  print('\n=== Updated Records ===');
  patient.displayMedicalInfo();
  patient.checkSurgeryReadiness();

  print('\n=== Adding More Information ===');
  patient.addAllergy('Latex');
  patient.displayMedicalInfo();
}
```

---

## 📊 Quick Reference Guide

### Null Safety Symbols

| Symbol | Name                      | Purpose                     | Example               |
| ------ | ------------------------- | --------------------------- | --------------------- |
| `?`    | **Nullable**              | Makes a type nullable       | `String? name;`       |
| `!`    | **Null assertion**        | Forces unwrap (dangerous!)  | `name!.length`        |
| `??`   | **Null coalescing**       | Provides default value      | `name ?? 'Guest'`     |
| `??=`  | **Null-aware assignment** | Assigns only if null        | `name ??= 'Default'`  |
| `?.`   | **Null-aware access**     | Safe method/property access | `name?.toUpperCase()` |

### Safety Levels

| Level             | Safety               | When to Use                 | Example                     |
| ----------------- | -------------------- | --------------------------- | --------------------------- |
| 🟢 **Super Safe** | Non-nullable types   | Always preferred            | `String name = 'John';`     |
| 🟡 **Careful**    | Nullable with checks | When value might be missing | `if (name != null) { ... }` |
| 🟠 **Cautious**   | Null-aware operators | Quick default values        | `name ?? 'Unknown'`         |
| 🔴 **Dangerous**  | Null assertion       | Only when 100% certain      | `name!.length`              |

---

## 🎯 When to Use Nullable Types

**✅ Use nullable types when:**

- User input might be empty (form fields)
- Data from external sources might be missing
- Optional configuration settings
- Features that aren't always available

**❌ Avoid nullable types when:**

- The value should always exist
- You're just being lazy about initialization
- Core app functionality depends on the value

---

## 🚀 Best Practices

### 1. **Minimize Nullable Types**

```dart
// ✅ Good - required parameters are non-nullable
class User {
  String name;     // Must have
  String email;    // Must have
  String? bio;     // Optional

  User(this.name, this.email);
}
```

### 2. **Provide Meaningful Defaults**

```dart
// ✅ Good - meaningful defaults
String getDisplayName(String? firstName, String? lastName) {
  return '${firstName ?? 'Anonymous'} ${lastName ?? 'User'}';
}
```

### 3. **Use Early Returns**

```dart
// ✅ Good - early return pattern
void processUser(String? userId) {
  if (userId == null) {
    print('Error: No user ID provided');
    return;
  }

  // Continue with non-null userId
  print('Processing user: $userId');
}
```

### 4. **Validate Input Early**

```dart
// ✅ Good - validate and convert to non-nullable
String? validateName(String? input) {
  if (input == null || input.trim().isEmpty) {
    return null;
  }
  return input.trim();
}
```

---

## 🧠 Mental Model: The Safety Net

Think of null safety as a **safety net** 🥅 in programming:

- **🚫 Non-nullable types**: "This trapeze artist WILL catch the bar"
- **❓ Nullable types**: "This trapeze artist MIGHT miss - have a safety net ready"
- **🛡️ Null checks**: "Check if the safety net is needed before jumping"
- **⚠️ Null assertion**: "Jump without checking - dangerous but sometimes necessary"

---

## 🎉 Remember This!

Null safety is like being a **responsible driver** 🚗:

- **🚦 Check before you go**: Always verify values exist before using them
- **🛡️ Wear your seatbelt**: Use null checks and safe operators
- **⚠️ Don't speed**: Avoid risky null assertions unless absolutely sure
- **📍 Have a destination**: Provide meaningful defaults for missing values

**The Magic**: Null safety prevents crashes by making you **think about empty values** before they cause problems, just like checking your gas tank before a long trip! ⛽✨

**Pro Tip**: If you find yourself using `!` frequently, you're probably not designing your types correctly. Make required things non-nullable and optional things nullable with proper defaults! 🎯
