//
//  main.swift
//  基础部分
//
//  Created by Yealink89 on 2018/3/10.
//  Copyright © 2018年 Yealink89. All rights reserved.
//

import Foundation

// MARK:声明常量和变量
/*
 “使用let来声明常量，使用var来声明变量”
 
 变量:
 OC:
 >先定义再初始化
 int num;
 num = 10;
 
 >定义的同时初始化
 int num2 = 20;
 
 Swift:
 >先定义再初始化
 var num
 报错: 没有指定数据类型(type annotation missing in pattern),
 在Swift中如果想要先定义一个变量, 以后使用时再初始化必须在定义时告诉编译器变量的类型(类型标注)
 */
var num: Int
num = 10;

/*
 >定义的同时初始化
 在Swift中如果定义的同时初始化一个变量,可以不用写数据类型, 编译期会根据初始化的值自动推断出变量的类型(其它语言是没有类型推断的)
 以后在开发中如果在定义的同时初始化就没有必要指定数据类型, 除非需要明确数据类型的长度或者定义时不初始化才需要指定数据类型
 */
var num2:Int = 20  //（冒号+类型）。
var num3 = 20

/*
 常量:
 OC: const int num = 10;
 Swift: let num = 10
 
 错误:
 let num : Int
 Swift中的常量必须在定义时初始化(OC可以不初始化), 否则会报错
 常量的用途: 某些值以后不需要改变, 例如身份证
 */
let num4 = 10
let possibleNumber = "a"
let v:String = "chang liang"
// MARK:常量和变量的命名

/*
 “你可以用任何你喜欢的字符作为常量和变量名，包括 Unicode 字符：”
 “常量与变量名不能包含数学符号，箭头，保留的（或者非法的）Unicode 码位，连线与制表符。也不能以数字开头，但是可以在常量与变量名的其他地方包含数字。”
 错误:
 var 3x = 10
 var x+-3 = 10
 */
var 😂 = 100
print("😂====\(😂)")
var 汉字 = "博大精深"
print("汉字=======\(汉字)")

let convertedNumber = Int(possibleNumber)

/*
 注意： Swift 的 nil 和 Objective-C 中的 nil 并不一样。在 Objective-C 中，nil 是一个指向不存在对象的指针。
      在 Swift 中，nil 不是指针——它是一个确定的值，用来表示值缺失。
      任何类型的可选状态都可以被设置为 nil，不只是对象类型。
 */

//请注意，在 Swift 中使用 true/false 作为布尔值（在 Objective-C 中使用 YES/NO ，所以它们有点不同）。
let onSaleInferred = true
let onSaleExplicit: Bool = false

