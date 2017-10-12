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

func add(_ arr: [Int]) -> String {
    var result: Int = 0
    for num in arr {
        result += num
    }
    return String(result)
}

func mul(_ arr: [Int]) -> String {
    var result = 0
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

func calc(cmd: String, arr: [Int]) throws -> String {
    switch cmd {
    case "add": return add(arr)
    case "mul": return mul(arr)
    case "count": return count(arr)
    case "avg": return avg(arr)
    default:
        throw "error"
    }
}

func add(_ PointA: (x: Int, y: Int), _ PointB: (x: Int, y: Int)) throws -> (x: Int, y: Int) {
    if Mirror(reflecting: PointA).children.count != 2 || Mirror(reflecting: PointB).children.count != 2 {
        throw "error"
    } else {
        return (PointA.x + PointB.x, PointA.y + PointB.y)
    }
}

func sub(_ PointA: (x: Int, y: Int), _ PointB: (x: Int, y: Int)) throws -> (x: Int, y: Int) {
    if Mirror(reflecting: PointA).children.count != 2 || Mirror(reflecting: PointB).children.count != 2 {
        throw "error"
    } else {
        return (PointA.x - PointB.x, PointA.y - PointB.y)
    }
}

func add(_ PointA: [String: Int], _ PointB: [String: Int]) throws -> [String: Int] {
    if (valid(PointA, "x") && valid(PointA, "y") && valid(PointB, "x") && valid(PointB, "x")) {
        return ["x": PointA["x"]! + PointB["x"]!, "y": PointA["y"]! + PointB["y"]!]
    } else {
        throw "error"
    }

}

func sub(PointA: [String: Int], PointB: [String: Int]) throws -> [String: Int] {
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