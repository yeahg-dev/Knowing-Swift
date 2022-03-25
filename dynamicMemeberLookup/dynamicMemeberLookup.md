# @dynamicMemberLookup



기존 subscript과 유사하지만,

`.` (dot syntax)로 사용할 수 있도록 하는 키워드 (문법적 슈가)

- class, structure, enum, protocol에 적용가능
- `@dynamicMemberLookup` 키워드를 타입 정의부 위에 붙여야함
- `subscript(dynamicMember:)` 를 필수로 구현해야하고, 런타임에 `.` 문법으로 접근이 가능
  - `dynamicMember` 인자에는 [`ExpressibleByStringLiteral`](https://developer.apple.com/documentation/swift/expressiblebystringliteral) 프로토콜은 준수하는 타입만 올 수 있음

- Extension에서는 사용 불가

