import SpriteKit
import GameplayKit

extension Character {
    
    func Function_DelayEffect(Button: String, Delay: CGFloat) {
        
        // Circle //
        let Radius = CGFloat(46.6)
        let Circle = SKShapeNode(circleOfRadius: Radius)
        Circle.zPosition = 101
        Circle.zRotation = CGFloat.pi / 2
        Circle.fillColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.2)
        Circle.strokeColor = UIColor.clear
        
        if Button == "AttackButton" {
            
            Circle.position = Scene.AttackButton.position
            
        } else if Button == "SkillButton" {
            
            Circle.position = Scene.SkillButton.position
        }
        
        Scene.LocalCamera.addChild(Circle)
        
        
        // Animation //
        let Step = Int(360)
        let Interval = TimeInterval(Delay) / TimeInterval(Step)
        let Increment = 1 / CGFloat(Step)
        var Percent = CGFloat(1.0)
        
        let DelayAction = SKAction.run {
            
            Percent -= Increment
            
            // Shape //
            let StartAngle = CGFloat(0)
            let EndAngle = CGFloat.pi * 2 * Percent
            let Center = CGPoint.zero
            
            let BezeirPath = UIBezierPath()
            BezeirPath.move(to: Center)
            BezeirPath.addArc(withCenter: Center, radius: Radius, startAngle: StartAngle, endAngle: EndAngle, clockwise: true)
            BezeirPath.addLine(to: Center)
            
            Circle.path = BezeirPath.cgPath
        }
        
        let WaitAction = SKAction.wait(forDuration: Interval)
        
        Circle.run(SKAction.repeat(SKAction.sequence([DelayAction, WaitAction]), count: Step - 1)) {
            
            Circle.path = nil
            Circle.removeFromParent()
        }
    }


}
