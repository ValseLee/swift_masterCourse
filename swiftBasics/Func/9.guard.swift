// only in Swift 5✨
// by using this, no more pyramids of if statements
// you can use guard in if and loop

if true {
    print("1")
    if true {
        print("2")
        if true {
            print("??")
        }
    }
}

// so many ifs....

func password(password: String) -> Bool {
    if password.count >= 6 {
        // login process codes 1
        // login process codes 2
        // login process codes 3
    } else {
        print("?")
    }
    return true
}

func passwordGuard(password: String) -> Bool {
    // early exit
    guard password.count >= 6 else {
        return false
    } // if that guard condition is true, it can pass through

    // guard true else { return false }
    // guard true else { return false }
    // how easy it is
    // no more nested ifs...

    // login process codes 1
    // login process codes 2
    // login process codes 3

    return true
}

//
func checkString(words: String) -> Bool {
    guard words.count >= 5 else {
        // guard should stop sth.
        // especially in func, you should use with 'return'
        // because guard is not 'fallthrough'
        print("\(words) is not over 5 char")
        return false
    }
    print("\(words) is over 5 char")
    return true
}

checkString(words: "Fabluous") // true
checkString(words: "ho")
