//
//  GameViewController.swift
//  RPG
//
//  Created by Hoonyong Lee on 12/5/19.
//  Copyright © 2019 IceArrow. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
// MARK: - Variable
    var CurrentMap = String()
// Variable_End
    

// MARK: - Status Bar
    override var prefersStatusBarHidden: Bool { return true }
// Status Bar_End
    
    
// MARK: - Rotation & Orientation
    override var shouldAutorotate: Bool { return true }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        
         if UIDevice.current.userInterfaceIdiom == .phone {
            
             return .allButUpsideDown
            
         } else {
            
             return .all
         }
     }
// Roatation & Orientation_End

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CurrentMap = NSDefault.object(forKey: "CurrentMap") as? String ?? String()
        
        if CurrentMap == "" { CurrentMap = "Village" }
        
        Scene = GameScene(fileNamed: CurrentMap)!
        Scene.CurrentMap = CurrentMap
        Scene.scaleMode = .aspectFill
        
        let View = self.view as! SKView
        View.presentScene(Scene)
        View.ignoresSiblingOrder = true
        View.showsFPS = true
        View.showsNodeCount = false
        View.showsPhysics = false
    }


}
