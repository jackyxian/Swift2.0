//作者：冼树华
//QQ:  56472465

import UIKit

//定义枚举，里面的case看上去就是为switch准备的，天生一对
enum 方向{
    case 东
    case 南
    case 西
    case 北
}
//调用枚举
var 现在 = 方向.东
print("现在的方向是：\(现在)")

//在switch中使用
switch 现在 {
case 方向.东: print("问君能有几多愁，恰似一江春水向东流。");
case 方向.南: print("红豆生南国，春来发几枝? ")
case .西:  print("故人西辞黄鹤楼，烟花三月下扬州。")
case .北:  print("北国风光，千里冰封，万里雪飘。")
}

enum 一周{
    case 星期一
    case 星期二
    case 星期三
    case 星期四
    case 星期五
    case 星期六
    case 星期日
}

let 休息日 = 一周.星期日

switch 休息日{
case .星期日:print("今天休息")
default:print("上班中...")
}


//---------枚举类型---关联值
enum Barcode{
    case UPCA(Int,Int,Int,Int)
    case QRCode(String)
}

var 某商品 = Barcode.UPCA(8, 85909, 51226, 3)
某商品 = Barcode.QRCode("麦咖啡套餐")

switch 某商品{
case let .UPCA(系统位,厂商位,商品位,校验位):
    print("一维码：\(系统位)\(厂商位)\(商品位)\(校验位)")
case let .QRCode(产品编码):
    print("二维码：\(产品编码)")
}


//--------枚举类型---固定值
enum 行星: Int{
    case 水星 = 1
    case 金星
    case 地球
    case 火星
    case 木星
    case 土星
    case 天王星
    case 海王星
    case 冥王星
}
//返回个数（从0开始）
print(行星.冥王星.rawValue)
let 某行星 = 行星.天王星
print(某行星.hashValue)
