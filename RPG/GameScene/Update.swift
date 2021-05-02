
import SpriteKit
import GameplayKit

extension GameScene {
    
// MARK: - Update
    override func update(_ currentTime: TimeInterval) {
        
        if GameOverIs == false {
            
// MARK: Player
                    Player.Function_Move()
                    
                    // Health Point //
                    if Player.CurrentHP < 0 {
                        
                        Player.CurrentHP = 0
                    }
                    
                    Player.childNode(withName: "HP")?.xScale = Player.CurrentHP / Player.HP
                    
                    
                    // Mini Map //
                    PlayerMinion.position = CGPoint.zero
            
                    // Item //
                    if Player.ItemIs == true {
                
                        Scene.ItemButton.alpha = 1
                
                    } else if Player.ItemIs == false {
                    
                        Scene.ItemButton.alpha = 1
                    }
// Player_End
                    
                    
// MARK: - Monster
                    if MonsterGroup.count != 0 {
                        
                        // Update //
                        for i in 0...MonsterGroup.count - 1 {
                            
                            MonsterGroup[i].Update_Monster()
                        }
                        
                        
                        // Health Point //
                        for i in 0...MonsterGroup.count - 1 {
                            
                            if MonsterGroup[i].CurrentHP < 0 {
                                
                                MonsterGroup[i].CurrentHP = 0
                            }
                            
                            MonsterGroup[i].childNode(withName: "HP")?.xScale = MonsterGroup[i].CurrentHP / MonsterGroup[i].HP
                        }

                        
                        // Mini Map //
                        for i in 0...MonsterMinionGroup.count - 1 {
                            
                            MonsterMinionGroup[i].position.x = (MonsterGroup[i].position.x - Player.position.x) / 10
                            MonsterMinionGroup[i].position.y = (MonsterGroup[i].position.y - Player.position.y) / 10

                            if MiniMap.intersects(MonsterMinionGroup[i]) {
                                
                                MonsterMinionGroup[i].alpha = 1
                                
                            } else {
                                
                                MonsterMinionGroup[i].alpha = 0
                            }
                        }

                    }
// Monster_End
   
            
// MARK: - NPC
                    if NPCGroup.count != 0 {
                                 
                        // Mini Map //
                        for i in 0...NPCMinionGroup.count - 1 {
                                        
                            NPCMinionGroup[i].position.x = (NPCGroup[i].position.x - Player.position.x) / 10
                            NPCMinionGroup[i].position.y = (NPCGroup[i].position.y - Player.position.y) / 10

                            if MiniMap.intersects(NPCMinionGroup[i]) {
                                            
                                NPCMinionGroup[i].alpha = 1
                                            
                            } else {
                                            
                                NPCMinionGroup[i].alpha = 0
                            }
                        }

                    }
// NPC_End
            
// MARK: - Object
                    if ObjectMinionGroup.count != 0 {
                        
                        // Mini Map //
                        for i in 0...ObjectMinionGroup.count - 1 {
                            
                            ObjectMinionGroup[i].position.x = (ObjectGroup[i].position.x - Player.position.x) / 10
                            ObjectMinionGroup[i].position.y = (ObjectGroup[i].position.y - Player.position.y) / 10

                            if MiniMap.intersects(ObjectMinionGroup[i]) {
                                
                                ObjectMinionGroup[i].alpha = 1
                                
                            } else {
                                
                                ObjectMinionGroup[i].alpha = 0
                            }
                        }
                    }
            }
// Object_End
                    

// MARK: - Field
                    
                    // Camera //
                    LocalCamera.position = Player.position
                    
                    
                    // Portal //
                    PortalMinion.position.x = (Portal.position.x - Player.position.x) / 10
                    PortalMinion.position.y = (Portal.position.y - Player.position.y) / 10
        
                    if MiniMap.intersects(PortalMinion) {
                        
                        PortalMinion.alpha = 1
                        
                    } else {
                        
                        PortalMinion.alpha = 0
                    }
// Field_End
                }
// Update_End

    
}
