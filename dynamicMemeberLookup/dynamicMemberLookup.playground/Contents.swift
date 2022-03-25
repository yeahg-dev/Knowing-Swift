import UIKit

@dynamicMemberLookup
struct Family {
    var persons: [String: String]
    
    subscript(dynamicMember dynamicMember: String) -> String? {
        get {
            return persons[dynamicMember]
        }
        set {
            self.persons[dynamicMember] = newValue
        }
    }
}

var family = Family(persons: ["아들": "짱구", "귀요미": "흰둥이"])

//🍎 []대신 .문법으로 get set 가능
let dog = family.귀요미
print(dog!) // 흰둥이

family.딸 = "짱아"
print(family.딸!) // 짱아
