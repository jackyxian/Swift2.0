//作者：冼树华
//QQ:  56472465

import UIKit

//1.对属性的规定
protocol 一些协议{
    var 可读写属性: Int { get set }
    var 只读属性: Int { get }
}
protocol 另外的协议{
    static var 一些类型属性: Int { get set }
}


protocol 全名{
    var 姓名: String { get }
}

struct 人: 全名 {
    var 姓名: String
}
let 欧阳风 = 人(姓名: "欧阳风")
print("这个人的姓名：\(欧阳风.姓名)")

class 演员: 全名 {
    var 姓: String?
    var 名: String
    
    init(姓: String? = nil, 名: String){
        self.姓 = 姓
        self.名 = 名
    }
    
    var 姓名: String{
        return (姓 != nil ? 姓! : "") + 名
    }
}
var 上官无我 = 演员(姓: "上官", 名: "无我")
print("这个演员的姓名：\(上官无我.姓名)")



//2.对方法的规定
protocol 静态方法协议{
    static func 一些静态方法()
}

protocol 随机协议{
    func 随机方法() -> Double
}


class 随机类: 随机协议 {
    var 随机数 = Double(arc4random())
    func 随机方法() -> Double{
        return 随机数
    }
}
var 随机 = 随机类()
print("随机数是：\(随机.随机数)")

//变异方法：
protocol 开关协议{
    mutating func 转换开关()
}

enum 开关枚举: 开关协议{
    case 开,关
    mutating func 转换开关() {
        switch self{
            case .开: self = .关; print("转换后门是：\(self)")
            case .关: self = .开; print("转换后门是：\(self)")

        }
    }
}
var 门 = 开关枚举.关
print("当前的门是：\(门)")
门.转换开关()



//3.对构造函数的规定
protocol SomeProtocol1 {
    init(someParameter: Int)
}
class SomeClass1: SomeProtocol1 {
    required init(someParameter: Int) {
        //实现协议的构造函数的代码
    }
}


protocol SomeProtocol2 {
    init()
}

class SomeSuperClass2 {
    init() {
        //父类的初始化方法
    }
}
class SomeSubClass2: SomeSuperClass2, SomeProtocol2 {
    // "required"用来对协议 SomeProtocol2 的实现; "override" 用来重写父类 SomeSuperClass2
    required override init() {
        //实现协议和重写父类的构造函数的代码
    }
}



//4.协议类型
class 浮点数随机{
    let 附加值: Double
    var 随机数: 随机协议
    
    init(附加值:Double, 随机数: 随机协议){
        self.附加值 = 附加值
        self.随机数 = 随机数
    }
    
    func 获取随机数()-> Double{
        return 随机数.随机方法() + 附加值
    }
}

var 数据 = 浮点数随机(附加值: 10, 随机数: 随机类())
print("浮点随机数是：\(数据.获取随机数())")



//5.代理

//1)角色类
class 角色{
    var 名称: String
    var 攻击力: Int
    var 防御力: Int
    
    init(名称: String, 攻击力: Int, 防御力: Int){
        self.名称 = 名称
        self.攻击力 = 攻击力
        self.防御力 = 防御力
    }
    
}

//2)游戏协议
protocol 游戏{
    var 游戏角色: 角色{ get }
    func 玩游戏()
}

//3)动作游戏代理协议
protocol 动作游戏代理{
    func 开始游戏(动作游戏: 游戏) -> Int
    func 打怪升级(动作游戏: 游戏, 游戏中使用道具 经验加倍: Bool) -> Int
    func 结束游戏(动作游戏: 游戏) -> Int
}

//4)实现动作游戏协议
class 代理练级: 动作游戏代理 {
    func 开始游戏(网络游戏: 游戏) -> Int {
        print("\(网络游戏.游戏角色.名称) 开始游戏，就获得经验1000")
        return 1000
    }
    
    func 打怪升级(网络游戏: 游戏, 游戏中使用道具 经验加倍: Bool) -> Int {
        if(经验加倍){
            print("\(网络游戏.游戏角色.名称) 在水帘洞推倒大圣，开启经验加倍，获得经验5000")
            return 5000
        }else{
            print("\(网络游戏.游戏角色.名称) 在水帘洞推倒大圣，屌丝玩家，只能获得经验2500")
            return 2500
        }
    }
    
    func 结束游戏(网络游戏: 游戏) -> Int {
        print("\(网络游戏.游戏角色.名称) 结束打怪，抽奖获得经验500")
        return 500
    }
    
}



//5)实现游戏协议
class 动作游戏: 游戏 {
    // 实现协议的属性
    let 游戏角色 = 角色(名称: "无心法师", 攻击力: 300, 防御力: 100)
    
    // 定义一个协议类型，代理游戏
    var 代理游戏: 动作游戏代理?
    var 经验值 = 0
    
    // 实现协议的方法
    func 玩游戏(){
        经验值 += 代理游戏!.开始游戏(self)
        经验值 += 代理游戏!.打怪升级(self, 游戏中使用道具: true)
        经验值 += 代理游戏!.结束游戏(self)
        print("代练完毕，一共获得经验\(经验值)")
    }
    
}


//6)创建实例调用
let 代练小陈 = 代理练级()
let 太极熊猫 = 动作游戏()
太极熊猫.代理游戏 = 代练小陈
太极熊猫.玩游戏()




//6. 在扩展中添加协议
protocol 结果展示{
    func 显示名称() -> String
}

extension 动作游戏: 结果展示{
    func 显示名称() -> String {
        return 游戏角色.名称
    }
}

let 扩展动作游戏 = 动作游戏()
print(扩展动作游戏.显示名称())




//7.协议类型的集合
extension 代理练级: 结果展示{
    func 显示名称() -> String {
        return "代理练级"
    }
}
extension 角色: 结果展示{
    func 显示名称() -> String{
        return self.名称
    }
}
let 扩展代理练级 = 代理练级()
let 扩展角色 = 角色(名称: "周公", 攻击力: 400, 防御力: 300)


let 名称集合: [结果展示] = [扩展动作游戏,扩展代理练级,扩展角色]
for 名称 in 名称集合{
    print(名称.显示名称())
}




//8.协议的继承

//protocol InheritingProtocol: SomeProtocol1, AnotherProtocol1 {
//    // 实现协议的代码
//}

protocol 显示内容: 结果展示{
    func 获取经验() ->String
}

extension 动作游戏: 显示内容{
    func 获取经验() -> String {
        let 输出 = 显示名称() + "获取了 \(self.经验值) 经验值"
        return 输出
    }
}
let 扩展动作游戏2 = 动作游戏()
扩展动作游戏2.经验值 = 9999
print(扩展动作游戏2.获取经验())



//9.协议类型的组合
protocol 姓名协议{
    var 姓名: String { get }
}
protocol 年龄协议{
    var 年龄: Int { get }
}
struct 人员: 姓名协议,年龄协议 {
    var 姓名: String
    var 年龄: Int
}
func 生日(相关人员: protocol<姓名协议,年龄协议>){
    print("\(相关人员.姓名) 祝您 \(相关人员.年龄) 岁生日快乐！")
}

let 生日人员 = 人员(姓名: "郭碧停", 年龄: 24)
生日(生日人员)



//10.检查协议的一致性
protocol 下厨{
    var 做粤菜: String {get}
}

class 白领:下厨 {
    var 姓名: String
    init(姓名: String){
        self.姓名 = 姓名
    }
    var 做粤菜: String { return "\(姓名) 在做：扬州炒饭" }
}
class 蓝领: 下厨 {
    var 姓名: String
    init(姓名: String){
        self.姓名 = 姓名
    }

    var 做粤菜: String { return "\(姓名) 在做：清蒸鲈鱼" }
}
class IT人员 {
    var 姓名: String
    init(姓名: String){
        self.姓名 = 姓名
    }

    var 做粤菜: String { return "\(姓名) 外卖：尖椒炒肉" }
}

let 写字楼人员: [AnyObject] = [白领(姓名: "小波"),蓝领(姓名: "华仔"),IT人员(姓名: "希达")]
for 人员 in 写字楼人员{
    if let 做菜人员 = 人员 as? 下厨{
        print(做菜人员.做粤菜)
    }else{
        print("IT人远只能叫外卖了！")
    }
}














































