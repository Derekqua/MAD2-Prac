import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var friendTextView: UILabel!
    @IBOutlet weak var friendUnder20: UILabel!
    @IBOutlet weak var test: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let friend1 = Friend(firstName: "Derek", lastName: "Lee", age: 18)
        let friend2 = Friend(firstName: "Wei Woon", lastName: "Tan", age: 80)
        let friend3 = Friend(firstName: "JiaJia", lastName: "Koh", age: 29)
        let friend4 = Friend(firstName: "Wayne", lastName: "An", age: 38)
        let friend5 = Friend(firstName: "Kyrene", lastName: "Koh", age: 50)
        
        var friendList:[Friend] = []
        friendList.append(friend1)
        friendList.append(friend2)
        friendList.append(friend3)
        friendList.append(friend4)
        friendList.append(friend5)
        
        func displayNames(){
            var names:String = ""
            print("All Friends")
            for i in friendList{
                print(i.firstName + " " + i.lastName)
                names += "Name: \(i.firstName) \(i.lastName)    Age:\(i.age) \n"
                
            }
            friendTextView.text = names
        }
        
        
        func displayFriendsUnder20(){
            var names:String = ""
            print("Friend under 20")
            for i in friendList{
                if (i.age < 20){
                    print(i.firstName + " " + i.lastName)
                    names += "Name: \(i.firstName) \(i.lastName)    Age:\(i.age) \n"
                }
            }
            friendUnder20.text = names
        }
        
        func findAverageAge()->Double {
            var sum:Int = 0
            for i in friendList{
                sum += i.age
            }
            let avg:Double = Double(sum/friendList.count)
            return avg
        }
                
        displayNames()
        displayFriendsUnder20()
        test.text = "Average Age: \(findAverageAge())"
        print(findAverageAge())
        
    }
}
