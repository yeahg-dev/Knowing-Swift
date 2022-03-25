import UIKit

protocol Shape {
    
    func draw() -> String
}

struct Triangle: Shape {
    var size: Int
    func draw() -> String {
        var result = [String]()
        for length in 1...size {
            result.append(String(repeating: "*", count: length))
        }
        return result.joined(separator: "\n") }
}

struct FlippedShape<T: Shape>: Shape {
    var shape: T
    func draw() -> String {
        let lines = shape.draw().split(separator: "\n")
        return lines.reversed().joined(separator: "\n")
    }
}

let smallTriangle = Triangle(size: 3)

// 1️⃣ 프로토콜 타입이 리턴 타입일 때 한계점
// 리턴 타입이 프로토콜 타입인 함수
func protoFlip<T: Shape>(_ shape: T) -> Shape {
    return FlippedShape(shape: shape)
}

// 리턴 타입이 오파크 타입인 함수
func opaqueFlip<T: Shape>(_ shape: T) -> some Shape {
    return FlippedShape(shape: shape)
}

// 프로토콜 타입이 리턴 타입일 때
let protoFlippedTriangle = protoFlip(smallTriangle) // Shape타입
// 👿Error : Protocol 'Shape' as a type cannot conform to the protocol itself
let doubleProtoFlippedTriangle = protoFlip(protoFlippedTriangle)

// 오파크 타입이 리턴 타입일 때
let opaqueFlippedTriangle = opaqueFlip(smallTriangle)
let doubleOpaqueFlippedTriangle = opaqueFlip(opaqueFlippedTriangle) // 😇OK


// 2️⃣ associatedtype을 가지는 프로토콜의 한계점
protocol Container {
    
    associatedtype Item
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

extension Array: Container { }

// 👿Error: Protocol 'Container' can only be used as a generic constraint because it has Self or associated type requirements
func makeProtocolContainer<T>(item: T) -> Container {
    return [item]
}
// 👿Error: Not enough information to infer C.
func makeProtocolContainer<T, C: Container>(item: T) -> C {
    return [item]
}

// 😇 오파크는 가능
func makeOpaqueContainer<T>(item: T) -> some Container {
    return [item]
}
let opaqueContainer = makeOpaqueContainer(item: 12)
let twelve = opaqueContainer[0] // 실제 타입 유추도 가능
print(type(of: twelve))


// 💡결론
// 1️⃣ 프로토콜 타입 리턴 타입은 또 다른 함수에서 사용이 불가하지만, 오파크 타입은 가능하다
// 2️⃣ associatedtype을 사용하는 프로토콜 타입을 오파크 타입으로 쓰면, 리터 타입으로 쓸 수 있다. (타입 어노테이션은 불가)

// 코드 출처 : https://docs.swift.org/swift-book/LanguageGuide/OpaqueTypes.html
// 참고 블로그 : https://wlaxhrl.tistory.com/82
