//作者：冼树华
//QQ:  56472465ay

import UIKit

//1.计算属性的扩展(换算为米)
extension Double{
    var 公里: Double { return self * 1_000.0 }
    var 米: Double { return self }
    var 厘米: Double { return self / 100.0  }
    var 毫米: Double { return self / 1_000.0 }
    
}

let 姚明身高 = 226.0.厘米
print("姚明身高是：\(姚明身高)米")
let 每天跑步 = 3.5.公里
print("老镇为了减肥，每天跑步：\(每天跑步)米")
// 走路150米 + 坐车 7.5公里
let 上班距离 = 150.米 + 7.5.公里
print("华仔从家里到公司距离是：\(上班距离)米")


//2.构造函数扩展
struct  武器 {
    var 攻击力 = 0, 命中率 = 0
}
struct 防具 {
    var 防御力 = 0, 闪避率 = 0
}
struct 角色 {
    var 装备武器 = 武器()
    var 装备防具 = 防具()
}
let 西门吹水 = 角色()
print("西门吹水：\(西门吹水)")
let 小李飞镖 = 角色(装备武器: 武器(攻击力: 100, 命中率: 300), 装备防具: 防具(防御力: 200, 闪避率: 400))
print("小李飞镖：\(小李飞镖)")

//扩展构造函数：(又是人民币玩家....)
extension 角色{
    init(带上武器: 武器, 穿上防具: 防具){
        let 实际攻击力 = 带上武器.攻击力 + (穿上防具.防御力 / 10)
        let 实际命中率 = 带上武器.命中率 + (穿上防具.闪避率 / 10)
        self.init(装备武器: 武器(攻击力: 实际攻击力, 命中率: 实际命中率), 装备防具: 穿上防具)
    }
}
let 孤独求败 = 角色(带上武器: 武器(攻击力: 100, 命中率: 300), 穿上防具: 防具(防御力: 200, 闪避率: 400))
print("孤独求败：\(孤独求败)")


//3.方法的扩展
//1)添加新的实例方法（ 不能修改结构体或枚举的 self或其他属性）
extension Int{
    //闭包
    func 重复打印(打印: () -> Void){
        for _ in 0..<self{
            打印()
        }
    }
}
3.重复打印({ print("希达猫") })
3.重复打印{ print("一起学雨燕2.0！") }

//2)添加新的变异方法（作用于结构体和枚举中，要修改self或其他属性的时候）
extension Int{
    mutating func square(){
        //print("\(self)的平方是：", appendNewline: false  )
        print("\(self)的平方是：", terminator: "")
        self = self * self
        print("\(self)")
    }
}
var 三 = 3
三.square()


//4.下标的扩展
extension Int{
    subscript(var 绩效: Int) ->Int {
        var 绩效工资 = 绩效 > 0 ? 1000 : 0
        while 绩效 > 0 {
            绩效工资 += 100
            --绩效
        }
        return self + 绩效工资
    }
}
print("小波8月份工资：\(20000[1])")
print("老镇8月份工资：\(10000[0])")
print("雨琪8月份工资：\(15000[3])")


//5.嵌套类型的扩展
extension Int{
    enum 数字枚举{
        case 负数,零,正数
    }
    
    var 判断数字: 数字枚举{
        switch self{
            case 0: return .零
            case let x where x > 0: return .正数
            default: return .负数
        }
    }
}

func 打印判断数字的符号(数组: [Int]){
    for 数字 in 数组{
        switch 数字.判断数字{
            //case .负数: print("- ", appendNewline: false)
            //case .零: print("0 ", appendNewline: false)
            //case .正数: print("+ ", appendNewline: false)
            case .负数: print("- ", terminator: "")
            case .零: print("0 ", terminator: "")
            case .正数: print("+ ", terminator: "")
        }
    }
}
打印判断数字的符号([3, 7, -24, 0, -8, 0, 11])


















