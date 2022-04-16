import Foundation

var greeting = "Hello, playground"

// 첫글자, 마지막글자
let firstWord = greeting.first // Character?
let lastWord = greeting.last // Character?

// String.Index로 문자열의 Charcter 접근하기
let index = greeting.index(greeting.startIndex, offsetBy: 4)
let o = greeting[index] // Character

// Range로 문자열의 부분 접근하기
let hello = greeting[greeting.startIndex..<index] // Substring

// Range 만드는 방법
let range: Range<String.Index> = greeting.startIndex..<greeting.index(greeting.startIndex, offsetBy: 5)

// 특정 인덱스에 삽입
greeting.append("😸")
greeting.insert("👋", at: greeting.index(greeting.startIndex, offsetBy: 5))

// 특정 인덱스에 삭제
greeting.remove(at: greeting.index(before: greeting.endIndex))

// 특정 range의 문자열 삭제
let rangeToDelete = greeting.startIndex..<greeting.index(greeting.endIndex, offsetBy: -11)
greeting.removeSubrange(rangeToDelete)
print(greeting)

// Unicode 문자별로 bit크기가 다름
let lemon = "🍋lemon"
let apple = "apple"
let lemonade = "lemonade"

let lemonRange = lemon.startIndex..<lemon.index(lemon.startIndex, offsetBy: 3)
let lemonadeRange = lemonade.startIndex..<lemonade.index(lemonade.startIndex, offsetBy: 3)
let appleRange = apple.startIndex..<apple.index(apple.startIndex, offsetBy: 3)
