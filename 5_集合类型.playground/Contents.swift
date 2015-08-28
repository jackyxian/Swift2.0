//作者：冼树华
//QQ:  56472465

import UIKit

//数组--------
//1.创建空数组
var peoples = [String]()
print("peoples是一个字符串类型的数组，\(peoples)")

//2.创建N个带有相同值子项的数组
var coders = [String](count: 10, repeatedValue: "我要加薪") //表示创建了100个值都是“我要加薪”的子项（码农都想加薪了^_^ ）
print("coders：\(coders)")

//3.创建1个数组，它数组里的项 ＝ 另外两个数组类型数字只和
var 开发部 = [String](count: 20, repeatedValue: "代码编写")
var 测试部 = [String](count: 2, repeatedValue: "产品测试")
var 技术部 = 测试部 + 开发部
print("技术部人员工作：\(技术部)")


//4.数组的常用相关操作
var 巴士5号 = ["香洲总站","南坑","桃园新村","银桦新村","新村","南村","香洲区府"]
print(巴士5号)

//4.1判断是否为空”.isEmpty“属性和统计数组子项数量”.count“属性：
if(巴士5号.isEmpty){
    print("站点为空")
}
else{
    print("巴士5号经过：\(巴士5号.count)个站")
}

//4.2往数组尾部添加新子项”append()”方法
巴士5号.append("红山")
print("现在巴士经过的站点有：\(巴士5号)")

//4.3按指定下标（0号算第1个）插入相关数据
巴士5号.insert("安居园", atIndex:3)
print("现在巴士经过的站点有：\(巴士5号)")

//4.4一次添加多个元素
巴士5号 += ["北岭","华侨宾馆","拱北万佳","拱北"]
print("现在巴士经过的站点有：\(巴士5号)")


//4.5循环迭代数组数据
for road in 巴士5号{
    //print(road + " ", appendNewline: false)
    print(road, terminator: " ")
}
print("")

//4.6通过下标，修改数据里某个子项
巴士5号[0] = "凤凰北"
print(巴士5号)

//4.7通过下标，修改数组里多个子项
巴士5号[4...6] = ["中山亭","前山西门","白石"]
print(巴士5号)

//4.8通过下标，删除数组里某个子项
var 删除的站点  = 巴士5号.removeAtIndex(3)
print("删除站点：\(删除的站点)后，路线是：\(巴士5号)")

//4.9使用"removeLast()"方法，删除最后一个子项
var 删除最后一个站点 = 巴士5号.removeLast()
print("删除最后一个站点：\(删除最后一个站点)")

//4.10
//迭代数组序号和值（把数组分解成元组类型，一个Int，一个String）
for (index,value) in 巴士5号.enumerate(){
    print("第\(index + 1)个站是：\(value)")
}

//----------集-------------

//1.定义一个字符类型的集合，集合没有顺序
var letters = Set<Character>();

//2.添加元素到集合里
letters.insert("a")
print(letters)
//3.清空集合
letters = []
print(letters)

//4.初始化集合：
var zoon : Set<String> = ["狮子","老虎","斑马","长颈鹿"]
var other : Set = ["狮子","老虎","斑马","长颈鹿"]

//5.比较、判断是否为空、统计集里有多少子项、是否包含那个子项
if(zoon == other){
    print("同一个动物园")
}
if(zoon.isEmpty){
    print("没有动物")
}else{
    print("有很\(zoon.count)种动物")
}

if(zoon.contains("老虎")){
    print("动物园有老虎")
}


//6.迭代数据
print("动物园里有：")
for animal in zoon{
    //print("\(animal) ", appendNewline: false)
    print("\(animal) ", terminator: " ")
}
print("")

//7.交集、并集、补集和差集
var zoonA : Set<String> = ["狮子","老虎","斑马","长颈鹿"]
var zoonB : Set<String> = ["狮子","牛奶仔","斑马","羊咩仔"]
var result : Set<String> = []
//1.交接:A和B共有
result = zoonA.intersect(zoonB)
print("A和B的交集是：\(result)")
//2.差集：B中没有A的部分
result = zoonA.subtract(zoonB)
print("A和B的差集是：\(result)")
//3.并集:A合并B
result = zoonA.union(zoonB)
print("A和B的并集是：\(result)")
//4.补集:A没有的合并B没有的
result = zoonA.exclusiveOr(zoonB)
print("A和B的补集是：\(result)")

//8.集合的比较
let zoon1: Set = ["狗", "猫"]
let zoon2: Set = ["牛", "鸡", "羊", "狗", "猫"]
let zoon3: Set = ["乌鸦", "老鼠"]
var res: Bool = false

res = zoon1 == zoon2 ? true : false
print("zoon1和zoone2相等吗？\(res)")

res = zoon1.isSubsetOf(zoon2)
print("zoon1是zoon2的子集吗？\(res)")

res = zoon2.isSupersetOf(zoon1)
print("zoon2是zoon1的父集吗？\(res)")

res = zoon2.isDisjointWith(zoon3)
print("zoon2和zoon1没有相同的元素吗？\(res)")




//------------字典--------------



//字典的定义
var 机场A : [String:String] = ["珠海机场":"123航班","新加坡机场":"711航班","广州机场":"GZ250航班"]
var 机场B = ["珠海机场":"123航班","新加坡机场":"711航班","广州机场":"GZ250航班","上海机场":"SH911航班"]
print("机场A：\(机场A)")
print("机场B：\(机场B)")


//判断是否为空,获取字典元素个数
if(机场A.isEmpty && 机场B.isEmpty){
    print("没有航班")
}else{
    print("机场A有航班：\(机场A.count)个，机场B有航班：\(机场B.count)个")
}

//插入
机场A["福建机场"] = "FUXXOO"
//更改数据
机场B["珠海机场"] = "321航班"
print("添加航班的：机场A：\(机场A)")
print("更改航班的：机场B：\(机场B)")


//updateValue可以检查key是否存在，不存在返回nil，存在，返回key的更新前的值
let oldValue = 机场A.updateValue("新321航班", forKey: "珠海机场")!
let newValue = 机场A["珠海机场"]!
print("机场A里珠海机场更新前的值是：\(oldValue)，更新后的值是：\(newValue)")


//删除值
机场A["新加坡机场"] = nil
var re = 机场A["新加坡机场"]
print("机场A里新加坡机场的值是：\(re)")

//removeValueForKey，可以检查key是否存在再删除，不存在返回nil，能删除的话就返回被删除的值
let delValue = 机场B.removeValueForKey("新加坡机场")!
let presentValue = 机场B["新加坡机场"]
print("机场B里新加坡机场删除前的值是：\(delValue)，删除后的值是：\(presentValue)")


//迭代key
for key in 机场A.keys{
    print("机场A的航班有：\(key)")
}

//迭代value
for value in 机场A.values{
    print("机场A经过的机场有：\(value)")
}

//迭代key和value
for(key,value)in 机场A{
    print("机场A的航班有：\(key)，经过的机场有：\(value)")
}


//把keys转为数组
//let air = 机场B.keys.array
let air = Array(机场B.keys)
print(air)
//当然你也可以强制转换为[String]
let 航班 = [String](机场B.values)
print(航班)





