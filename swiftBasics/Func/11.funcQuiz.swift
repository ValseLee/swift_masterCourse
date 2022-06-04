import Foundation
// string -> one random string

func randomString(_ a: String) {
    let ind = a
    let k = Int.random(in: 0 ..< ind.count)
    print(ind[ind.index(ind.startIndex, offsetBy: k)])
}

// what the fck did i do...
// 자동완성 없어서 몰랐잖아...

func randomString2(_ chars: String) -> String {
    let randomString = String(chars.randomElement()!)
    return randomString
} // what... the....

// prime number tester

func primeNum(_ num: Int) {
    var isPrime = true
    // guard num != 2 else {
    //     print(isPrime)
    //     return
    // } <- unnecessary

    for index in 2 ..< num {
        if num % index == 0 {
            isPrime = false
            break
        } else {
            break
        }
    }
    print(isPrime)
}

// what teacher does
func primeNumber(num: Int) {
    for i in 2 ..< num {
        if num % i == 0 {
            print("not")
            return
        }
    }
    print("yes")
}

// factorial
func factorialSum(_ num: Int) -> Int {
    var factorialNum = 1
    for i in 1 ... num {
        factorialNum *= i
    }
    print(factorialNum)
    return factorialNum
} // ezpz

// recursion factorial
func factorialSum2(num: Int) -> Int {
    if num <= 1 {
        return 1
    }
    return num * factorialSum2(num: num -1)
} // looks similar to guard func

// how recursion works
/*
 1. main() -> recursion1() -> recursion2() -> ... -> recursion()
 	- it is stacked
 2. if you dont set any off condition, it causes "StackOverflow"
 */
