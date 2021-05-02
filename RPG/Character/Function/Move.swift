
import SpriteKit
import GameplayKit

extension Character {
    
    func Function_Move() {
        
        switch (CurrentDirection) {
            
        case .ST:
            SpeedX = 0
            SpeedY = 0
            
            if CurrentDirection != LastDirection {
                
                removeAction(forKey: "Move")
                
                if LastDirection == Direction.E {
                    
                    self.texture = SKTexture(imageNamed: self.Costume + "MoveE1")
                }
                
                if LastDirection == Direction.W {
                    
                    self.texture = SKTexture(imageNamed: self.Costume + "MoveW1")
                }
                
                if LastDirection == Direction.S {
                    
                    self.texture = SKTexture(imageNamed: self.Costume + "MoveS1")
                }
        
                if LastDirection == Direction.N {
                    
                    self.texture = SKTexture(imageNamed: self.Costume + "MoveN1")
                }
                
                AttackDirection = LastDirection
            }
            
            LastDirection = CurrentDirection
            
            
        case .E:
            SpeedX = SP
            SpeedY = 0
            
            if CurrentDirection != LastDirection {
                
                let MoveAtlas = SKTextureAtlas(named: self.Costume + "MoveE")
                var MoveFrame = [SKTexture]()
                
                for i in 1...MoveAtlas.textureNames.count / 2 {
                    
                    let TextureName = self.Costume + "MoveE" + "\(i)"
                    MoveFrame.append(MoveAtlas.textureNamed(TextureName))
                }
                
                let MoveAnimationAction = SKAction.repeatForever(SKAction.animate(with: MoveFrame, timePerFrame: 0.125))
                self.run(MoveAnimationAction, withKey: "Move")
                
                AttackDirection = CurrentDirection
            }
            
            LastDirection = CurrentDirection
            
            
        case .W:
            SpeedX = -SP
            SpeedY = 0
            
            if CurrentDirection != LastDirection {
                
                let MoveAtlas = SKTextureAtlas(named: self.Costume + "MoveW")
                var MoveFrame = [SKTexture]()
                
                for i in 1...MoveAtlas.textureNames.count / 2 {
                    
                    let TextureName = self.Costume + "MoveW" + "\(i)"
                    MoveFrame.append(MoveAtlas.textureNamed(TextureName))
                }
                
                let MoveAnimationAction = SKAction.repeatForever(SKAction.animate(with: MoveFrame, timePerFrame: 0.125))
                self.run(MoveAnimationAction, withKey: "Move")
                
                AttackDirection = CurrentDirection
            }
            
            LastDirection = CurrentDirection

            
        case .S:
            SpeedX = 0
            SpeedY = -SP
            
            if CurrentDirection != LastDirection {
                
                let MoveAtlas = SKTextureAtlas(named: self.Costume + "MoveS")
                var MoveFrame = [SKTexture]()
                
                for i in 1...MoveAtlas.textureNames.count / 2 {
                    
                    let TextureName = self.Costume + "MoveS" + "\(i)"
                    MoveFrame.append(MoveAtlas.textureNamed(TextureName))
                }
                
                let MoveAnimationAction = SKAction.repeatForever(SKAction.animate(with: MoveFrame, timePerFrame: 0.125))
                self.run(MoveAnimationAction, withKey: "Move")
                
                AttackDirection = CurrentDirection
            }
            
            LastDirection = CurrentDirection

            
        case .N:
            SpeedX = 0
            SpeedY = SP
            
            if CurrentDirection != LastDirection {
                
                let MoveAtlas = SKTextureAtlas(named: self.Costume + "MoveN")
                var MoveFrame = [SKTexture]()
                
                for i in 1...MoveAtlas.textureNames.count / 2 {
                    
                    let TextureName = self.Costume + "MoveN" + "\(i)"
                    MoveFrame.append(MoveAtlas.textureNamed(TextureName))
                }
                
                let MoveAnimationAction = SKAction.repeatForever(SKAction.animate(with: MoveFrame, timePerFrame: 0.125))
                self.run(MoveAnimationAction, withKey: "Move")
                
                AttackDirection = CurrentDirection
            }
            
            LastDirection = CurrentDirection
        }
        
        if self.MoveDelayIs == false {
            
            self.position = CGPoint(x: self.position.x + SpeedX, y: self.position.y + SpeedY)
        }
    }


}
