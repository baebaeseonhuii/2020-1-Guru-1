import Foundation
import SpriteKit

// MARK: - Variable
var Scene = GameScene()
let NSDefault = UserDefaults.standard
// Variable_End


// MARK: - Enumeration

// BodyType //
enum BodyType: UInt32 {
    
    case Player = 1
    case PlayerAttack = 2
    case Monster = 4
    case MonsterAttack = 8
    case NPC = 16
    case Gold = 32
    case Portal = 64
    case Object = 128
}


// Direction //
enum Direction {
    
    case E, W, S, N, ST
}
// Enumeration

