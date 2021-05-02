import SpriteKit
import GameplayKit

extension GameScene {
    
// MARK: - Control Ball Angle
    func ControlBallAngle(Degree: CGFloat) {
        
        if (Degree >= -45 && Degree < 45) {
            
            Player.CurrentDirection = Direction.E
            
        } else if (Degree >= 45 && Degree < 135) {
            
            Player.CurrentDirection = Direction.N

        } else if (Degree >= 135 && Degree < 180) {
            
            Player.CurrentDirection = Direction.W

        } else if (Degree >= -180 && Degree < -135) {
            
            Player.CurrentDirection = Direction.W

        } else if (Degree >= -135 && Degree < -45) {
            
            Player.CurrentDirection = Direction.S
        }
    }
// Control Ball Angle_End
    
    
// MARK: - Touch
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in (touches) {
            
            let Location = touch.location(in: self)
            
            var CorrectedLocation = CGPoint()
            CorrectedLocation.x = Location.x - LocalCamera.position.x
            CorrectedLocation.y = Location.y - LocalCamera.position.y

            if GameOverIs == true {
                
                Transition(Destination: "Village")
                
            } else if MSGIs == true {
                
                if MSGArray.count != 0 {
                    
                    MSGArray.remove(at: 0)
                    MSGBox.removeFromParent()
                    MSGIs = false
                    Player.NPC_MSG()
                    
                    if MSGArray.count == 0 {
                        
                        Player.NPC_Shop()
                    }
                }
                
            } else if ShopIs == true {
                
                if ItemBuy.frame.contains(CorrectedLocation) {
                    
                    if Player.Gold >= 50 {
                        
                        Player.ItemIs = true
                        Player.Gold = Player.Gold - 50
                        Status_Gold.text = "\(Player.Gold)"
                        
                        Data_Save_Status()
                    }
                    
                } else {
                    
                    ShopBox.removeFromParent()
                    ShopIs = false
                }

            } else {
            
                if Location.x < LocalCamera.position.x {
                    
                    ControlBase.position = CorrectedLocation
                    ControlBall.position = ControlBase.position
                    
                } else {
                    
                    if AttackButtonBase.frame.contains(CorrectedLocation) {
                        
                        if Player.AttackDelayIs == false {
                            
                            Player.Attack_Melee()
                            Player.Function_DelayEffect(Button: "AttackButton", Delay: 0.5)
                        }
                        
                    } else if ItemButtonBase.frame.contains(CorrectedLocation) {
                        
                        Player.Function_Item()
                        
                    } else if SkillButtonBase.frame.contains(CorrectedLocation) {
                        
                        if Player.SkillDelayIs == false {
                            
                            Player.Attack_Meteor()
                            Player.Function_DelayEffect(Button: "SkillButton", Delay: 5)
                        }
                    }
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in (touches) {
            
            let Location = touch.location(in: self)
            
            var CorrectedLocation = CGPoint()
            CorrectedLocation.x = Location.x - LocalCamera.position.x
            CorrectedLocation.y = Location.y - LocalCamera.position.y
            
            if Location.x < LocalCamera.position.x {
                
                let DeltaX = CorrectedLocation.x - ControlBase.position.x
                let DeltaY = CorrectedLocation.y - ControlBall.position.y
                let Angle = atan2(DeltaY, DeltaX)
                let Degree = Angle * CGFloat(180 / Double.pi)
                
                ControlBallAngle(Degree: Degree)
                
                let Lenght = ControlBase.frame.size.height / 2
                let DistanceX = cos(Angle) * Lenght
                let DistanceY = sin(Angle) * Lenght
                
                if ControlBase.frame.contains(CorrectedLocation) {
                    
                    ControlBall.position = CorrectedLocation
                    
                } else {
                    
                    ControlBall.position = CGPoint(x: ControlBase.position.x + DistanceX, y: ControlBase.position.y + DistanceY)
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in (touches) {
            
            let Location = touch.location(in: self)
            
            if Location.x < LocalCamera.position.x {
                
                let MoveCenterAction = SKAction.move(to: ControlBase.position, duration: 0.2)
                MoveCenterAction.timingMode = .easeOut
                
                ControlBall.run(MoveCenterAction)
                Player.CurrentDirection = Direction.ST
            }
        }
    }
// Touch_End


}
