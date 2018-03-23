//
//  main.swift
//  函数
//
//  Created by Yealink89 on 2018/3/10.
//  Copyright © 2018年 Yealink89. All rights reserved.
//

import Foundation
//MARK: 函数的定义与调用
/*
 格式:
        func funcname(参数1,参数2...参数N) -> returnType
        {
            Statement 1
            ...
            Statement N
            retur parameters
        }
 */

//有参，有返回值
func apple(name: String, site: String) -> String {
    return name + site
}

print(apple(name: "Apple", site: "www.apple.com"))

//无参无返回数返回值
func function1()->Void
{
    print("function1")
}

func function2()   //void可以省略
{
    print("function2!!")
}

// MARK:函数参数和返回值

//协议作为参数
protocol Player{  // 定义协议
    func play()
}

func playMusicWithPlayer(player:Player){
    player.play()
}

//结构体作为参数
struct Student{
    var name:String
    var age:Int
};

func getStudentDescription(student:Student){
    print(student.name)
    print(student.age)
}

//元组作为函数返回值
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

var ccc = minMax(array: [9,-2,555,32,7,23])
print(ccc.min)

//MARK:参数标签
/*
解析：每个函数参数都有一个参数标签( argument label)以及一个参数名称( parameter name)。
 参数标签在调用函数的时候使用;调用的时候需要将函数的参数标签写在对应的参数前面。
 参数名称在函数的实现中使用。默认情况下，函数参数使用参数名称来作为它们的参数标签。

 指定参数标签:
 你可以在函数名称前指定它的参数标签，中间以空格分隔:
*/

func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
let a = greet(person: "zhansan", from: "chinese")

//忽略参数标签 如果不希望为某个参数添加一个标签，可以使用一个下划线(_)来代替一个明确的参数标签。
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    // 在函数体内，firstParameterName 和 secondParameterName 代表参数中的第一个和第二个参数值
}
//someFunction(1, 2) ❌
someFunction(1, secondParameterName: 2)

//MARK:可变参数
/*通过在变量类型名后面加入（...）的方式来定义可变参数。
  可变参数的传入值在函数体中变为此类型的一个数组，并且一个函数最多只能有一个可变参数
 */
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
let value = arithmeticMean(3, 8.25, 18.75)

//MARK:输入输出参数
/* 定义一个输入输出参数时，在参数定义前加 inout 关键字
   能传递变量给输入输出参数。你不能传入常量或者字面量
*/
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)

//MARK:函数类型
/*
 * 每个函数都有种特定的函数类型，函数的类型由函数的参数类型和返回类型组成。
 */

//(Int, Int) -> Int
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunction: (Int, Int) -> Int = addTwoInts
var assss = addTwoInts

let result = assss(4, 5);
print("result=\(result)");

//MARK:嵌套函数
func chooseStepFunction(backward: Bool) -> (Int) -> Int {//（函数类型作为返回值）
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}

var currentValue = -4
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
