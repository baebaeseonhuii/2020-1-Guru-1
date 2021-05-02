import SpriteKit
import GameplayKit

extension GameScene {
    
    func GameOver() {
        
        GameOverIs = true
        
        let GameOverLabel = SKLabelNode(fontNamed: "04b_19")
        
        GameOverLabel.text = "Game Over"
        GameOverLabel.fontColor = UIColor.white
        GameOverLabel.fontSize = 100
        GameOverLabel.position = LocalCamera.position
        GameOverLabel.zPosition = 200
        
        self.addChild(GameOverLabel)
    }


}
