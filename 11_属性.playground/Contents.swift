//作者：冼树华
//QQ:  56472465

import UIKit

//1.普通存储属性
class 选手 {
    let ID: String = "XXOO"
    var 得分: Int = 100
}

let 张学明 = 选手()
print("张学明的ID是：\(张学明.ID)，得分是：\(张学明.得分)")
张学明.得分 = 90
print("修改后张学名的得分为：\(张学明.得分)")





//1.lazy加载类，延迟加载类，使用时才初始化，对性能有帮助
class 地图类{
    var 文件名 = "死亡沙漠.map"
}

class 角色类{
    lazy var 打怪地图 = 地图类()           //延迟创建对象
    var 上线 = true
}

let 法师 = 角色类()
print("法师到了 \(法师.打怪地图.文件名)")    //使用时才创建实际对象

//3.get,set



struct 坐标{
    var x = 0, y = 0
}
struct 步伐 {
    var walk = 0, run = 0
}

struct 人物斜上移动 {
    var 人物坐标 = 坐标()
    var 人物步伐 = 步伐()
    
    var 走坐标: 坐标{
        get{
            let newX = 人物坐标.x + 人物步伐.walk
            let newY = 人物坐标.y + 人物步伐.walk
            
            return 坐标(x: newX, y: newY)
        }
        set{
            人物坐标.x = newValue.x - 人物步伐.walk
            人物坐标.y = newValue.y - 人物步伐.walk
        }
    }
}
var 某次移动 = 人物斜上移动(人物坐标: 坐标(), 人物步伐: 步伐(walk: 10, run: 20))
print("第一次移动后的坐标：x: \(某次移动.走坐标.x)，y:\(某次移动.走坐标.y)")
print("第一次移动后的人物坐标：x: \(某次移动.人物坐标.x)，y:\(某次移动.人物坐标.y)")

某次移动.走坐标 = 坐标(x: 30, y: 30)
print("再一次移动后的坐标：x: \(某次移动.走坐标.x)，y:\(某次移动.走坐标.y)")
print("再一次移动后的人物坐标：x: \(某次移动.人物坐标.x)，y:\(某次移动.人物坐标.y)")

struct 战士 {
    var 武器攻击力 = 0, 头盔攻击力 = 0, 戒指攻击力 = 0, 盔甲攻击力 = 0
    var 经验倍数 = 1
    var 总攻击力 : Int{
        return 经验倍数 * (武器攻击力 + 头盔攻击力 + 戒指攻击力 + 盔甲攻击力)
    }
}
let 发思特战士 = 战士(武器攻击力: 30, 头盔攻击力: 2, 戒指攻击力: 4, 盔甲攻击力: 10, 经验倍数: 3)
print("发思特战士的总攻击力：\(发思特战士.总攻击力)")

//4.属性监视器
class 经验计算{
    var 总经验 : Int = 0{
        willSet{
            //print("当前经验是：\(newValue)，",false)
            print("当前经验是：\(newValue)，",terminator:"")
        }
        didSet{
            print("增加经验\(总经验 - oldValue)")
        }
    }
}
var MU游戏经验计算 = 经验计算()
MU游戏经验计算.总经验 = 1000
MU游戏经验计算.总经验 = 1200
MU游戏经验计算.总经验 = 1200

//4.静态属性
struct 背包{
    static var 最大负载 = 300
    var 牌子 : String = "优秀衣库"
}
背包.最大负载 = 600
print("华仔的背包的最大负载是：\(背包.最大负载)" )
