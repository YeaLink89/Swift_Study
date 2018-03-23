//
//  main.swift
//  类
//
//  Created by Yealink89 on 2018/3/10.
//  Copyright © 2018年 Yealink89. All rights reserved.
//

import Foundation

/*
 共同点
 定义属性
 定义方法
 定义下标操作使得可以通过下标语法来访问实例所包含的值
 定义构造器用于生成初始化值
 通过扩展以增加默认实现的功能
 实现协议以提供某种标准功能
 
 不同点(类有更多功能)
 继承：允许一个类继承另一个类的特征
 类型转换：允许在运行时检查和解释一个类实例的类型
 析构器允许一个类实例释放任何其所被分配的资源
 引用计数允许对一个类的多次引用
 */
class Person {
    var age:Int = 0
    var card:String = "222222"
    func show() -> Void {
        print("age = \(age ) card = \(card)")
    }
}

var p1 = Person()
var p2 = p1
p1.show()

/*
类：是引用类型, 类之间的赋值其实是将p2指向了p1的内存存储空间,所以他们是两个指向相同的一块存储空间,
   修改其中一个会影响到另外一个
结构体：是值类型,修改一个不会影响另外一个
*/

p1.age = 12
p2.show()

struct Person1 {
    var age:Int = 0
    var card:String = "333333"
    func show() -> Void {
        print(" Person1 age = \(age )")
    }
}

var p11 = Person1()
p11.age = 44
var p21 = p11
p21.age = 566
p11.show()
p21.show()

/*
 类方法:
 和类属性一样通过类名来调用, 类方法通过static关键字(结构体/枚举),
 class(类)类方法中不存在self
 */

class Person4 {
    var name: String = "张三"
    static var card: String = "1234567"
    func show()
    {
        print("name = \(name) card = \(Person4.card)")
    }
    
    static func staticShow()
    {
        //类方法中没有self
        //静态方法对应OC中的+号方法, 和OC一样在类方法中不能访问非静态属性
        print("card = \(Person4.card)")
        //Person4.name ❌
    }
}
var p4 = Person4()
p4.show()
Person4.staticShow()

