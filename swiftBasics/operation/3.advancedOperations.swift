import Foundation

var num = 25

// 숫자 리터럴을 n진법으로 표기
num = 0b0001_1001
num = 0o31
num = 0x19

// 큰 숫자 리터럴은 언더바로 단위구분을 할 수 있다.
num = 1_000_000

/*
 스위프트 정수 타입은 플랫폼 사양에 따른다(현재는 64비트).
 8-bit : Int8, UInt8
 16-bit : Int16, UInt16
 32-bit : Int32, UInt32
 64-bit : Int64, UInt64
 */

var k = MemoryLayout<Int8>.size
print(Int8.max, Int8.min) // 127 ~ -128
print(k) // 1
k = MemoryLayout<Int>.size
print(Int.max, Int.min) // 9223372036854775807 ~ -9223372036854775808 // 2^63 - 1, -2^63
print(k) // 8
