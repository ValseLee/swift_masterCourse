// type Alias

// 기존 선언된 타입에 새로운 별칭을 붙여서 시맨틱하게 쓰는 법
typealias Name = String;
// String 은 이제 Name이라는 라벨을 갖는다.
// 타입도 변수화가 가능하다!
let name: Name = "승준";

typealias Something = (Int) -> String;
// 이렇게 하면 가독성이 매우 좋아지겟지?

func someFunction(completionHandler: (Int) -> String) {
    // do sth
};

func someBetterFunction(completionHandler: Something) {
    // do sth
};

// console warning, error
/*
warning : 코드가 작동은 하는데 더 나은 방식으로 해라
error : 수정해야 해
*/