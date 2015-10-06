//作者：冼树华
//QQ:  56472465

import UIKit

let MAX_VALUE = 255
var currentCount = 100

let MAX_HEIGHT = 300, MAX_WIDTH = 400, MIN_HEIGHT = 100, MIN_WIDTH = 200
var x = 30.15, y = 22.8, z = 10.5

var strResult : String = "你好，变量类型是String"
let IPADDRESS : String = "http://192.168.1.1"

let π = 3.1415926
var say = "你好世界"
var 名字 = "华仔"
let 🐮 = "cow"

print(π)
print(say)
print(名字)
print(🐮)

let cat = "🐱"; print(cat)

Int8.min
Int8.max
Int16.min
Int16.max
Int32.min
Int32.max
Int64.min
Int64.max
Int.min
Int.max

let age = 25
let userName = "华仔讲Swift2.0"
let pi = 3.1415
let 圆的面积 = pi * pow(3, 2)

let decimalInteger = 17
let binaryInteger = 0b10001       // 二进制的17
let octalInteger = 0o21           // 八进制的17
let hexadecimalInteger = 0x11     // 十六进制的17

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1


// cannotBeNegative: UInt8 = -1
// UInt8 类型不能存储负数，所以会报错
//let tooBig: Int8 = Int8.max + 1
// Int8 类型不能存储超过最大值的数，所以会报错

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

let three = 3
let pointOneFourOneFiveNine = 0.14159
let pis = Double(three) + pointOneFourOneFiveNine
// pis 等于 3.14159，所以被推测为 Double 类型

let integerPi = Int(pis)
// integerPi 等于 3，所以被推测为 Int 类型


typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min
// maxAmplitudeFound 现在是 0

let 有钥匙 = true
if(有钥匙){
    print("打开门")
}else{
    print("找人开门")
}



var http404Error = (404,"没找到相关页面")

//如果获取元组里面的值呢，通过下标，0是第1个元素
var code = http404Error.0
var message = http404Error.1
print("错误代码是：\(code)，错误的信息是：\(message)")

let 数字 = "12345"
let 可能是数字 = Int(数字)
//“可能是数字”被推测为类型 "Int?"， 或者类型 "optional Int"

if(可能是数字 != nil){
    print("可能是数字：\(可能是数字!)")
}else{
    print("不是数字")
}

//可选类型的绑定
if let 是数字么 = Int(数字){
    print("是数字么\(是数字么)")
}else{
    print("不是数字")
}

var emptyStrng: String?
print(emptyStrng)

let 奖金:Int! = 8_000
print(奖金)

//断言
let 年龄 = 16
//assert(condition: Bool, message: String)
assert(年龄>18, "年龄没到18岁不许喝酒！")

