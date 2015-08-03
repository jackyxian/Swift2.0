//作者：冼树华
//QQ:  56472465

import UIKit

//1.自定义异常类型
enum 自动售货机异常: ErrorType{
    case 没有此类商品
    case 付款金额不够(required: Double)
    case 商品缺货
}

//2.抛出异常
func 抛出带返回值异常() throws -> String{
    return "波神异常"
}
func 抛出不带返回值异常() throws{}


struct 商品 {
    var 价格: Double
    var 数量: Int
}

var 库存 = [
    "汉堡": 商品(价格: 15.00, 数量: 7),
    "奶茶": 商品(价格: 10.00, 数量: 10),
    "香蕉": 商品(价格: 5.00, 数量: 11)
]

func 购买(商品名称 名称 : String, 购买数量: Int, 付款金额: Double) throws ->Double  {
    var 余额 = 0.00
    
    guard var 库存商品 = 库存[名称] else {
        throw 自动售货机异常.没有此类商品
    }
    
    guard 库存商品.数量 > 购买数量 else {
        throw 自动售货机异常.商品缺货
    }
    
    if 付款金额 >= 库存商品.价格{
        // 正常支付，找钱
        余额 = 付款金额 - 库存商品.价格
        库存商品.数量 = 库存商品.数量 - 购买数量
    }else{
        let 还需要钱 = 库存商品.价格 - 付款金额
        throw 自动售货机异常.付款金额不够(required: 还需要钱)
    }
    return 余额
    
}


//3.捕获和处理异常
do{
    let 余额 = try 购买(商品名称: "咖啡", 购买数量: 10, 付款金额: 20)
    print("成功购物，余额\(余额)")
}catch 自动售货机异常.没有此类商品{
    print("没有此类商品！")
}catch 自动售货机异常.商品缺货{
    print("此商品缺货")
}catch 自动售货机异常.付款金额不够(let amountRequired){
    print("要购买此商品，你还需要\(amountRequired)钱")
}

do{
    let 余额 = try 购买(商品名称: "汉堡", 购买数量: 10, 付款金额: 30)
    print("成功购物，余额\(余额)")
}catch 自动售货机异常.没有此类商品{
    print("没有此类商品！")
}catch 自动售货机异常.商品缺货{
    print("此商品缺货")
}catch 自动售货机异常.付款金额不够(let amountRequired){
    print("要购买此商品，你还需要\(amountRequired)钱")
}


do{
    let 余额 = try 购买(商品名称: "奶茶", 购买数量: 5, 付款金额: 5.0)
    print("成功购物，余额\(余额)")
}catch 自动售货机异常.没有此类商品{
    print("没有此类商品！")
}catch 自动售货机异常.商品缺货{
    print("此商品缺货")
}catch 自动售货机异常.付款金额不够(let amountRequired){
    print("要购买此商品，你还需要\(amountRequired)钱")
}


//4.不处理异常
let 余额 = try! 购买(商品名称: "香蕉", 购买数量: 5, 付款金额: 40)
print("成功购物，余额\(余额)")












