/*
 break, fallthrough, continue, return, throw
 */

var a = 3
switch a {
case 1:
    break
case 2:
    print(a)
case 3:
    print("it is 3")
case: 4
    print("hi")
default:
    break // you will break the loop
}

for i in 1 ... 10 {
    if i == 3 {
        break
    } // and if i is 3, the nearest loop would be stopped
}

// fallthrough
// only in switch loop

var a = 3
switch a {
case 1:
    break
case 2:
    print(a)
case 3:
    print("it is 3")
    fallthrough // in this case == 3, fallthrough keyword let the case 4 run
case: 4
    print("hi")
default:
    break //
}

// continue
for index in 1 ... 10 {
    if index % 2 != 0 {
        continue
    } // if index is not even number, just run the next index
    print(index)
}

// return
func doSth() {
    print("1")
    print("2")
    if true {
        return
    }
    print("this print never be executed")
}
