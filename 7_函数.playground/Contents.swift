//作者：冼树华
//QQ:  56472465

import UIKit

//1.定义函数和调用
func sayHello(personName:String)->String{
    let say = "你好，\(personName)！"
    return say
}
print(sayHello("雨燕"))

//2.多个参数的函数
func getMoney(工资:Int,扣税:Int)->Int{
    return 工资 - 扣税
}
print("波波每月实际收入：\(getMoney(30000,扣税: 5000))")

//3.没有参数的函数
func sayHi()->String{
    return "Hi,波波"
}
print(sayHi())

//4.没有返回值的函数
func HiMan(name:String){
    print("你好啊，\(name)")
}
HiMan("老镇")

//5.没有返回值的函数调用有返回值的函数
func printAndCount(stringToPrint:String)->Int{
    print(stringToPrint)
    return stringToPrint.characters.count
}
func printWithoutCount(stringToPrint:String){
    printAndCount(stringToPrint)
}
printWithoutCount("花川学院")   //没有返回值，只打印了参数


//6.函数返回多个值，我们使用元组
func getMinMax(array:[Int])->(min:Int,max:Int){
    var min = array[0]
    var max = array[0]
    //迭代数组，获取最小和最大值
    for value in array{
        if value < min{
            min = value
        }
        if value > max{
            max = value
        }
    }
    
    return (min,max)
}
let values = getMinMax([10,42,8,99,3])
print("最少值是：\(values.min)，最大值是：\(values.max)")

//7.返回多个值，我们使用元组，并且添加可选类型，数组可能为nil
func getMinMaxMoney(array:[Int])->(min:Int,max:Int)?{
    if array.isEmpty {
        return nil
    }
    var min = array[0]
    var max = array[0]
    //迭代数组，获取最小和最大值
    for value in array{
        if value < min{
            min = value
        }
        if value > max{
            max = value
        }
    }
    
    return (min,max)
}
var arrays = [Int]()
arrays = [8000,9000,7000]
//可选类型判断拆包
if let moneys = getMinMaxMoney(arrays){
    print("最少工资是：\(moneys.min)，最大工资是：\(moneys.max)")
}else{
    print("没有工资。")
}

//8.定义参数别名(更好说明参数的含义)
func join(string s1:String, toString s2:String, WithJoiner joiner:String)->String{
    return s1+joiner+s2
}
print(join(string: "华仔", toString: "雨燕", WithJoiner: "讲"))

//9.参数别名和默认值
func 是否年轻女演员(名字 userName:String, 年龄 age:Int = 22)->Bool{
    var 答案:Bool = false
    if(age < 30){
        答案 = true
    }
    if(userName == "陈静" || userName == "杨幂" || userName == "堀北真希"){
        答案 = true
    }
    print("\(userName) 是否年轻女演员：\(答案)")
    return 答案
}
是否年轻女演员(名字: "堀北真希")
是否年轻女演员(名字: "林志玲", 年龄:41)

//10.N个可变参数
func 选秀(numbers:Int...)->String{
    var total : Int = 0
    var min = numbers[0];
    var max = numbers[0];
    for number in numbers{
        total += number
        if(number > max){
            max = number
        }
        if(number < min){
            min = number
        }
    }
    
    return "一共有\(total)位佳丽，其中第一位\(min)号，最后一位是：\(max)号"
    
}
print(选秀(1,3,21,4,5,88))
print(选秀(31,23,14,99,6,28))

//11.常量和变量参数
//string这里当作可以变化的返回值和参数使用
func alignRight(var string: String, totalLength: Int, pad: Character) -> String {
    let amountToPad = totalLength - string.characters.count
    if amountToPad < 1 {
        return string
    }
    let padString = String(pad)
    for _ in 1...amountToPad {
        string = padString + string
    }
    return string
}
let originalString = "hello"
let paddedString = alignRight(originalString, totalLength: 10, pad: "-")
print(paddedString)

//12.输出参数，函数计算后，把值返回给参数变量
//这函数是a和b的值换了
func swapTwoInts(inout a: Int, inout b: Int) {
    let temp = a
    a = b
    b = temp
}
var a1 = 100
var b1 = 50
//调用输出参数的值时要多加&符号到参数
swapTwoInts(&a1, b: &b1)
print("a1：\(a1),   b1：\(b1)")

//13.函数类型
func 两数相加(a:Int,b:Int) -> Int{
    return a + b
}
func 两数相乘(a:Int,b:Int) -> Int{
    return a * b
}
//可以这样定义函数定义变量
var tmp1 = 两数相加
var tmp2 : (Int,Int)->Int = 两数相乘
//函数变量的使用
print("2加5是\(tmp1(2,b: 5))")
print("2乘5是\(tmp2(2,5))")

//14.函数类型作为参数
func 显示相乘结果(a:Int,b:Int,相乘函数:(Int,Int)->Int){
    let result = 相乘函数(a,b)
    print("\(a)乘以\(b)等于\(result)")
}
//这样调用具有函数类型作为参数的函数
显示相乘结果(5, b: 6, 相乘函数: 两数相乘)

//15.函数类型作为返回值
func 加一(number:Int)->Int{
    return number + 1
}
func 减一(number:Int)->Int{
    return number - 1
}

func 判断加减(判断正负:Bool)->(Int)->Int{
    return 判断正负 ? 减一 : 加一
}
print("调用函数类型作为返回值：\(判断加减(1>0)(10))")


//16.函数作为常量
var num = 10
let 函数 = 判断加减(num > 0)
while num != 0{
    print("\(num),", appendNewline: false)
    //调用常量函数
    num=函数(num)
}
print("")

//16.嵌套函数
func 得出结果(加薪减薪:Bool)->(Int,Int)->Int{
    func 加薪(工资:Int,加薪:Int)->Int{
        return 工资+加薪
    }
    func 减薪(工资:Int,减薪:Int)->Int{
        return 工资-减薪
    }
    
    return 加薪减薪 ? 加薪 : 减薪
}
//定义常量函数
let fun = 得出结果(true)
//调用嵌套的函数类型
var result = fun(9500,2000)
print("今年的工资是：\(result)")
