import UIKit

//Question 1
for i in 1...20{
    print(i)
}

//Question 2
for i in 1...20{
    if i%2 != 0{
        print(i)
    }
}

//Question 3
var sum = 0
for i in 1...20{
    if i%2 != 0{
        sum+=i
    }
}
print(sum)

//Question 4
func result(mark: Int)-> String{
    if(mark >= 50){
        return "Pass"
    }
    return "Fail"
}
result(mark: 30)
result(mark: 80)

//Question 5
import Foundation
func generateArray(length: Int)->[Int]{
    var array = [Int]();
    for _ in 1...length{
        array.append(Int(arc4random_uniform(100)))
    }
    return array
}

func findMax(n: [Int])->Int{
    var max = 0;
    for i in 0..<n.count{
        if n[i]>max{
            max = n[i]
        }
    }
    return max
}

findMax(n: generateArray(length: 10))

//Question 6
func findMin(n:[Int])->Int{
    var min = Int(INT8_MAX)
    for i in 0..<n.count{
        if n[i]<min{
            min = n[i]
        }
    }
    return min
}

findMin(n: generateArray(length: 10))

//Question 7
func findAverage(n:[Int])->Int{
    var sum = 0
    for i in 0..<n.count{
        sum+=n[i]
    }
    let average = sum/n.count
    return average
}
print("The average of the numbers in the arrray is ",findAverage(n: generateArray(length: 10)))
