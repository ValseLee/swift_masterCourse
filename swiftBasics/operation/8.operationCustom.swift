/*
 파이썬처럼 ++ 두 개를 붙여서 연산자로 만들고 싶다면?
 내가 원하는 연산자를 구현할 수 있다!
 후치 연산자인지, 전치 연산자인지 명시해야 하고 이를 구현해주자.
 */

// 구현하고자 하는 연산자의 위치 선언
postfix operator ++

extension Int {
    static postfix func ++ (num: inout Int) {
        num += 1
    }
}

var k = 1
k++
print(k) // 2

struct Vector2D {
    var x = 0.0, y = 0.0
}

extension Vector2D {
    // infix 키워드는 생략한다.
    static func + (lhs: Vector2D, rhs: Vector2D) -> Vector2D {
        return Vector2D(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }

    static func += (lhs: inout Vector2D, rhs: Vector2D) -> Vector2D {
        lhs = lhs + rhs
        return lhs
    }

    static func +- (lhs: Vector2D, rhs: Vector2D) -> Vector2D {
        return Vector2D(x: lhs.x + rhs.x, y: lhs.y - rhs.y)
    }
}

/*
 infix 연산자는 우선순위를 정해주어야 한다.
 어느 연산이 먼저 진행될 건지 컴파일러가 알아야지?

 아무런 지정이 없으면 DefaultPrecedence 라는 기본 그룹에 속하게 된다.
 공식문서 기본연산자 -> 연산의 우선 순위 페이지에 표가 있다.
 삼항연산자보다는 한 단계 높은 우선순위로 되며, 다른 연산자와 결합 사용은 불가능하다.

 우선순위를 직접 지정해야 한다면 어떤 연산보다 낮게 할 건지, 높게 할 건지 최소 하나는 지정해야 한다.
 결합성은 계산의 순서를 말한다. 왼쪽에서 오른쪽으로 계산하는 게 일반적이지.
 좌결합 : (10 - 5) - 5 = 0
 우결합 : 10 - (5 - 5) = 10
 */

precedencegroup My {
    // 더하기,빼기 우선순위보다는 높고
    higherThan: AdditionPrecedence
    // 곱하기,나누기 우선순위보다는 낮다.
    lowerThan: MultiplicationPrecedence
    // 왼쪽우선 결합
    associativity: left
}

// 내 우선순위 그룹을 +- 연산자에 적용
infix operator +-: My
