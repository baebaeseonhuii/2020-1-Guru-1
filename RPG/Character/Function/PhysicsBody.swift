import SpriteKit
import GameplayKit

extension Character {
    
// MARK: - Player
    func PhysicsBody_Player() {
        
        //let Texture = SKTexture(imageNamed: "RedSwan")
        //let PhysicsBody = SKPhysicsBody(texture: Texture, size: self.size)
        let PhysicsBody = SKPhysicsBody(circleOfRadius: self.size.width / 2, center: CGPoint.zero)

        self.physicsBody = PhysicsBody
        self.physicsBody?.isDynamic = true
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.categoryBitMask = BodyType.Player.rawValue
        self.physicsBody?.contactTestBitMask = BodyType.NPC.rawValue | BodyType.MonsterAttack.rawValue | BodyType.Gold.rawValue
        self.physicsBody?.collisionBitMask = BodyType.NPC.rawValue | BodyType.Monster.rawValue | BodyType.Object.rawValue
    }
    
    func PhysicsBody_PlayerAttack() {
        
        let PhysicsBody = SKPhysicsBody(rectangleOf: self.size)
        
        self.physicsBody = PhysicsBody
        self.physicsBody?.isDynamic = true
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.categoryBitMask = BodyType.PlayerAttack.rawValue
        self.physicsBody?.contactTestBitMask = BodyType.Monster.rawValue
        self.physicsBody?.collisionBitMask = BodyType.Monster.rawValue
    }
// Player_End


// MARK: - Monster
    func PhysicsBody_Monster() {
        
        //let Texture = SKTexture(imageNamed: "RedSwan")
        //let PhysicsBody = SKPhysicsBody(texture: Texture, size: self.size)
        let PhysicsBody = SKPhysicsBody(circleOfRadius: self.size.width / 2, center: CGPoint.zero)
        
        self.physicsBody = PhysicsBody
        self.physicsBody?.isDynamic = true
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.categoryBitMask = BodyType.Monster.rawValue
        self.physicsBody?.contactTestBitMask = BodyType.PlayerAttack.rawValue
        self.physicsBody?.collisionBitMask = BodyType.Player.rawValue | BodyType.Monster.rawValue
    }
    
    func PhysicsBody_MonsterAttack() {
        
        let PhysicsBody = SKPhysicsBody(rectangleOf: self.size)

        self.physicsBody = PhysicsBody
        self.physicsBody?.isDynamic = true
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.categoryBitMask = BodyType.MonsterAttack.rawValue
        self.physicsBody?.contactTestBitMask = BodyType.Player.rawValue
        self.physicsBody?.collisionBitMask = BodyType.Player.rawValue | BodyType.Monster.rawValue
    }
// Monster_End
    
    
// MARK: - NPC
   func PhysicsBody_NPC() {
       
      
       let PhysicsBody = SKPhysicsBody(circleOfRadius: self.size.width / 2, center: CGPoint.zero)
    
        self.physicsBody = PhysicsBody
       self.physicsBody?.isDynamic = false
       self.physicsBody?.affectedByGravity = false
       self.physicsBody?.allowsRotation = false
       self.physicsBody?.categoryBitMask = BodyType.NPC.rawValue
       self.physicsBody?.contactTestBitMask = BodyType.Player.rawValue
       self.physicsBody?.collisionBitMask = BodyType.Player.rawValue
    }
// NPC_End

    
// MARK: - Gold
    func PhysicsBody_Gold() {
        
        let PhysicsBody = SKPhysicsBody(rectangleOf: self.size)

        self.physicsBody = PhysicsBody
        self.physicsBody?.isDynamic = true
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.allowsRotation = false
        self.physicsBody?.categoryBitMask = BodyType.Gold.rawValue
        self.physicsBody?.contactTestBitMask = BodyType.Player.rawValue
        self.physicsBody?.collisionBitMask = 0
    }
// Gold_End


}

