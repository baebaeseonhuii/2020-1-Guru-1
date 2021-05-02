import SpriteKit
import GameplayKit

extension Character {
    
    // MSG //
    func NPC_MSG() {
        
        if Scene.MSGIs == false {
            
            if Scene.MSGArray.count != 0 {
                
                Scene.MSGBox = SKSpriteNode(color: UIColor.black, size: CGSize(width: Scene.frame.width - 20, height: Scene.frame.height / 5))
                Scene.MSGBox.position = CGPoint(x: 0, y: (Scene.MSGBox.frame.height / 2) - (Scene.frame.height / 2) + 10)
                Scene.MSGBox.zPosition = 200
                
                let NPCMSG = SKLabelNode(fontNamed: "04b_19")
                NPCMSG.text = Scene.MSGArray[0]
                
                Scene.MSGBox.addChild(NPCMSG)
                Scene.LocalCamera.addChild(Scene.MSGBox)
                Scene.MSGIs = true
            }
        }
    }
    
    // Shop //
    func NPC_Shop() {
        
        if Scene.ShopIs == false {
            
            Scene.ShopBox = SKSpriteNode(color: UIColor.black, size: CGSize(width: Scene.frame.width * 0.3, height: Scene.frame.height * 0.2))
            Scene.ShopBox.position = CGPoint.zero
            Scene.ShopBox.zPosition = 200
            
            // Gold //
            let GoldMSG = SKLabelNode(fontNamed: "04b_19")
            GoldMSG.text = "50 Cleaning Point"
            GoldMSG.position = CGPoint(x: Scene.ShopBox.frame.width / 2.8 - GoldMSG.frame.width / 2 - 10, y: -GoldMSG.frame.height / 2)
            Scene.ShopBox.addChild(GoldMSG)
            
            
            // Item //
            Scene.ItemBuy = SKSpriteNode(imageNamed: "ItemButton")
            Scene.ItemBuy.position = CGPoint.zero
            Scene.ItemBuy.alpha = 0.5
            
            Scene.ShopBox.addChild(Scene.ItemBuy)
            Scene.LocalCamera.addChild(Scene.ShopBox)
            Scene.ShopIs = true
        }
    }
    

}

