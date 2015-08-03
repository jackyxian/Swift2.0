//作者：冼树华
//QQ:  56472465

import UIKit


//Closures：闭包：一个代码块，捕获它周围的常量和变量

//全局函数是封闭的，有一个名字，不捕捉任何值。
//嵌套函数是有名字的，可以从嵌套的函数闭包捕获值。
//闭合表达式是匿名闭包的一个轻量级的语法，可以内部和周围环境中推断出值而捕获。

//其实，函数是闭包的一种，我们一般说的闭包，是闭包表达式
//1.推断参数和返回类型
//2.在单一的表达式中可以隐式返回
//3.速记的参数名
//4.挂尾闭包语法

let city = ["Zhuhai","Guangzhou","Shenzhen","Dongguan","Fushan","Zhongshan"]

func backward(s1:String, s2:String)->Bool{
    return s1 > s2;
}

//1.函数作为参数，不能加参数和返回值
var newCity1 = city.sort(backward)
print("newCity1：\(newCity1)")

//2.使用闭包：语法： 没有函数名称 { (参数)->返回类型 in 代码段 }
var newCity2 = city.sort({
    (s1:String, s2:String) ->Bool in
    return s1 > s2
})
print("newCity2：\(newCity2)")

//3.推断函数类型和返回类型
var newCity3 = city.sort({
    s1, s2 in return s1 > s2})
print("newCity3：\(newCity3)")

//4.如果闭包的语句只有单行表达式，可以把return省略掉
var newCity4 = city.sort({
    s1, s2 in s1 > s2})
print("newCity4：\(newCity4)")

//5.提供了已$开头的$0,$1,$2...n
var newCity5 = city.sort({
    $0 > $1})
print("newCity5：\(newCity5)")


//6.操作符(由于操作符 > 也是函数，所以，连参数都不需要了)
var newCity6 = city.sort(>)
print("newCity6：\(newCity6)")

var newCity7 = city.sort{$0 > $1}


//7.挂尾: 如果闭包是函数最后一个函数，我们可以把闭包移到函数后面,用于闭包表达式语句比较多的情况
let ditNumber: Dictionary = [
    0: "零", 1: "一", 2: "二", 3: "三", 4: "四",
    5: "五", 6: "六", 7: "七", 8: "八", 9: "九"
]

//需要转换为汉子的数字数组
let numbers = [1800,756,9800]

//挂尾闭包
let strResult = numbers.map{
    (var number) -> String in
    var outPut : String = ""
    
    while(number > 0){
        outPut = ditNumber[number % 10]! + outPut
        number /= 10
    }
    
    return outPut
}
print("转换为汉字的数组是：\(strResult)")


//8.捕获值：主要是嵌套函数
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
print(incrementByTen())
print(incrementByTen())
print(incrementByTen())
//因为闭包是一个引用类型！

