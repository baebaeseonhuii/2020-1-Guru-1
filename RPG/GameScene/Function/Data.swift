import SpriteKit
import GameplayKit

extension GameScene {
    
// MARK: - Player
    func Data_Player() {
        
        let Data = GameData["Player"] as! [String:Any]
        let Sort = Data["Sort"] as! String
        let Costume = Data["Costume"] as! String
        let AT = Data["AT"] as! CGFloat
        let DF = Data["DF"] as! CGFloat
        let Luck = Data["Luck"] as! CGFloat
        let SP = Data["SP"] as! CGFloat
        let HP = Data["HP"] as! CGFloat

        Player = Character(imageNamed: "RedSwan")
        Player.Sort = Sort
        Player.Costume = Costume
        Player.AT = AT
        Player.DF = DF
        Player.Luck = Luck
        Player.SP = SP
        Player.HP = HP
        Player.CurrentHP = HP
        Player.LV = 1
        Player.EXP = 0
        Player.zPosition = 10
        Player.Function_HealthBar()
        Player.PhysicsBody_Player()

        self.addChild(Player)
        
        PlayerMinion = Character(color: UIColor.green, size: CGSize(width: 5, height: 5))
        
        MiniMap.addChild(PlayerMinion)
    }
// Player_End
    
    
// MARK: - Monster
    func Data_Monster() {
        
        let MonsterGroupData = CurrentMapData["MonsterGroup"] as? [String:Any] ?? [String:Any]()
        
        var Number = Int(0)
        
        for (_, value) in MonsterGroupData {
            
            let Data = value as! [String:Any]
            let PositionX = Data["PositionX"] as! CGFloat
            let PositionY = Data["PositionY"] as! CGFloat
            let Sort = Data["Sort"] as! String
            let Class = Data["Class"] as! String
            let Costume = Data["Costume"] as! String
            let AT = Data["AT"] as! CGFloat
            let DF = Data["DF"] as! CGFloat
            let Luck = Data["Luck"] as! CGFloat
            let SP = Data["SP"] as! CGFloat
            let HP = Data["HP"] as! CGFloat
            let EXP = Data["EXP"] as! CGFloat
            let SearchRange = Data["SearchRange"] as! CGFloat
            let AttackRange = Data["AttackRange"] as! CGFloat
            
            Monster = Character(imageNamed: "Archer")
            Monster.PositionX = PositionX
            Monster.PositionY = PositionY
            Monster.Sort = Sort
            Monster.Class = Class
            Monster.Costume = Costume
            Monster.AT = AT
            Monster.DF = DF
            Monster.Luck = Luck
            Monster.SP = SP
            Monster.RunSP = SP
            Monster.HP = HP
            Monster.CurrentHP = HP
            Monster.EXP = EXP
            Monster.SearchRange = SearchRange
            Monster.AttackRange = AttackRange
            Monster.Number = Number
            Monster.position = CGPoint(x: PositionX, y: PositionY)
            Monster.zPosition = 10
            Monster.Function_HealthBar()
            Monster.PhysicsBody_Monster()
            
            MonsterGroup.append(Monster)

            self.addChild(Monster)
            
            MonsterMinion = Character(color: UIColor.red, size: CGSize(width: 5, height: 5))
            MonsterMinion.Number = Number
            
            MonsterMinionGroup.append(MonsterMinion)
            
            MiniMap.addChild(MonsterMinion)
            
            Number += 1
        }
    }
// Monster_End

    
    // MARK: - NPC
        func Data_NPC() {
            
            let NPCGroupData = CurrentMapData["NPCGroup"] as? [String:Any] ?? [String:Any]()
            
            
            for (_, value) in NPCGroupData {
                
                let Data = value as! [String:Any]
                let PositionX = Data["PositionX"] as! CGFloat
                let PositionY = Data["PositionY"] as! CGFloat
                let Costume = Data["Costume"] as! String
                let MSGArray = Data["MSGArray"] as! [String]

                
                NPC = Character(imageNamed: "NPC")
                NPC.PositionX = PositionX
                NPC.PositionY = PositionY
                NPC.Costume = Costume
                NPC.MSGArray = MSGArray
                NPC.position = CGPoint(x: PositionX, y: PositionY)
                NPC.zPosition = 11
                NPC.PhysicsBody_NPC()
                
                NPCGroup.append(NPC)

                self.addChild(NPC)
                
                NPCMinion = Character(color: UIColor.yellow, size: CGSize(width: 5, height: 5))
                
                NPCMinionGroup.append(NPCMinion)
                
                MiniMap.addChild(NPCMinion)
            }
        }
    // NPC_End
    
    
    
// MARK: - Obejct
    func Data_Object() {
        
        let ObjectGroupData = CurrentMapData["ObjectGroup"] as? [String:Any] ?? [String:Any]()
                
        for (_, value) in ObjectGroupData {
            
            let Data = value as! [String:Any]
            let Costume = Data["Costume"] as! String
            let PositionX = Data["PositionX"] as! CGFloat
            let PositionY = Data["PositionY"] as! CGFloat
            
            Object = Field(imageNamed: Costume)
            Object.Costume = Costume
            Object.position = CGPoint(x: PositionX, y: PositionY)
            Object.zPosition = 10
            Object.PhysicsBody_Object()
            
            ObjectGroup.append(Object)

            self.addChild(Object)
            
            ObjectMinion = Field(color: UIColor.gray, size: CGSize(width: 5, height: 5))
            
            ObjectMinionGroup.append(ObjectMinion)
            
            MiniMap.addChild(ObjectMinion)
        }
    }
// Object_End
    
    
// MARK: - Portal
    func Data_Portal() {
        
        let PortalData = CurrentMapData["Portal"] as! [String:Any]
        
        let PositionX = PortalData["PositionX"] as! CGFloat
        let PositionY = PortalData["PositionY"] as! CGFloat
        let Destination = PortalData["Destination"] as! String
        
        Portal = Field(imageNamed: "Portal")
        Portal.Destination = Destination
        Portal.position = CGPoint(x: PositionX, y: PositionY)
        Portal.zPosition = 0

        Portal.PhysicsBody_Portal()
        
        self.addChild(Portal)
        
        PortalMinion = Field(color: UIColor.blue, size: CGSize(width: 5, height: 5))
        
        MiniMap.addChild(PortalMinion)
    }
// Portal_End
    
    
// MARK: - Save Current Map
    func Data_Save_CurrentMap() {
        
        NSDefault.set(CurrentMap, forKey: "CurrentMap")
    }
// Save Current Map
    

// MARK: - Save Status
    func Data_Save_Status() {
        
        StatusData["Gold"] = Player.Gold
        StatusData["LV"] = Player.LV
        StatusData["EXP"] = Player.EXP
        StatusData["HP"] = Player.HP
        StatusData["CurrentHP"] = Player.CurrentHP
        StatusData["ItemIs"] = Player.ItemIs

        NSDefault.set(StatusData, forKey: "StatusData")
    }
// Save Status_End
    
    
// MARK: - Load Status
    func Data_Load_Status() {
        
        StatusData = NSDefault.object(forKey:  "StatusData") as? [String:Any] ?? [String:Any]()
        
        if StatusData.count != 0 {
            
            Player.Gold = StatusData["Gold"] as? Int ?? Int()
            Player.LV = StatusData["LV"]  as? CGFloat ?? CGFloat()
            Player.EXP = StatusData["EXP"]  as? CGFloat ?? CGFloat()
            Player.HP = StatusData["HP"]  as? CGFloat ?? CGFloat()
            Player.CurrentHP = StatusData["CurrentHP"]  as? CGFloat ?? CGFloat()
            Player.ItemIs = StatusData["ItemIs"] as? Bool ?? Bool(false)

        }
    }
// Load Status_End
    
    
}
