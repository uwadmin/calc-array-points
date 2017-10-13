//
//  main.swift
//  CalcArrayPoints
//
//  Created by ​ on 10/12/17.
//  Copyright © 2017 iGuest. All rights reserved.
//

import Foundation

extension String: Error {
}

extension Double {
    var clean: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}

func add(_ operandA: Int, _ operandB: Int) -> String {
    return (Double(operandA) + Double(operandB)).clean
}

func sub(_ operandA: Int, _ operandB: Int) -> String {
    return (Double(operandA) - Double(operandB)).clean
}

func mul(_ operandA: Int, _ operandB: Int) -> String {
    return (Double(operandA) * Double(operandB)).clean
}

func div(_ operandA: Int, _ operandB: Int) -> String {
    return (Double(operandA) / Double(operandB)).clean
}

func calc(_ cmd: String, _ operandA: Int, _ operandB: Int) throws -> String {
    switch cmd {
    case "add": return add(operandA, operandB)
    case "subtract": return sub(operandA, operandB)
    case "multiply": return mul(operandA, operandB)
    case "divide": return div(operandA, operandB)
    default:
        throw "error"
    }
}

func addArray(_ arr: [Int]) -> String {
    var result: Int = 0
    for num in arr {
        result += num
    }
    return String(result)
}

func mulArray(_ arr: [Int]) -> String {
    var result = 1
    for num in arr {
        result *= num
    }
    return String(result)
}

func count(_ arr: [Int]) -> String {
    return String(arr.count)
}

func avg(_ arr: [Int]) -> String {
    var sum = 0
    for num in arr {
        sum += num
    }
    return (Double(sum) / Double(arr.count)).clean
}

func calcArray(_ cmd: String, _ arr: [Int]) throws -> String {
    switch cmd {
    case "add": return addArray(arr)
    case "mul": return mulArray(arr)
    case "count": return count(arr)
    case "avg": return avg(arr)
    default:
        throw "error"
    }
}

func addTuple(_ PointA: (x: Int, y: Int), _ PointB: (x: Int, y: Int)) -> (Int, Int) {
        return (PointA.x + PointB.x, PointA.y + PointB.y)
}

func subTuple(_ PointA: (x: Int, y: Int), _ PointB: (x: Int, y: Int)) -> (Int, Int) {
        return (PointA.x - PointB.x, PointA.y - PointB.y)
}

func addDict(_ PointA: [String: Int], _ PointB: [String: Int]) throws -> [String: Int] {
    if (valid(PointA, "x") && valid(PointA, "y") && valid(PointB, "x") && valid(PointB, "x")) {
        return ["x": PointA["x"]! + PointB["x"]!, "y": PointA["y"]! + PointB["y"]!]
    } else {
        throw "error"
    }

}

func subDict(PointA: [String: Int], PointB: [String: Int]) throws -> [String: Int] {
    if (valid(PointA, "x") && valid(PointA, "y") && valid(PointB, "x") && valid(PointB, "x")) {
        return ["x": PointA["x"]! - PointB["x"]!, "y": PointA["y"]! - PointB["y"]!]
    } else {
        throw "error"
    }
}

func addDict(_ PointA: [String: Double], _ PointB: [String: Double]) throws -> [String: Double] {
    if (valid(PointA, "x") && valid(PointA, "y") && valid(PointB, "x") && valid(PointB, "x")) {
        return ["x": PointA["x"]! + PointB["x"]!, "y": PointA["y"]! + PointB["y"]!]
    } else {
        throw "error"
    }

}

func subDict(PointA: [String: Double], PointB: [String: Double]) throws -> [String: Double] {
    if (valid(PointA, "x") && valid(PointA, "y") && valid(PointB, "x") && valid(PointB, "x")) {
        return ["x": PointA["x"]! - PointB["x"]!, "y": PointA["y"]! - PointB["y"]!]
    } else {
        throw "error"
    }
}

func valid(_ dict: [String: Int], _ key: String) -> Bool {
    var count = 0;
    for key in dict.keys {
        if (key == key) {
            count += 1
        }
    }
    return count == 1 && dict.keys.contains(key)
}

func valid(_ dict: [String: Double], _ key: String) -> Bool {
    var count = 0;
    for key in dict.keys {
        if (key == key) {
            count += 1
        }
    }
    return count == 1 && dict.keys.contains(key)
}

print(add(1,2))
print(sub(3,4))
print(mul(5, 6))
print(div(10, 3))
print(try calc("add", 1, 2))
print(addArray([1, 2, 3]))
print(mulArray([1, 2, 3]))
print(count([1, 2, 3]))
print(avg([1,2,3,4,5,6]))
print(try calcArray("add", [1, 2, 3]))
print(addTuple((3,4), (1,2)))
print(try addDict(["x": 1.0], ["y": 2.0]))