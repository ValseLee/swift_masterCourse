// if문 : 참과 거짓으로 특정 코드를 실행하도록 하는 문장

var number = 5;

// 표현식
if number < 8 {
    print(number);
}

//

if number >= 10 {
    print(number);
} else {
    print(number * 2);
}

//

if number >= 10 {
    print(number);
} else if number <= 5 {
    print(number * 2);
}


// 틀린 논리 구조
let num = -7;

if num >= 0 {
    print("양수")
} else if num % 2 == 0 {
    print("양의 짝수")
} else if num % 2 == 1 {
    print("양의 홀수")
} else {
    print("음수")
}

// 수정
let num2 = -8;

if num >= 0 {
    if num % 2 == 0 {
        print("양의 짝수")
    } else if num % 2 == 1 {
        print("양의 홀수")
    }
} else {
    print("음수")
}

// 이런 거도 돼
num >= 0 && num % 2 == 0
    ? print("양의 짝수");
    : print("양의 홀수");

// 조건문은 첫번째 조건이 만족하면 그 하단의 조건문이 실행되지 않음
// 조건 분기를 잘 정리해야 한다. 의도에 알맞게 코드를 실행할 수 있도록

var email = "vetiver@gmail.com"
var pass = "1234"
if email == "vetiver@gmail.com" && pass == "1234" {
    print("메인페이지 이동 코드 써")
}

if email != "vetiver@gmail.com" || pass != "1234" {
    print("앗 저런! 메인페이지로 가면 안 되겠는걸?")
}

// 조건문 활용
var id = "vetiver";

if id.count >= 5 {
    print("아이디가 좀 긴데? 아이디 바꿔야대")
}