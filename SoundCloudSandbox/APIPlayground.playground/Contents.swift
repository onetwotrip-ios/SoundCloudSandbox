//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let userID = 616201402
let client_id = "c23089b7e88643b5b839c4b8609fce3b"

var components = URLComponents()
components.scheme = "https"
components.host = "api.soundcloud.com"
components.queryItems = [URLQueryItem(name: "client_id", value: client_id)]

components.path = "/users/\(3732)"
let profileURL = components.url!

components.path = "/tracks"
let tracksURL = components.url!

let session = URLSession.shared

var task = session.dataTask(with: profileURL) { (data, response, _) in
    guard let data = data else {
        return
    }
    let json = try! JSONSerialization.jsonObject(with: data)
    
    print(json)
}

task.resume()

//task = session.dataTask(with: tracksURL) { (data, response, _) in
//    guard let data = data else {
//        return
//    }
//    let json = try! JSONSerialization.jsonObject(with: data)
//    
//    print(json)
//}

//task.resume()



PlaygroundPage.current.needsIndefiniteExecution = true 
