/*
 forEach : 배열 각 아이템을 활용하여 아이템 별로 작업한다. 보이드 타입 함수
 각 배열벌로 뭔가 실험하거나 확인할 게 있다면 사용해보자
 타입 체크라던가?
 */

let immutable = [1, 2, 3, 4, 5]

// 기본 형태
// immutable.forEach(body: (Int) throws -> Void)

immutable.forEach {
    print($0)
}

/*
 compactMap : 배열의 각 아이템을 새로 매핑 및 변경하고 옵셔널을 '제거'한 새로운 배열을 리턴함
 Map + optional 제거를 해준다!
 */

let optionalStr: [String?] = ["A", nil, "B", nil, "C"]
var newStr = optionalStr.compactMap { $0 }
print(newStr) // ["A","B","C"]

let nums = [-1, -2, -3, 0, 1, 2, 3]
// 조건에 맞지 않는 것들을 nil 로 만들어버리고, 실제 반환할 때 compactMap을 써서 조건에 맞는 것들만 배열로 만들어서 리턴
// 굳이 이렇게 하지 않고 filter 해도 될듯
var positive = nums.compactMap { $0 >= 0 ? $0 : nil }
print(positive) // [0,1,2,3]

// 만약 filter를 적용하는 배열에 nil이 있고 이걸 제거하고 싶다면..?
var positive2 = optionalStr.filter { $0 != nil }.map { $0! }
print(positive2) // ["A", "B", "C"]

/*
 flatMap : 중첩 배열의 각 배열을 매핑해서 중첩 배열을 제거하고 리턴
 모든 중첩을 다 벗기고 1차 배열이 된당
 */

var nested = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
var notNested = nested.flatMap { $0 }
print(notNested) // [1,2,3,4,5,6,7,8,9]
