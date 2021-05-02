
import SpriteKit
import GameplayKit

extension Field {
    
// MARK: - Portal
func PhysicsBody_Portal() {
    
    let PhysicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 25, height: 25))
    
    self.physicsBody = PhysicsBody
    self.physicsBody?.isDynamic = true
    self.physicsBody?.affectedByGravity = false
    self.physicsBody?.allowsRotation = false
    self.physicsBody?.categoryBitMask = BodyType.Portal.rawValue
    self.physicsBody?.contactTestBitMask = BodyType.Player.rawValue
    self.physicsBody?.collisionBitMask = 0
}
// Portal_End
    
    
// MARK: - Portal
func PhysicsBody_Object() {
    
    let PhysicsBody = SKPhysicsBody(rectangleOf: self.size)
    
    self.physicsBody = PhysicsBody
    self.physicsBody?.isDynamic = false
    self.physicsBody?.affectedByGravity = false
    self.physicsBody?.allowsRotation = false
    self.physicsBody?.categoryBitMask = BodyType.Object.rawValue
    self.physicsBody?.collisionBitMask = BodyType.Player.rawValue
}
// Portal_End


}
