import UIKit

var greeting = "Hello, playground"

var shoppingList = ["butter": 1, "jam": 3, "iceCream": 4, "beer": 3]

let itemList = shoppingList.flatMap { (item, quantiy) in
    return [item: quantiy + 1]
}

print(itemList) // ["beer", "iceCream", "butter", "jam"]

shoppingList.forEach { (key, value) in
    shoppingList.updateValue(value + 1, forKey: key)
}

print(shoppingList)

for (key, value) in shoppingList {
    shoppingList.updateValue(value + 1, forKey: key)
}

print(shoppingList)
