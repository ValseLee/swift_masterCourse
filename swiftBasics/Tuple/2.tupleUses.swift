let iOS = (
    language: "Swift",
    version: 5
)
iOS.language

if iOS.0 == "Swift" && iOS.1 == 5 {
    print("최신 버젼이군요")
}

if iOS == ("Swfit", 5) {
    print("최신 버전이야")
}

// 스위칭에서 자주 쓸 듯
switch iOS {
    case ("Swift", 5):
    print("최신")
    case ("Swfit", 4):
    print("어라 최신 버젼이 아닌데?")
    default:
    break;
}

// 바인딩 패턴 : 튜플을 바인딩하듯 사용할 수 있다.
// 바인딩 : 기준 변수를 새로운 상수에 매칭하는 거야 잊지마

var matrix: (Int, Int) = (9,0)
// let (distance, 0) = (9, 0)
// => distance에 9 할당시켜서 빼오기

switch matrix {
    case let (x: Int,y: Int) where x == y: // 조건에 따라 튜플 케이스를 처리할 때 이렇게 쓰고
    print("\(x), \(y)는 현재 y = x 1차 함수 그래프 위에 있음")
    case (let x, let y): // 각 요소를 케이스 내에서 가공하려 할때는 이렇게 쓴다.
    print("좌표 : \(x), \(y)")
    case (let distance, 0), (0, let distance): // 두 좌표 중 하나가 0일 때
    print("X, Y축 위에 좌표가 위치하고 있고 각 거리는 \(distance)만큼")
    default:
    print("오잉 어딨징")
    break
}

// why should we use Tuple
// function에서 설명예정