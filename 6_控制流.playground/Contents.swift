//作者：冼树华
//QQ:  56472465

import UIKit

//1.for in 循环，比其他语言的foreach in 更好用
//迭代出乘法口诀
for index in 1...5{
    print("\(index) 乘以5是：\(index * 5)")
}

//2.当不需要指数的时候，如上例的 index，我们使用 _代表不需要,这里，我们计算3的10次方是
let base = 3
let power = 10
var answer = 1

for _ in 1...power{
    answer *= base
}
print("\(base) 的 \(power) 次方是： \(answer)")

//3.迭代数组
let 美女组 = ["林志玲","明日花绮罗","唐嫣","陈静","朴智妍"]
for 美女 in 美女组{
    print("美女有：\(美女)")
}

//4.迭代字典
let 美女字典 = ["台湾":"林志玲","日本":"明日花绮罗","中国":"唐嫣","香港":"陈静","韩国":"朴智妍"]
for(地方,美女) in 美女字典{
    print("\(地方)有美女：\(美女)")
}

//5.迭代字符
for char in "你好，Swift!".characters{
    print(char)
}

//6.一般的for循环
var index: Int
for(index = 0;index<3;++index){
    print("index is \(index)")
}
print(index);

//----------------------while---------------------
var start = 0
var finish = 5
while start < finish {
    start++
    print("你好啊")
}

//----------------------doWhile---------------------
var begin = 0
var end = 5
repeat{
    begin++
    print("来跟华仔学习Swift2.0")
}while begin < end

//-------条件语句---------------
//if语句
//1.单个条件
let 温度 = 10
if 温度 == 10{
    print("还行啊，一点点冷")
}
//2.两个条件
if 温度 > 11{
    print("不算很冷")
}else {
    print("还是很冷呢")
}
//3.N个条件
if 温度 > 11{
    print("不算很冷")
} else if 温度 < 10{
    print("还是很冷呢")
}else {
    print("还行啊，一点点冷")
}


//----guard---用户登录例子
func login(person: [String: String]) {
    guard let name = person["name"] else {
        print("请输入账号！")
        return
    }
    
    print("你好 \(name)!", false)
    
    guard let passwd = person["password"] else {
        print("密码不正确不能登录系统！")
        return
    }
    
    print("正在登陆系统，用户名是:\(name)，密码是:\(passwd)")
}

login(["name" : "漩涡名人"])
login(["name" : "草帽小子", "password":"12345"])



//swift语句：
//1.可以多个值case，并且，可以不写break,这个默认会有，但是必须添加default值
let 动物 = "猴子"
switch 动物 {
case "猪","猴子","羊": print("你是\(动物)")  //不用加break
case "蛇","老鼠","鸡": print("你是\(动物)")
    //必须加默认值，要不然报错
default: print("默认你是\(动物)")
}


//2.数字的switch
let 年收入 = 150_000
switch 年收入{
case 30_000...60_000:print("码奴：工作一两年，租房混日子")
case 60_001...100_000: print("码农：工作三四年，租房，继续混日子")
case 100_001...200_000: print("IT民工：经理级别，基本无房，学会装B，生活压力大")
case 200_001...300_000: print("IT工程师：高级经理级别，有房贷，生活压力较大");
case 300_001...500_000: print("IT人才：各IT公司总监级别人物，有房有车，生活压力相对较小")
case 500_001...1000000: print("IT精英：各IT公司副总裁级别人物，包括COO、CTO等，大多为职业经理人，赚够前就跑。")
case 1_000_001...10_000_000: print("IT大哥：不缺钱，行业里的羡慕嫉妒恨")
case 10_000_001...100_000_000: print("IT领袖：任正非、马化腾、李彦宏、丁磊、马云等，包括期权股票以及投资理财等收入")
default:print("码畜：刚毕业，租房傻乐")
}

//3.元组的switch
var guess = ("大",5)
switch guess{
case ("大",6):print("开大，点数是6")
case ("大",5):print("开大，点数是5")
case ("大",4):print("开大，点数是4")
case ("小",3):print("开大，点数是3")
case ("小",2):print("开大，点数是2")
case ("小",1):print("开大，点数是1")
default:("没点，通杀")
}

//4.元组的值绑定
guess = ("小",3)
switch guess{
case (let x, 6):print("开\(x)，点数是6")
case ("大",let y):print("开大，点数是\(y)")
case let(x,y):print("开\(x)，点数是\(y)")
}

//5.元组的值比较
guess = ("通杀",0)
switch guess{
case let(x,y) where y>3 : print("开\(x)，点数是：\(y)")
case let(x,y) where 0<y : print("开\(x)，点数是：\(y)")
default :print("没点，通杀")
}

//----控制转移语句

//1.continue
let puzzleInput = "we are study swift2.0"
var puzzleOutput = ""
for character in puzzleInput.characters {
    switch character {
    case "a", "e", "i", "o", "u", " ":
        continue
    default:
        puzzleOutput.append(character)
    }
}
print(puzzleOutput)

//2.break
let numberSymbol: Character = "三"
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}
if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value could not be found for \(numberSymbol).")
}

//3.Fallthrouth
let integerToDescribe = 5
var description = "数字 \(integerToDescribe) 是"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " 质数, 并且是"
    fallthrough
default:
    description += " 一个整数。"
}
print(description)






