//
//  A Demo for iOS Development Tips Weekly
//  by Steven Lipton (C)2018, All rights reserved
//  For videos go to http://bit.ly/TipsLinkedInLearning
//  For code go to http://bit.ly/AppPieGithub
//
import UIKit

let coffees = ["Sumatra","Colombia","Dark Energy","Sarabanda Dark","Kona"]
let ratings = [2,2,-1,5]

enum CoffeeError:Error{
    case coffeeNotFound
    case ratingNotFound(coffee:String)
    case badRating
}

func coffee(_ name:String) throws -> String{
    let index = coffees.firstIndex{ (coffee) -> Bool in
        coffee == name
    }
    guard let ratingIndex  = index else {
        throw CoffeeError.coffeeNotFound
    }
    if ratingIndex >= ratings.count{
        throw CoffeeError.ratingNotFound(coffee: name)
    }
    let rating = ratings[ratingIndex]
    if rating < 0 {
        throw CoffeeError.badRating
    }
    return String(repeating:"☕️", count: rating)
}

var myCoffee = "Kona"

do{
    try print(myCoffee + ":" + coffee(myCoffee))
} catch CoffeeError.coffeeNotFound{
    print("\(myCoffee) not found")
} catch CoffeeError.ratingNotFound(let coffee){
    print ("\(coffee) does not have a rating")
} catch {
    print("Error")
}

if let coffeeRating = try? coffee(myCoffee){
    print(myCoffee + ":" + coffeeRating)
} else {
    print("Error")
}

myCoffee = "Sumatra"
try! print(myCoffee + ":" + coffee(myCoffee))
