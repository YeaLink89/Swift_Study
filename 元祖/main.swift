//
//  main.swift
//  元祖
//
//  Created by Yealink89 on 2018/3/10.
//  Copyright © 2018年 Yealink89. All rights reserved.
//

import Foundation
/*
 元组:(Tuples)
 在其它语言中很早就是有元组这个概念, 但是对于OC程序员来说这是一个新的概念
 将多个相同或者不同类型的值用一个小括号括起来就是一个元组
 */
let student = ("张三",30,99.8,[333,6666,"sssssstt"])
print(student)
print(student.0)
print(student.1)
print(student.2)
print(student.3)
/*
 元组其实和结构体很像, 只是不需要提前定义类型, 那么如果不定义类型元组是什么类型呢?
 元组其实是复合类型, 小括号可以写任意类型
 */

let student1:(String, Int, Double) = ("张三",30,19.9)
/*
 元组的其他定义方式:指明元组元素的名称
 */
let student2 = (name:"hi",age:20,core:99.2)
print(student2.name)
print(student2.age)
print(student2.core)

/*
 元组的其他定义方式:
 通过指定的名称提取元组对应的值, 会将对应位置的值赋值给对应位置的名称
 */
let (name, age, score) = ("张三", 30 ,99.9)
print(name)
print(age)
print(score)

/*
 如果不关心元组中的某个值可以利用_通配符来忽略提取
 */
let (name1, age1, _) = ("hello", 30, 99.9)
print(name1)
print(age1)

/*
 以前没有元组之前C和OC语言是通过传入指针或者凡是结构体的方式来返回多个值的,而有了元组之后就可以实现让一个函数返回多个值
 */


// 补充:
/** 元组的定义 **/
// 一元元组, 会将编译器优化为其实际元素的类型.举例:
var t1 : (String) = ("我是字符串") // 等同于下面一行
//var t1 : String = "我是字符串"
//可以缺省类型 var t1 = "我是字符串"
//注意!!!: 由于t1实际为String类型, 因此t1.0的访问会报错

// 元组支持嵌套
var t_t : (String, (String, Int)) = ("基本信息",("张三", 25))

// 可以将元组的类型重定义为一个类型名
typealias namedFinshesType = (first:String, second:String, third:String)
let namedFinshes : namedFinshesType = ("aaa", "bbb", "ccc")


// MARK:元组的数据访问
// 当元素未命名时, 采用自然顺序访问, 序号从0开始
var t2 = ("张三", 25)
var names = t2.0
var ages = t2.1
print("name: \(names),age: \(ages)") // 打印:name: 小韩哥,age: 25

// 当元素命名时, 可以用命名访问数据
var t3 = (name:"张三", age: 26)
names = t3.name
ages = t3.age
print("name: \(names),age: \(ages)") // 打印:name: 小韩哥,age: 26

// 可以用多个变量同时进行访问
var t4 = (name:"张三", 22)
var (name3, age3) = t4 // 即可同时获取name, age
var (name4, _) = t4 // 不需要时参数可以缺省
var(name5) = t4;

// 另外注意, 元组为数值类型, 因此元组的拷贝是值拷贝
var t5 = (name:"张三", 23)
var t5_copy = t5
t5.name = "李四"
print("\(t5_copy.name)") // 打印: 张三

// MARK: 关于元组的访问级别
/*
 * 元组的访问级别取决于它包含的元素，比如元组里的元素都是private级别的，那么该元组也是private级别的。
 * 遵循最小的原则，也就是说如果一个元组中有两个元素，一个为private级别，另一个为public级别，那么该元组遵循最小原则，它的访问级别为private。
 */
// 元素的数据修改
// 虽然元组的数据不能增删, 但是修改还是可以的
var t6 = (name:"张三", 26)
t6.name = "李四"
print("\(t6.name)") // 打印:李白
t6 = ("小明", 25)
print("\(t6.name)") // 打印:韩较瘦

// 但是数据类型不能改变
//t6.name = 30 // 报错!

// 如果是常量定义, 元组的数据不能改变
let t7 = (name:"张三", 23)
//t7.name = "李四" // 报错!

// 当然,如果指定数据类型为Any, 这种情况下数据可以改变类型
var t_any : (String, Any) = ("小韩哥", 25)
t_any.1 = "可以改变为String" // Any不限定数据类型

/** 元组与Array, Dictionary的组合定义**/
// 数组嵌套元素
var moneyArray:[(Int,String)] = [(20,"Cidy"), (18,"Nickle"), (14, "Quarter")]

// 字典嵌套元组
var userInfoDic:[String:(Int,String)] = ["cidy":(20,"girl"), "nickl":(15,"boy")]
print(userInfoDic) // 打印:["cidy": (20, "girl"), "nickl": (15, "boy")]

// MARK: 元祖的使用场景

// 非常适用于Dictionary遍历
// 官方文档例子:
var airports: [String:String] = ["YYZ": "toronto", "DUB": "Dublin"]

// 遍历airports
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

// 非常适合用于Array的enumerated()
// 官方文档例子:
var shoppingList = ["Eggs", "Milk"]
for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}

// 适合函数返回多元数据
func userInfoOne() ->(String, Int) {
    return ("张三", 26)
}

// 函数也可以返回可选元组, 即可以返回nil
func userInfoTwo() ->(String, Int)? {
    return nil
}

// 当然也可以部分元素为可选
func userInfoThree() -> (String?,Int) {
    return (nil, 26)
}
