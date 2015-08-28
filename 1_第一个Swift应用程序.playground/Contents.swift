//作者：冼树华
//QQ:  56472465

import UIKit

var str = "Hello,大家一起学雨燕"
print(str)

var dd = "ns111111"
for name in dd.characters {
    print(name)
}

//1.使用separtor参数作为字符串的分隔符形成新字符串
print("花川学院的","同学们",str,"好好学习！", separator:",")
//2.使用terminator参数作为追加字符串到原有字符的结尾 \n 代表换行
print(str,terminator: ",好吗\n")
//3.使用separator参数分割字符串，并且在新字符串的结尾通过terminator添加字符串
print("花川学院的","同学们",str, separator:",",terminator: "很有前途！")
