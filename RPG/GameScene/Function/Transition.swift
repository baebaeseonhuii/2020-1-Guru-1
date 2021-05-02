import SpriteKit
import GameplayKit

extension GameScene {

    func Transition(Destination: String) {
        
        Data_Save_Status()
        
        let Scene = GameScene(fileNamed: Destination)
        Scene?.CurrentMap = Destination
        Scene?.scaleMode = .aspectFill
        
        let Transition = SKTransition.fade(with: UIColor.black, duration: 1)
        self.view?.presentScene(Scene!, transition: Transition)
    }

    
}
