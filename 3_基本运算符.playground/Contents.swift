//作者：冼树华
//QQ:  56472465

import UIKit

var str = "Hello, playground"

//赋值运算符
let b1 = 10
var a1 = 5
a1 = b1
print("a1 = \(a1)")

let (x1, y1) = (1, 2)
print("元组的值x1是：\(x1),y1的值是：\(y1)")

//算术运算符
let a2 = 10, b2 = 2
print("a2 + b2 = \(a2 + b2)")
print("a2 + b2 = \(a2 - b2)")
print("a2 + b2 = \(a2 * b2)")
print("a2 + b2 = \(a2 / b2)")
print("你的得分是" + "\(a2)分")

//求余运算符
let a3 = 9, b3 = 4
print("a3 取余 b3 = \(a3 % b3)")

//浮点数求余计算
let a4: Double = 8
let b4: Double = 2.5
print("a4 取余 b4 = \(a4 % b4)")

//自增和自减
var a5 = 0
let b5 = ++a5 // a5 和 b5 现在都是 1
let c5 = a5++ // a5 现在 2, 但 c5 是 a5 自增前的值 1
print("a5 = \(a5), b5 = \(b5), c5 = \(c5)")

//一元正负运算符号
let three = 3
let minusThree = -three       // minusThree 等于 -3
let plusThree = -minusThree   // plusThree 等于 3（因为负负得正）
print("three = \(three)，minusThree = \(minusThree),plusThree = \(plusThree) ")

//组合赋值运算符
var a6 = 1
a6 += 2 // a6 现在是 3
print(a6)

//比较运算符
let name = "路飞"if name == "路飞" {    print("你好，\(name)")} else {    print("对不起\(name), 你不是草帽小子")}

//三元运算符
//工资例子
let 基本工资 = 8000     //基本工资
let 奖金 = true        //当月是否有奖金
var 实发工资 = 基本工资  //一般情况下实发工资就是基本工作
if(奖金){
    实发工资 = 基本工资 + 5000  //业绩好，发奖金了
}else{
    实发工资 = 基本工资 + 300   //业绩不好，老板随意给点电话补贴
}
print(实发工资)

实发工资 = 奖金 ? 基本工资 + 5000 : 基本工资 + 300
print(实发工资)

//空合运算符
let defaultColorName = "red"
var userDefinedColorName:String?   //默认值为nil
var colorNameToUse = userDefinedColorName ?? defaultColorName
//userDefinedColorName的值为空 ，所以colorNameToUse的值为`red`
print("colorNametoUse = \(colorNameToUse)")

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName
//userDefinedColorName非空，因此colorNameToUsede的值为绿色
print("colorNametoUse = \(colorNameToUse)")

//区间运算符
for index in 1...5 {    print("\(index) * 5 = \(index * 5)")}

let names = ["小波", "老真", "雨琪", "华仔"]let count = names.countfor i in 0..<count {    print("第 \(i + 1) 个人叫 \(names[i])")}
//逻辑运算符

//逻辑非
let 华仔很帅 = false
if !华仔很帅 {
    print("其实华仔很帅！")
}else{
    print("其实华仔不够帅！")
}

//逻辑与
let 账号 = true
let 密码 = false
if 账号 && 密码 {
    print("登录成功")
}else{
    print("登录失败")
}

//逻辑或
let 帅气 = true
let 有钱 = false
if(帅气 || 有钱){
    print("成为男神！")
}else{
    print("只能成为屌丝了！")
}

//组合
let enteredDoorCode = true          //门禁密码
let passedRetinaScan = false        //视网膜扫描
let hasDoorKey = false              //有钥匙
let knowsOverridePassword = true    //知道重置密码
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {    print("欢迎进入!")} else {    print("禁止访问！")}

if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {        print("欢迎进入!")    } else {        print("禁止访问！")}







