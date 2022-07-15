/*
 특정 규칙을 가진 문자열 집합을 표현할 때 쓰는 형식 언어
 Rawstring 으로 정규식을 인식시킨 후, 스트링 비교 메소드 옵션에 정규표현식을 표기
 [정규표현식](https://ko.wikipedia.org/wiki/%EC%A0%95%EA%B7%9C_%ED%91%9C%ED%98%84%EC%8B%9D)
 */
import Foundation

var phone = "010-2121-3434"

// 전화번호의 정규표현식
var telephoneRegex = #"[0-9]{3}\-[0-9]{4}\-[0-9]{4}"#
var telephoneRegex2 = #"[0-9]{3}[. -]?[0-9]{4}[. -]?[0-9]{4}"#

// 이메일
var emailRegex = #".*@.*\..*"#

// 우편번호
var postcode = #"[0-9]{3}\-[0-9]{3}"#

if let _ = phone.range(of: telephoneRegex, options: [.regularExpression]) {
    print("유효")
}
