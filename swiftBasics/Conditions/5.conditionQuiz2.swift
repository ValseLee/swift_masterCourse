// code using xcode, Copy & Paste from there
// Bingo Game

import Foundation
import SwiftUI

var number: Int;
var computerPick: Int;

computerPick = Int.random(in:0...10);

func bingoGame() {
  print("빙고 게임, 기회는 10번!")
  var count: Int = 0;
  while count < 10 {
    var playerPick = Int(readLine()!)!;
    if computerPick > playerPick {
      print("UP")
    } else if computerPick < playerPick {
      print("Down")
    } else {
      print("Bingo")
    }
    count += 1;
  }
  }

bingoGame();