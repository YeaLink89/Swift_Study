//
//  main.swift
//  类
//
//  Created by Yealink89 on 2018/3/10.
//  Copyright © 2018年 Yealink89. All rights reserved.
//

import Foundation

/*
 类的基本定义
 Swift中的结构体和类非常相似, 但是又有不同之处
 类是具有相同属性和方法的抽象
 格式:
 class 类名称 {
 类的属性和方法
 }
 */
class Rect {
    var width:Double = 0.0
    var height:Double = 0.0
    func show() -> Void {
        print("width = \(width) height = \(height)")
    }
}
// 类没有逐一构造器
//var r1 = Rect(width: 10.0, height: 10.0)

/*类是引用类型, 其实是将r2指向了r1的内存存储空间,
 所以他们是两个指向相同的一块存储空间, 修改其中一个会影响到另外一个
 */
var r1 = Rect()
r1.show()
var r2 = r1
r2.show()
print("after--------")

r1.width = 100.0
r1.show()
r2.show()

/*
 恒等运算符, 用于判断是否是同一个实例, 也就是是否指向同一块存储空间
 有:  === !==  两种类型
 “===”表示两个类类型（class type）的常量或者变量引用同一个类实例。
 “==”表示两个实例的值“相等”或“相同”
 */

var r3 = Rect()
if r1 === r3
{
    print("指向同一块存储空间")
}


