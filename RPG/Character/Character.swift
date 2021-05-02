
import SpriteKit
import GameplayKit

class Character: SKSpriteNode {
    
// MARK: - Variable
    // Direction //
    var CurrentDirection = Direction.ST
    var LastDirection = Direction.ST
    var AttackDirection = Direction.S
    
    
    // Status //
    var PositionX = CGFloat()
    var PositionY = CGFloat()
    var Sort = String()
    var Costume = String()
    var Class  = String()
    var AT = CGFloat()
    var DF = CGFloat()
    var Luck = CGFloat()
    var SP = CGFloat()
    var RunSP = CGFloat()
    var WalkSP = CGFloat(1)
    var HP = CGFloat()
    var CurrentHP = CGFloat()
    var EXP = CGFloat()
    var LV = CGFloat()
    var Gold = Int()
    var GoldAmount = Int()
    var Number = Int()
    var SearchRange = CGFloat()
    var AttackRange = CGFloat()
    var DeltaX = CGFloat()
    var DeltaY = CGFloat()
    var AdjustedPosition = CGPoint()
    var MSGArray = [String]()

    
    // Move //
    var SpeedX = CGFloat()
    var SpeedY = CGFloat()
    
    
    // Mode //
    var MoveDelayIs = Bool(false)
    var AttackDelayIs = Bool(false)
    var AttackDamageIs = Bool(true)
    var SkillDelayIs = Bool(false)
    var StopDelayIs = Bool(false)
    var WalkingIs = Bool(true)
    var GoldActiveIs = Bool(true)
    var ItemIs = Bool(false)
// Variable_End


}
