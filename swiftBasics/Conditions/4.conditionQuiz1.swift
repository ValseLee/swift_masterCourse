// code using xcode, Copy & Paste from there

import Foundation
import SwiftUI

var number: Int;
var computerPick: Int;

print("0=바위, 1=가위, 2=보")
var playerPick = Int(readLine()!)!;

computerPick = Int.random(in:0...2);

if playerPick == computerPick {
  print("draw!");
} else if playerPick < computerPick && playerPick != 2 {
    print("computer wins!")
  } else if computerPick < playerPick && computerPick != 2 {
    print("player  wins!")
  } else if computerPick <= playerPick {
    print("computer wins")
  } else {
    print(playerPick, computerPick)
  }
