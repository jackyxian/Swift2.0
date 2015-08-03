//作者：冼树华
//QQ:  56472465

import UIKit

//字符串字面量
let str = "Hello, playground"

//初始化空字符串
let emptyString = ""               // 空字符串字面量let anotherEmptyString = String()  // 初始化 String 实例
if emptyString.isEmpty {    print("什么都没有")}

//字符串的可变性
var variableString = "Horse"
variableString = " and carriage"
// variableString 现在为 "Horse and carriage"
let constantString = "Highlander"
//constantString += " and another Highlander"
// 这会报告一个编译错误 (compile-time error) - 常量不可以被修改。

//使用字符串
for character in "Dog!🐶".characters {
    print(character)
}
let rmb: Character = "¥"
print(rmb)

//连接字符串和字符
let string1 = "你好"let string2 = " 华仔"var welcome = string1 + string2print(welcome)
// welcome 现在等于 "你好 华仔"

var instruction = "我喜欢 "instruction += string2print(instruction)
// instruction 现在等于　"我喜欢 华仔"

let exclamationMark: Character = "！"
welcome.append(exclamationMark)
print(welcome)
// welcome 现在等于 "你好 华仔！"


//字符串插入值
let multiplier = 3let message = "\(multiplier) 乘以 2.5 是 \(Double(multiplier) * 2.5)"
print(message)

//unicode
let dogString = "Dog!🐶"

for codeUnit in dogString.utf8{
    print("\(codeUnit) ",false)
}
print("")

for codeUnit in dogString.utf16{
    print("\(codeUnit) ",false)
}
print("")

for scalar in dogString.unicodeScalars {    print("\(scalar.value) ", false)}print("")


//计算字符数量
let strResult = "你好，我爱swift！"
print("常量字符串strResult的长度是：\(strResult.characters.count)")



//字符串的访问和修改----

//1.字符串的下标
let strs = "Hello, 让华仔来给你讲Swift2.0语法,OK"
print(strs.startIndex)  //strs的第1个下标
print(strs.endIndex)    //strs的最后1个下标

//2.通过下标获取字符（字符串就是字符的数组，所以下标获取字符，下标都是从0开始）
let a1 = strs[strs.startIndex]              //第1个下标的字符
let a2 = strs[strs.startIndex.successor()]  //第1个下标的下一个下标
let a3 = strs[strs.endIndex.predecessor()]  //最后一个下标的前1个下标
let index = advance(strs.startIndex, 7)
print("a1 = \(a1), a2 = \(a2), a3 = \(a3), index = \(index)")
print("strs[index] = \(strs[index])")

//3.遍历字符串下标的值
for indexs in strs.characters.indices{
  print("\(indexs),",false)
}
print("")

var strHello = "你好，我们学习Swift2.0"
//4.插入字符
strHello.insert("！", atIndex: strHello.endIndex)//在语句最尾部分插入字符!
print(strHello)

//5.插入字符串
strHello.splice("你学会了吗？".characters, atIndex: strHello.startIndex)//在语句开头插入字符串
print(strHello)

//6.删除字符_成功就返回删除了的某个字符
strHello.removeAtIndex(advance(strHello.startIndex, 7))
print(strHello)

//7.删除字符串_成功就返回删除了的某个字符串
let range = advance(strHello.endIndex, -6)..<strHello.endIndex
strHello.removeRange(range)
print(strHello)


//比较字符串-------
var a = "华仔"
var b = "华仔"

if(a == b){
    print("相等")
}else{
    print("不相等")
}


let placeLists = ["上海市宝山区","上海市徐汇区","上海市普陀区","上海市崇明岛","大连市中山区","大连市旅顺口区","大连市小平区","深圳市南山区","上海市福田区","舟山市普陀区","塔什库尔干吉克自治县","首尔市江南区","鹤岗市南山区","台北市中山区","木垒哈萨克自治县","博尔塔拉蒙古自治州","巴音郭楞蒙古自治州","伊春市友好区","东京都港区","双鸭山市宝山区","抚远县黑瞎子岛","玛利亚群岛","舟山群岛","千岛群岛","关岛","南宁市江南区","新疆维吾尔自治区和田县"]


var 县数 = 0, 区数 = 0, 自治州数 = 0, 岛数 = 0, 宝山区数 = 0
var 上海列表 = [String]()
var 大连列表 = [String]()

for place in placeLists{
        //通过hasSuffix这个后缀相等，获取相关数据统计
        if(place.hasSuffix("县")){
            ++县数
        }
        if(place.hasSuffix("区")){
            ++区数
        }
        if(place.hasSuffix("自治州")){
            ++自治州数
        }
        if(place.hasSuffix("岛")){
            ++岛数
        }
        if(place.hasSuffix("宝山区")){
            ++宝山区数
        }
        
        //通过hasPrefix这个前缀相等，获取相关地方到数组列表里
        if(place.hasPrefix("上海")){
            上海列表.append(place)
        }
        if(place.hasPrefix("大连")){
            大连列表.append(place)
        }
        
}
print("一共有\(县数)个县，一共有\(区数)个区，一共有\(自治州数)个自治州，一共有\(岛数)个岛，一共有\(宝山区数)个宝山区")

for place in 上海列表{
            print("属于上海的有：\(place)")
}
for place in 大连列表{
            print("属于大连的有：\(place)")
}





















