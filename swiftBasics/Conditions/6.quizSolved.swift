// Tutor does it like this
// 

var computerChoice = Int.rande(in: 0...2)
var myChoice:Int = 2; // Static number..?

switch computerChoice {
    case 0:
    print("com picks 가위");
    case 1:
    print("com picks 바위");
    case 2:
    print("com picks 보");
    default:
    break;
}

switch myChoice {
    case 0:
    print("you pick 가위")
    case 1:
    print("you pick 바위")
    case 2:
    print("you pick 보")
    default:
    break;
}

if myChoice == 0 {
 // 아니 이걸 하드코딩을 다 한다고?
} else if mychoice == 1 {

} else if mychoice == 2 {

} 

///
/// 

if myChoice == computerChoice {
    print("무승부")
} else if myChoice == 0 && computerChoice == 2 {

} // 이런 식으로 경우 나눠서 풀이 가능

// Bingo Quiz