//作者：冼树华
//QQ:  56472465

import UIKit

//1.泛型能解决代码重复，多种数据类型在同一函数中灵活运用

//非泛型的Int类型的数据转换
func 数据转换(inout a:Int, inout _ b: Int){
    print("转换前的数据是：a = \(a), b = \(b)")
    let 模板 = a
    a = b
    b = 模板
    print("转换后的数据是：a = \(a)，b = \(b)")
}
var a1 = 3
var b1 = 107
数据转换(&a1, &b1)

//非泛型的String类型的数据转换
func 数据转换(inout a:String, inout _ b: String){
    print("转换前的数据是：a = \(a), b = \(b)")
    let 模板 = a
    a = b
    b = 模板
    print("转换后的数据是：a = \(a)，b = \(b)")
}
var a2 = "雨琪"
var b2 = "你好"
数据转换(&a2, &b2)

//泛型的写法
func 泛型数据转换<T>(inout a: T, inout _ b: T){
    print("泛型转换前的数据是：a = \(a), b = \(b)")
    let 模板 = a
    a = b
    b = 模板
    print("泛型转换后的数据是：a = \(a)，b = \(b)")

}
var a3 = "希达"
var b3 = "你好"
泛型数据转换(&a3, &b3)
var a4 = 250
var b4 = 1314
泛型数据转换(&a4, &b4)


//2.自定义泛型

//非泛型的Int栈
struct Int栈{
    var 数组项 = [Int]()
    
    mutating func 压入(项:Int){
        数组项.append(项)
    }
    mutating func 弹出() -> Int {
        return 数组项.removeLast()
    }
}
//泛型栈
struct 栈<Element> {
    var 数组项 = [Element]()
    
    mutating func 压入(项:Element){
        print("压入栈的有：\(项)")
        数组项.append(项)
    }
    mutating func 弹出() -> Element{
        return 数组项.removeLast()
    }
}

var 花川学院栈 = 栈<String>()
花川学院栈.压入("波波")
花川学院栈.压入("老镇")
花川学院栈.压入("雨琪")
花川学院栈.压入("华仔")

print("花川学院毕业的有：\(花川学院栈.弹出())")


//3.扩展泛型
extension 栈{
    var 第一项: Element?{
        return 数组项.isEmpty ? nil : 数组项[数组项.count - 1]
    }
}

var 扩展花川学院栈 = 栈<String>()
扩展花川学院栈.压入("希达")
扩展花川学院栈.压入("小吴")
扩展花川学院栈.压入("书霸")
print("扩展花川学院第一人是：\(扩展花川学院栈.第一项!)")


//4.泛型约束

//非泛型函数

func 查询字符串索引(数组:[String], _ 查询值: String) -> Int? {
    for (索引, 值) in 数组.enumerate(){
        if 值 == 查询值{
            return 索引
        }
    }
    return nil
}
let 动物园 = ["猫","狗","松鼠","鸭子","兔子"]
if let 找到的索引 = 查询字符串索引(动物园, "松鼠"){
    print("动物园里松鼠的索引是：\(找到的索引)")
}

//func 查询索引<T>(数组:[T], _ 查询值: T) -> Int? {
//    for (索引, 值) in 数组.enumerate(){
//        if 值 == 查询值{
//            return 索引
//        }
//    }
//    return nil
//}

func 查询索引<T: Equatable>(数组:[T], _ 查询值: T) -> Int? {
    for (索引, 值) in 数组.enumerate(){
        if 值 == 查询值{
            return 索引
        }
    }
    return nil
}
let 浮点数组里的索引 = 查询索引([1239.3, 0.1, 0.25], 9.3)
print("浮点数组里9.3的索引是：\(浮点数组里的索引)")
let 字符数组里的索引 = 查询索引(["牛奶","牛奶饼干","芝士面白"], "牛奶饼干")
print("字符串数组里牛奶平干的索引是：\(字符数组里的索引)")


//5.关联类型
// 1)先定义协议
protocol 容器 {
    typealias 项的类型
    mutating func 添加(项: 项的类型)
    var 数量: Int { get }
    subscript(i: Int) -> 项的类型 { get }
}

// 2)非泛型的协议实现
struct 整形栈: 容器 {
    //原有属性和方法
    var 数组项 = [Int]()
    mutating func 压入(项: Int){
        数组项.append(项)
    }
    mutating func 弹出()->Int{
        return  数组项.removeLast()
    }
    
    //实现协议
    typealias 项的类型 = Int
    mutating func 添加(项: 项的类型) {
        self.压入(项)
    }
    var 数量: Int{
        return 数组项.count
    }
    subscript(i:Int) ->Int{
        return 数组项[i]
    }
}

// 3)关联泛型的协议实现

struct 关联栈<Element>: 容器 {
    //原有属性和方法
    var 数组项 = [Element]()
    mutating func 压入(项: Element){
        数组项.append(项)
    }
    mutating func 弹出()->Element{
        return  数组项.removeLast()
    }
    
    //实现协议
    mutating func 添加(项: Element) {
        self.压入(项)
    }
    var 数量: Int{
        return 数组项.count
    }
    subscript(i:Int) ->Element{
        return 数组项[i]
    }
    
}

// 4)swift的基础类型扩展关联类型
extension Array: 容器{
    //实现协议
    mutating func 添加(项: Element) {
        self.append(项)
    }
    var 数量: Int{
        return self.count
    }
    
}



//6. 条件语句
func 所有匹配项<
    C1: 容器, C2: 容器
    where C1.项的类型 == C2.项的类型, C1.项的类型: Equatable>
    (第一个容器: C1, 第二个容器: C2) -> Bool {
        
        // 检查两个Container的元素个数是否相同
        if 第一个容器.数量 != 第二个容器.数量 {
            return false
        }
        
        // 检查两个Container相应位置的元素彼此是否相等
        for i in 0..<第一个容器.数量 {
            if 第一个容器[i] != 第二个容器[i] {
                return false
            }
        }
        
        // 如果所有元素检查都相同则返回true
        return true
        
}


var 字符栈 = 关联栈<String>()
字符栈.压入("波波")
字符栈.压入("老镇")
字符栈.压入("华仔")
var 字符数组 = ["波波", "老镇", "华仔"]

if 所有匹配项(字符栈, 第二个容器: 字符数组){
    print("所有项是一样的！")
}else{
    print("所有项是不一样的！")
}




















