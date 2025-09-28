# Collection Methods in Dart

Imagine you're the manager of a **magical toy store** 🧸✨!

Every day, you need to:
- Transform boring toys into **colorful masterpieces** 🎨
- Sort toys by **age groups** 👶🧒👦
- Count your **total inventory** 📊
- Find **specific toys** customers want 🔍
- Check if you have **everything in stock** ✅

Instead of doing this by hand (which would take FOREVER!), you have **magical tools** that can process hundreds of toys instantly!

👉 **Collection methods** are like these magical tools for your lists, sets, and maps in Dart!

---

## 🛠️ The Magical Toolbox

Think of collection methods as **specialized machines** in your toy factory:

| Machine Name | What It Does | Real Example |
|-------------|-------------|--------------|
| **🎨 Paint Machine** | `map()` | Paint every toy blue |
| **🔍 Filter Belt** | `where()` | Keep only stuffed animals |
| **🧮 Calculator** | `reduce()` | Add up all toy prices |
| **🚀 Finder Robot** | `firstWhere()` | Find the first red car |
| **✅ Inspector** | `every()` | Check if all toys are safe |
| **🔎 Detector** | `any()` | Is there any toy under $5? |

---

## 🎨 The Paint Machine: `map()`

**Transform every item in your collection!**

### Basic Example: Number Doubler
```dart
void main() {
  var prices = [5, 10, 15, 20];
  
  // Double every price (50% off sale!)
  var salePrices = prices.map((price) => price * 2);
  
  print('Original: $prices');
  print('Doubled: ${salePrices.toList()}');
}
```

**Output:**
```
Original: [5, 10, 15, 20]
Doubled: [10, 20, 30, 40]
```

### Real-World Example: Greeting Generator
```dart
void main() {
  var names = ['Alice', 'Bob', 'Charlie', 'Diana'];
  
  // Create personalized greetings
  var greetings = names.map((name) => '🎉 Welcome to our store, $name!');
  
  print('Customer Greetings:');
  greetings.forEach(print);
}
```

**Output:**
```
Customer Greetings:
🎉 Welcome to our store, Alice!
🎉 Welcome to our store, Bob!
🎉 Welcome to our store, Charlie!
🎉 Welcome to our store, Diana!
```

### Complex Example: Product Catalog
```dart
void main() {
  var toys = [
    {'name': 'Teddy Bear', 'price': 15},
    {'name': 'Race Car', 'price': 25},
    {'name': 'Puzzle', 'price': 12},
  ];
  
  // Create product descriptions with tax
  var descriptions = toys.map((toy) {
    double priceWithTax = (toy['price'] as int) * 1.08;
    return '${toy['name']}: \$${priceWithTax.toStringAsFixed(2)} (tax included)';
  });
  
  print('📋 Product Catalog:');
  descriptions.forEach(print);
}
```

**Output:**
```
📋 Product Catalog:
Teddy Bear: $16.20 (tax included)
Race Car: $27.00 (tax included)
Puzzle: $12.96 (tax included)
```

---

## 🔍 The Filter Belt: `where()`

**Keep only the items that match your criteria!**

### Basic Example: Age-Appropriate Toys
```dart
void main() {
  var ageRatings = [3, 8, 12, 5, 16, 2, 10];
  
  // Keep only toys safe for kids 10 and under
  var kidsToysAges = ageRatings.where((age) => age <= 10);
  
  print('All ages: $ageRatings');
  print('Kids safe: ${kidsToysAges.toList()}');
}
```

**Output:**
```
All ages: [3, 8, 12, 5, 16, 2, 10]
Kids safe: [3, 8, 5, 2, 10]
```

### Real-World Example: Inventory Filter
```dart
void main() {
  var inventory = [
    {'name': 'Teddy Bear', 'price': 15, 'inStock': true, 'category': 'stuffed'},
    {'name': 'Race Car', 'price': 25, 'inStock': false, 'category': 'vehicle'},
    {'name': 'Doll', 'price': 20, 'inStock': true, 'category': 'stuffed'},
    {'name': 'Puzzle', 'price': 12, 'inStock': true, 'category': 'educational'},
    {'name': 'Truck', 'price': 30, 'inStock': true, 'category': 'vehicle'},
  ];
  
  // Filter available stuffed toys under $18
  var availableStuffedToys = inventory.where((toy) =>
    toy['inStock'] == true &&
    toy['category'] == 'stuffed' &&
    (toy['price'] as int) < 18
  );
  
  print('🧸 Available Stuffed Toys Under \$18:');
  availableStuffedToys.forEach((toy) {
    print('  • ${toy['name']}: \$${toy['price']}');
  });
}
```

**Output:**
```
🧸 Available Stuffed Toys Under $18:
  • Teddy Bear: $15
```

---

## 🧮 The Calculator: `reduce()`

**Combine all items into a single value!**

### Basic Example: Total Sales
```dart
void main() {
  var dailySales = [150, 200, 175, 300, 225];
  
  // Calculate total week sales
  var totalSales = dailySales.reduce((total, daily) => total + daily);
  
  print('📊 Daily sales: $dailySales');
  print('💰 Total week sales: \$${totalSales}');
}
```

**Output:**
```
📊 Daily sales: [150, 200, 175, 300, 225]
💰 Total week sales: $1050
```

### Advanced Example: Finding Best Seller
```dart
void main() {
  var products = [
    {'name': 'Teddy Bear', 'sold': 45},
    {'name': 'Race Car', 'sold': 67},
    {'name': 'Puzzle', 'sold': 23},
    {'name': 'Doll', 'sold': 56},
  ];
  
  // Find the product with highest sales
  var bestSeller = products.reduce((current, next) =>
    (current['sold'] as int) > (next['sold'] as int) ? current : next
  );
  
  print('🏆 Best Seller: ${bestSeller['name']} (${bestSeller['sold']} sold)');
}
```

**Output:**
```
🏆 Best Seller: Race Car (67 sold)
```

---

## 📦 The Smart Calculator: `fold()`

**Like reduce, but YOU choose the starting value!**

### Basic Example: Building a String
```dart
void main() {
  var departments = ['Toys', 'Games', 'Books', 'Art'];
  
  // Build store directory starting with header
  var directory = departments.fold('🏪 STORE DIRECTORY:\n', (result, dept) {
    return result + '  📁 $dept Department\n';
  });
  
  print(directory);
}
```

**Output:**
```
🏪 STORE DIRECTORY:
  📁 Toys Department
  📁 Games Department
  📁 Books Department
  📁 Art Department
```

### Advanced Example: Shopping Cart Total
```dart
void main() {
  var cartItems = [
    {'name': 'Teddy Bear', 'price': 15, 'quantity': 2},
    {'name': 'Race Car', 'price': 25, 'quantity': 1},
    {'name': 'Puzzle', 'price': 12, 'quantity': 3},
  ];
  
  // Calculate total cost starting from 0
  var totalCost = cartItems.fold(0.0, (total, item) {
    double itemTotal = (item['price'] as int) * (item['quantity'] as int);
    print('${item['name']}: \$${item['price']} x ${item['quantity']} = \$${itemTotal}');
    return total + itemTotal;
  });
  
  print('─' * 30);
  print('🛒 Cart Total: \$${totalCost}');
}
```

**Output:**
```
Teddy Bear: $15 x 2 = $30.0
Race Car: $25 x 1 = $25.0
Puzzle: $12 x 3 = $36.0
──────────────────────────────
🛒 Cart Total: $81.0
```

---

## 🔎 The Detector: `any()`

**Check if AT LEAST ONE item matches!**

```dart
void main() {
  var toyPrices = [15, 25, 8, 30, 12];
  var customerNames = ['Alice', 'Bob', 'Charlie'];
  
  // Check if there are any budget toys (under $10)
  bool hasBudgetToys = toyPrices.any((price) => price < 10);
  
  // Check if any customer is named 'Bob'
  bool hasBob = customerNames.any((name) => name == 'Bob');
  
  print('💰 Any toys under \$10? $hasBudgetToys');
  print('👤 Is Bob shopping today? $hasBob');
  
  if (hasBudgetToys) {
    print('✨ Great! We have budget-friendly options!');
  }
}
```

**Output:**
```
💰 Any toys under $10? true
👤 Is Bob shopping today? true
✨ Great! We have budget-friendly options!
```

---

## ✅ The Inspector: `every()`

**Check if ALL items match!**

```dart
void main() {
  var safetyRatings = [5, 4, 5, 5, 4]; // Out of 5 stars
  var stockLevels = [10, 15, 0, 8, 12];
  
  // Check if all toys are safe (4+ stars)
  bool allSafe = safetyRatings.every((rating) => rating >= 4);
  
  // Check if all items are in stock
  bool allInStock = stockLevels.every((stock) => stock > 0);
  
  print('🛡️ All toys safety approved? $allSafe');
  print('📦 All items in stock? $allInStock');
  
  if (allSafe && !allInStock) {
    print('⚠️ All toys are safe, but some items need restocking!');
  }
}
```

**Output:**
```
🛡️ All toys safety approved? true
📦 All items in stock? false
⚠️ All toys are safe, but some items need restocking!
```

---

## 🚀 The Finder Robot: `firstWhere()`

**Find the first item that matches!**

```dart
void main() {
  var products = [
    {'name': 'Teddy Bear', 'price': 15, 'color': 'brown'},
    {'name': 'Race Car', 'price': 25, 'color': 'red'},
    {'name': 'Doll', 'price': 20, 'color': 'pink'},
    {'name': 'Fire Truck', 'price': 30, 'color': 'red'},
  ];
  
  try {
    // Find first red toy
    var firstRedToy = products.firstWhere((toy) => toy['color'] == 'red');
    print('🔴 First red toy: ${firstRedToy['name']} (\$${firstRedToy['price']})');
    
    // Find first expensive toy (over $50) - this will throw an error!
    var expensiveToy = products.firstWhere((toy) => (toy['price'] as int) > 50);
    print('💎 Expensive toy: ${expensiveToy['name']}');
    
  } catch (e) {
    print('❌ No expensive toys found!');
  }
}
```

**Output:**
```
🔴 First red toy: Race Car ($25)
❌ No expensive toys found!
```

---

## 🍬 The Grabber: `take()`

**Take the first few items!**

```dart
void main() {
  var bestSellers = [
    'Teddy Bear', 'Race Car', 'Puzzle', 'Doll', 'Building Blocks',
    'Art Set', 'Board Game', 'Action Figure', 'Robot Toy', 'Music Box'
  ];
  
  // Show top 3 best sellers for promotion
  var top3 = bestSellers.take(3);
  
  print('🏆 TOP 3 BEST SELLERS:');
  var position = 1;
  top3.forEach((toy) {
    print('  ${position}. $toy');
    position++;
  });
  
  // Show first 5 for the homepage
  var homepage = bestSellers.take(5).toList();
  print('\n🌟 Homepage Featured: ${homepage.join(', ')}');
}
```

**Output:**
```
🏆 TOP 3 BEST SELLERS:
  1. Teddy Bear
  2. Race Car
  3. Puzzle

🌟 Homepage Featured: Teddy Bear, Race Car, Puzzle, Doll, Building Blocks
```

---

## 🚶 The Skipper: `skip()`

**Skip the first few items!**

```dart
void main() {
  var allProducts = [
    'Premium Toy A', 'Premium Toy B', 'Premium Toy C',  // Skip these expensive ones
    'Regular Toy 1', 'Regular Toy 2', 'Regular Toy 3',  // Show these affordable ones
    'Budget Toy X', 'Budget Toy Y', 'Budget Toy Z'
  ];
  
  // Skip first 3 premium toys, show the rest
  var affordableOptions = allProducts.skip(3);
  
  print('💰 AFFORDABLE TOY OPTIONS:');
  affordableOptions.forEach((toy) => print('  • $toy'));
  
  // Skip first 6 to show only budget toys
  var budgetOnly = allProducts.skip(6);
  print('\n🎯 BUDGET-FRIENDLY TOYS:');
  budgetOnly.forEach((toy) => print('  💵 $toy'));
}
```

**Output:**
```
💰 AFFORDABLE TOY OPTIONS:
  • Regular Toy 1
  • Regular Toy 2
  • Regular Toy 3
  • Budget Toy X
  • Budget Toy Y
  • Budget Toy Z

🎯 BUDGET-FRIENDLY TOYS:
  💵 Budget Toy X
  💵 Budget Toy Y
  💵 Budget Toy Z
```

---

## 🎭 The Visitor: `forEach()`

**Do something with every item!**

```dart
void main() {
  var customers = [
    {'name': 'Alice', 'purchase': 45},
    {'name': 'Bob', 'purchase': 78},
    {'name': 'Charlie', 'purchase': 23},
    {'name': 'Diana', 'purchase': 156},
  ];
  
  print('📧 SENDING PERSONALIZED THANK YOU EMAILS:\n');
  
  customers.forEach((customer) {
    String customerName = customer['name'] as String;
    int purchaseAmount = customer['purchase'] as int;
    
    // Different messages based on purchase amount
    if (purchaseAmount > 100) {
      print('💎 Dear $customerName,');
      print('   Thank you for your premium purchase of \$$purchaseAmount!');
      print('   You\'ve earned VIP status and 20% off your next visit!');
    } else if (purchaseAmount > 50) {
      print('⭐ Dear $customerName,');
      print('   Thank you for your \$$purchaseAmount purchase!');
      print('   Enjoy 10% off your next visit!');
    } else {
      print('😊 Dear $customerName,');
      print('   Thank you for your \$$purchaseAmount purchase!');
      print('   Come back soon for new arrivals!');
    }
    print(''); // Empty line for separation
  });
}
```

**Output:**
```
📧 SENDING PERSONALIZED THANK YOU EMAILS:

😊 Dear Alice,
   Thank you for your $45 purchase!
   Come back soon for new arrivals!

⭐ Dear Bob,
   Thank you for your $78 purchase!
   Enjoy 10% off your next visit!

😊 Dear Charlie,
   Thank you for your $23 purchase!
   Come back soon for new arrivals!

💎 Dear Diana,
   Thank you for your premium purchase of $156!
   You've earned VIP status and 20% off your next visit!
```

---

## 🔗 Chaining Methods: The Power Combo!

**Combine multiple methods for super powers!**

```dart
void main() {
  var inventory = [
    {'name': 'Teddy Bear', 'price': 15, 'rating': 4.8, 'inStock': true},
    {'name': 'Race Car', 'price': 25, 'rating': 4.2, 'inStock': false},
    {'name': 'Puzzle', 'price': 12, 'rating': 4.9, 'inStock': true},
    {'name': 'Doll', 'price': 20, 'rating': 3.8, 'inStock': true},
    {'name': 'Robot', 'price': 35, 'rating': 4.7, 'inStock': true},
    {'name': 'Art Set', 'price': 18, 'rating': 4.5, 'inStock': false},
  ];
  
  print('🎯 FINDING TOP RECOMMENDATIONS:\n');
  
  // Chain multiple methods together!
  var recommendations = inventory
    .where((item) => item['inStock'] == true)           // Only in-stock items
    .where((item) => (item['rating'] as double) > 4.5)  // High rated (4.5+)
    .where((item) => (item['price'] as int) <= 20)      // Affordable (≤$20)
    .map((item) => '⭐ ${item['name']} - \$${item['price']} (${item['rating']}⭐)')
    .take(3);                                            // Top 3 only
  
  print('🏆 TOP AFFORDABLE RECOMMENDATIONS:');
  recommendations.forEach(print);
  
  // Another chain: Calculate average price of available toys
  var avgPrice = inventory
    .where((item) => item['inStock'] == true)
    .map((item) => item['price'] as int)
    .reduce((a, b) => a + b) / 
    inventory.where((item) => item['inStock'] == true).length;
    
  print('\n💰 Average price of available toys: \$${avgPrice.toStringAsFixed(2)}');
}
```

**Output:**
```
🎯 FINDING TOP RECOMMENDATIONS:

🏆 TOP AFFORDABLE RECOMMENDATIONS:
⭐ Teddy Bear - $15 (4.8⭐)
⭐ Puzzle - $12 (4.9⭐)

💰 Average price of available toys: $20.50
```

---

## 🧠 Quick Reference Guide

### The Essential Collection Methods

| Method | Purpose | Returns | Example Use Case |
|--------|---------|---------|------------------|
| `map()` | Transform each item | New iterable | Convert prices to strings |
| `where()` | Filter by condition | New iterable | Find items on sale |
| `reduce()` | Combine into single value | Same type | Calculate total |
| `fold()` | Combine with start value | Any type | Build a string from list |
| `any()` | Check if at least one matches | bool | Any item out of stock? |
| `every()` | Check if all match | bool | All items safe for kids? |
| `firstWhere()` | Find first match | Single item | Find specific product |
| `take(n)` | Get first n items | New iterable | Show top 5 results |
| `skip(n)` | Skip first n items | New iterable | Paginate results |
| `forEach()` | Do action on each | void | Send emails to customers |

---

## 🚀 Practice Challenges

Try these real-world scenarios:

1. **Restaurant Menu**: Filter dishes by dietary restrictions, calculate total calories
2. **Student Grades**: Find honor students, calculate class average, check if anyone failed
3. **Music Playlist**: Find songs by artist, calculate total duration, create top 10 list
4. **Weather Data**: Find hottest day, check if any day rained, calculate average temperature

---

## 🎉 Remember This!

Collection methods are like having a **team of specialized workers** 👥:

- **🎨 map()** = The Artist (transforms everything)
- **🔍 where()** = The Security Guard (only lets certain items through)
- **🧮 reduce()** = The Accountant (adds everything up)
- **🔎 any()** = The Detective (finds if something exists)
- **✅ every()** = The Quality Inspector (checks everything meets standards)

With these tools, you can process thousands of items in just a few lines of code! Your toy store (or any app) will run like magic! ✨🏪