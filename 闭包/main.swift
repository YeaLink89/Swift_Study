//
//  main.swift
//  闭包
//
//  Created by Yealink89 on 2018/3/10.
//  Copyright © 2018年 Yealink89. All rights reserved.
//

import Foundation
//MARK:闭包表达式（closure)
 /*
 闭包:
 函数是闭包的一种
 类似于OC语言的block
 闭包表达式(匿名函数) -- 能够捕获上下文中的值
 
 语法: in关键字的目的是便于区分返回值和执行语句
 闭包表达式的类型和函数的类型一样, 是参数加上返回值, 也就是in之前的部分
 {
 (参数) -> 返回值类型 in
 执行语句
 }
 
 一般形式：{
 (parameters) -> returnType in
 statements
 }
 */

// 完整写法
let say:(String) -> Void = {
    (name: String) -> Void in
    print("hello \(name)")
}
say("HaRi")

// 没有返回值写法
let say2:(String) -> Void = {
    (name: String) -> Void in
    print("hi \(name)")
}
say2("HaRi")

//无参数无返回值
let say3:() ->Void = {
    print("hello ")
}
say3()

/*
 逃逸闭包:
 当一个闭包作为参数传到一个函数中，需要这个闭包在函数返回之后才被执行，我们就称该闭包从函数种逃逸。
 一般如果闭包在函数体内涉及到异步操作，但函数却是很快就会执行完毕并返回的，闭包必须要逃逸掉，以便异步操作的回调。
 逃逸闭包一般用于异步函数的回调，比如网络请求成功的回调和失败的回调。语法：在函数的闭包行参前加关键字“@escaping”。
 @escaping标记可以作为一个警告，来提醒使用这个函数的开发者注意引用关系。
 */
func doSomething(some: @escaping() -> Void) {
    //延时操作, 注意这里的单位是秒
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
        // 1s后操作
        some()
    }
    print("函数体")
}

/*
 尾随闭包
 如果你需要将一个很长的闭包表达式作为最后一个参数传递给函数，可以使用尾随闭包来增强函数的可读性。
 尾随闭包是一个书写在函数括号之后的闭包表达式，函数支持将其作为最后一个参数调用。在使用尾随闭包时，你不用写出它的参数标签：
 */

func someFunctionThatTakesAClosure(closure: () -> Void) {
    // 函数体部分
}

// 以下是不使用尾随闭包进行函数调用
someFunctionThatTakesAClosure(closure: {
    // 闭包主体部分
})

// 以下是使用尾随闭包进行函数调用
someFunctionThatTakesAClosure() {
    // 闭包主体部分
}

