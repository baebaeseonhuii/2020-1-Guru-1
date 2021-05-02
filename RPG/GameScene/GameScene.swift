
import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
// MARK: - Variable
    let LocalCamera = SKCameraNode()
    
    var GameData = NSMutableDictionary()
    var MapData = [String:Any]()
    var CurrentMapData = [String:Any]()
    var CurrentMap = String()
    var StatusData = [String:Any]()
    
    var Player = Character()
    var PlayerMinion = Character()
    
    var MonsterGroup = [Character]()
    var Monster = Character()
    var MonsterMinionGroup = [Character]()
    var MonsterMinion = Character()
    
    var NPCGroup = [Character]()
    var NPC = Character()
    var NPCMinionGroup = [Character]()
    var NPCMinion = Character()
    
    var MSGBox = SKSpriteNode()
    var MSGArray = [String]()
    
    var ShopBox = SKSpriteNode()
    var ItemBuy = SKSpriteNode()
    
    var ObjectGroup = [Field]()
    var Object = Field()
    var ObjectMinionGroup = [Field]()
    var ObjectMinion = Field()
    
    var Portal = Field()
    var PortalMinion = Field()
    
    var MiniMap = SKSpriteNode()
    
    let ControlBase = SKSpriteNode(imageNamed: "ControlBase")
    let ControlBall = SKSpriteNode(imageNamed: "ControlBall")
    let AttackButtonBase = SKSpriteNode(imageNamed: "ButtonBase")
    let AttackButton = SKSpriteNode(imageNamed: "AttackButton")
    let ItemButtonBase = SKSpriteNode(imageNamed: "ButtonBase")
    let ItemButton = SKSpriteNode(imageNamed: "ItemButton")
    let SkillButtonBase = SKSpriteNode(imageNamed: "ButtonBase")
    let SkillButton = SKSpriteNode(imageNamed: "SkillButton")
    
    var Status_LV = SKLabelNode(fontNamed: "04b_19")
    var Status_Gold = SKLabelNode(fontNamed: "04b_19")
    var Gold = SKSpriteNode(imageNamed: "Earth")
    
    var GameOverIs = Bool(false)
    var MSGIs = Bool(false)
    var ShopIs = Bool(false)
// Variable_End
    
    
    override func didMove(to view: SKView) {
        
        Scene = self
        self.physicsWorld.contactDelegate = self
        
        // Local Camera //
        self.camera = LocalCamera
        self.addChild(LocalCamera)
        
        
        // Controller //
        ControlBase.position = CGPoint(x: -500, y: -200)
        ControlBase.zPosition = 100
        ControlBase.alpha = 0.5
        LocalCamera.addChild(ControlBase)
        
        ControlBall.position = ControlBase.position
        ControlBall.zPosition = ControlBase.zPosition
        ControlBall.alpha = ControlBase.alpha
        LocalCamera.addChild(ControlBall)
        
        AttackButtonBase.position = CGPoint(x: 375, y: -125)
        AttackButtonBase.zPosition = 99
        AttackButtonBase.alpha = 0.5
        LocalCamera.addChild(AttackButtonBase)
        AttackButton.position = AttackButtonBase.position
        AttackButton.zPosition = 100
        AttackButton.alpha = 1
        LocalCamera.addChild(AttackButton)
        
        ItemButtonBase.position = CGPoint(x: 385, y: -300)
        ItemButtonBase.zPosition = 99
        ItemButtonBase.alpha = 0.5
        LocalCamera.addChild(ItemButtonBase)
        ItemButton.position = ItemButtonBase.position
        ItemButton.zPosition = 100
        ItemButton.alpha = 1
        LocalCamera.addChild(ItemButton)
        
        SkillButtonBase.position = CGPoint(x: 550, y: -200)
        SkillButtonBase.zPosition = 99
        SkillButtonBase.alpha = 0.5
        LocalCamera.addChild(SkillButtonBase)
        SkillButton.position = SkillButtonBase.position
        SkillButton.zPosition = 100
        SkillButton.alpha = 1
        LocalCamera.addChild(SkillButton)
        
        
        // Mini Map //
        MiniMap = SKSpriteNode(color: UIColor.black, size: CGSize(width: 200, height: 200))
        MiniMap.alpha = 0.7
        MiniMap.zPosition = 99
        MiniMap.position = CGPoint(x: (MiniMap.size.width / 2) - (view.frame.width) + 10, y: (view.frame.height) - (MiniMap.size.height / 2) - 10)
        LocalCamera.addChild(MiniMap)
        
        
        // Data //
        let Path = Bundle.main.path(forResource: "GameData", ofType: "plist")
        GameData = NSMutableDictionary(contentsOfFile: Path!)!
        MapData = GameData["Map"] as! [String:Any]
        CurrentMapData = MapData[CurrentMap] as! [String:Any]
        
        Data_Player()
        Data_Monster()
        Data_NPC()
        Data_Object()
        Data_Portal()
        
        Data_Save_CurrentMap()
        Data_Load_Status()
        
        
        // Gold //
        Gold.zPosition = 98
        Gold.position = CGPoint(x: view.frame.width - 100, y: view.frame.height - 35)
        LocalCamera.addChild(Gold)
        
        Status_Gold.zPosition = Gold.zPosition
        Status_Gold.position = CGPoint(x: Gold.position.x + Gold.size.width + 10, y: Gold.position.y - 10)
        Status_Gold.fontSize = 25
        Status_Gold.fontColor = UIColor.yellow
        Status_Gold.text = "\(Player.Gold)"
        LocalCamera.addChild(Status_Gold)
        
        
        // Level //
        Status_LV.zPosition = 98
        Status_LV.position = CGPoint(x: 0, y: view.frame.height - 50)
        Status_LV.fontSize = 30
        Status_LV.fontColor = UIColor(red: 255/255, green: 210/255, blue: 65/255, alpha: 1.0)
        Status_LV.text = "Level.\(Int(Player.LV))"
        LocalCamera.addChild(Status_LV)
    }


}
