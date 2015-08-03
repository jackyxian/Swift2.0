//作者：冼树华
//QQ:  56472465

import UIKit

//存储属性赋值
class 优衣库{
    //直接为属性赋值
    let 男主角:String = "陈老师"
    let 女主角:String
    init(){
        //同构构造函数为属性赋值
       女主角 = "兽兽"
    }
}
let 三元里优衣库 = 优衣库()
print("三元里的优衣库有男主角：\(三元里优衣库.男主角)，女主角：\(三元里优衣库.女主角)")

//不同名字同一参数类型和参数数量的构造器
class 试衣间温度{
    var 正常温度:Double = 26
    init(夏天升温 升温: Double){
        正常温度 += 升温
        print("夏天试衣间温度：\(正常温度)")
    }
    init(冬天降温 降温: Double){
        正常温度 -= 降温
        print("冬天试衣间温度：\(正常温度)")
    }
}
let 冬天试衣间温度 = 试衣间温度(冬天降温: 12)
let 夏天试衣间问题 = 试衣间温度(夏天升温: 11)

//类的默认构造函数
class 购物车{
    var 商品名称: String?
    var 数量 = 0
    var 是否购买 = false
}
let 我的购物车 = 购物车()
print("我的购物车里有商品：\(我的购物车.商品名称)")

//结构体默认构造函数
struct 试衣间{
    var 镜子: Int
    var 柜子: Int
    var 拖鞋: Int
}
let 优衣库试衣间 = 试衣间(镜子: 1, 柜子: 1, 拖鞋: 2)
print("优衣库试衣间有：镜子\(优衣库试衣间.镜子)个")
print("优衣库试衣间有：柜子\(优衣库试衣间.柜子)个")
print("优衣库试衣间有：拖鞋\(优衣库试衣间.拖鞋)个")


//值类型的构造函数代理
struct 语文{
    var 平时分 = 0, 考试分 = 0
}
struct 体育 {
    var 平时分 = 0, 考试分 = 0
}

struct 考试 {
    var 语文成绩 = 语文()
    var 体育成绩 = 体育()
    
    init(){print("这家伙平时逃课，也没有参与考试！")}
    init(语文成绩: 语文, 体育成绩: 体育){
        self.语文成绩 = 语文成绩
        self.体育成绩 = 体育成绩
        print("成绩是：\(self.语文成绩)，\(self.体育成绩)")
    }
    init(特招语文成绩:语文,体育成绩:体育){
        let 特招语文平时分 = 特招语文成绩.平时分 + 10
        let 特招语文考试分 = 特招语文成绩.考试分 + 10
        self.init(语文成绩: 语文(平时分: 特招语文平时分, 考试分: 特招语文考试分), 体育成绩: 体育成绩)
        print("特招生成绩是：\(self.语文成绩)，\(self.体育成绩)")
    }
}

//1.使用没参数的构造函数
let 波波考试 = 考试()

//2.使用自定义构造函数
let 老镇考试 = 考试(语文成绩: 语文(平时分: 90, 考试分: 80), 体育成绩: 体育(平时分: 80, 考试分: 70))

//3.使用代理构造函数
let 华仔考试 = 考试(特招语文成绩: 语文(平时分: 75, 考试分: 85), 体育成绩: 体育(平时分: 85, 考试分: 88))


//引用类型的初始化
class 车{
    var 轮子 = 0
    var 描述: String{
        return "\(轮子)个轮子"
    }
}
let 我的车 = 车()
print("我的车轮子：\(我的车.轮子)个")

class 自行车: 车 {
    //重写父类的构造函数
    override init(){
        //调用父类的构造函数
        super.init()
        轮子 = 2
    }
}
let 我的自行车 = 自行车()
print("我的自行车轮子：\(我的自行车.轮子)个")


//指定构造函数和便利函数的实战
class 食物{
    var 名称: String
    //父类的指定构造函数
    init(名称: String){
        self.名称 = 名称
    }
    //父类的便利构造函数
    convenience init(){
        self.init(名称: "没有名称")
    }
}
let 牛肉 = 食物()
print("食物的名称是：\(牛肉.名称)")


class 菜单:食物 {
    var 数量: Int
    //子类的指定构造函数
    init(名称: String, 数量: Int){
        self.数量 = 数量
        super.init(名称: 名称)  //调用父类构造函数
    }
    //子类的便利构造函数
    override convenience init(名称: String) {
        //调用自神的指定构造函数
        self.init(名称: 名称, 数量: 1)
    }
}
let 菜单项 = 菜单()
print("菜单是：\(菜单项.名称) 数量是：\(菜单项.数量)")
let 炒牛肉 = 菜单(名称: "炒牛肉")
print("菜单是：\(炒牛肉.名称) 数量是：\(炒牛肉.数量)")
let 煎鸡蛋 = 菜单(名称: "煎鸡蛋", 数量: 6)
print("菜单是：\(煎鸡蛋.名称) 数量是：\(煎鸡蛋.数量)")


class 采购车: 菜单 {
    var 是否购买 = false
    var 描述: String{
        var output = "\(名称)：\(数量)"
        output += 是否购买 ? " ✔":" ✘"
        return output
    }
}

var 早餐列表 = [
    采购车(),
    采购车(名称: "西多士"),
    采购车(名称: "鲜虾云吞", 数量: 8)
]

早餐列表[0].名称 = "鲜榨橙汁"
早餐列表[0].是否购买 = true
for 早餐 in 早餐列表{
    print(早餐.描述)
}



//结构体、枚举、类的可失败构造函数
struct 动物 {
    let 特别动物 : String
    init?(特别动物: String){
        if 特别动物.isEmpty{
            print("没有输入特别动物")
            return nil
        }
        self.特别动物 = 特别动物
        print("特别动物是：\(self.特别动物)")
    }
}
let 虎狮兽 = 动物(特别动物: "虎狮兽")
let 狮虎兽 = 动物(特别动物: "")

enum 工作日{
    case 周一,周二,周三,周四,周五
    init?(星期几: String){
        switch 星期几{
        case "星期一": self = .周一; print("\(星期几)是工作日, \(self)")
        case "星期二": self = .周一; print("\(星期几)是工作日, \(self)")
        case "星期三": self = .周一; print("\(星期几)是工作日, \(self)")
        case "星期四": self = .周一; print("\(星期几)是工作日, \(self)")
        case "星期五": self = .周一; print("\(星期几)是工作日, \(self)")
        default:
            print("\(星期几)不是工作日！");return nil
        }
    }
}
let 星期六 = 工作日(星期几: "星期六")
let 星期三 = 工作日(星期几: "星期三")

class 产品{
    let 名称: String!
    init?(名称: String){
        self.名称 = 名称
        if 名称.isEmpty{ print("没有产品名称！");return nil}
        print("产品名称：\(self.名称)")
    }
}
let 皮带 = 产品(名称: "")
let 内衣 = 产品(名称: "内衣")

//构造失败的传递
class 篮球:产品 {
    let 数量: Int!
    init?(名称:String, 数量:Int){
        self.数量 = 数量
        super.init(名称:名称)
        if 数量<1 { print("购物篮球数量不能小于1个！"); return nil }
        print("你购买的是\(名称)篮球，数量是：\(数量)个！")
    }
}
let SBS篮球 = 篮球(名称: "", 数量: 0)
let CBA篮球 = 篮球(名称: "CBA", 数量: 0)
let NBA篮球 = 篮球(名称: "NBA", 数量: 10)

//覆盖一个可失败的构造函数
class 档案{
    var 文件名: String?
    init(){}
    init?(文件名: String){
        self.文件名 = 文件名
        if 文件名.isEmpty { print("没有写文件名！"); return nil }
    }
}

class X档案: 档案 {
    override init() {
        super.init()
        self.文件名 = "XFile"
        print("文件名是：\(self.文件名!)")
    }
    override init?(文件名: String) {
        super.init()
        if 文件名.isEmpty{
            self.文件名 = "XFile"
        }else{
            self.文件名 = 文件名
        }
        print("文件名是：\(self.文件名!)")
    }
}

let 档案1 = 档案(文件名: "")
let 档案2 = X档案()
let 档案3 = X档案(文件名: "红头文件")




//必要构造函数
class 程序猿{
    required init(){
        print("每天写代码")
    }
}
class 安卓程序猿: 程序猿 {
    required init() {
        print("每天写安卓代码")
    }
}

let 男安卓程序猿 = 安卓程序猿()




//通过闭包和函数来设置属性的默认值
struct Checkerboard {
    let boardColors: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...10 {
            for j in 1...10 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
        }()
    func squareIsBlackAtRow(row: Int, column: Int) -> Bool {
        return boardColors[(row * 10) + column]
    }
}

let board = Checkerboard()
print(board.squareIsBlackAtRow(0, column: 1))
print(board.squareIsBlackAtRow(9, column: 9))




































