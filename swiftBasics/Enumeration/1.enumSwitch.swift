// 열거형은 스위치로 쓸 때가 사용성이 좋다.
enum LoginProvider: String {
    case email
    case facebook
    case google
} // Login Type

let userLogin = LoginProvider.email // if someone login with email

switch userLogin {
case .email:
    print("이메일")
case .facebook:
    print("fb")
case .google:
    print("google")
} // -> print email

// Optional Enum인 경우 && 연관값이 없는 경
enum SomeEnum {
    case left1
    case right1
}

// 열거형을 다시 열거형으로 만드는 경우
let x: SomeEnum? = .left1
// 값이 있다면 .some 내부에 다시 .left / .right 열거형
// 없다면 .none => nil

// 정식표현
switch x {
case let .some(value):
    switch value {
    case .left1:
        print("left")
    case .right1:
        print("right")
    }
case .none:
    print("gogo")
}

// 약식
switch x { // x is Optional, but you dont have to unwrap
case .some(.left1):
    print("left")
case .some(.right1):
    print("right1")
case .none:
    print("gogo")
}

// =---=
// 연관값이 있는 Enum 과 switch
// 열거형 case 패턴
// - case Enum.case(let variable)
// - case let Enum.case(variable)

enum Computer {
    case cpu(core: Int, ghz: Double)
    case ram(Int, String)
    case hdd(gb: Int)
}

var chip = Computer.cpu(core: 8, ghz: 3.1)

switch chip {
case .cpu(core: 8, ghz: 3.1):
    print("wow")
case .cpu(core: 4, ghz: let ghz): // 연관값 꺼내서 바인딩
    print("\(ghz)? wow")
default:
    break
}

chip = Computer.hdd(gb: 128)

if case let Computer.hdd(gb: gb) = chip {
    print("\(gb)")
}

let chiplists: [Computer] = [
    .cpu(core: 4, ghz: 3.1),
    .cpu(core: 8, ghz: 3.0),
    .cpu(core: 4, ghz: 3.4),
    .cpu(core: 4, ghz: 3.0),
    .cpu(core: 8, ghz: 3.5),
    .cpu(core: 8, ghz: 3.0),
    .cpu(core: 8, ghz: 3.0),
    .ram(16, "DRAM"),
    .hdd(gb: 128),
]
for case let .cpu(core: c, ghz: h) in chiplists { // chiplist의 .cpu case만큼 반복
    print("CPU : \(c) core, \(h) ghz")
}

for chip in chiplists {
    print("\(chip)")
}

// ---
let arr: [Int?] = [nil, 1, 2, nil, 5]
for case let .some(number) in arr {
    print("Found a \(number)")
} // some 인 경우만 반복
