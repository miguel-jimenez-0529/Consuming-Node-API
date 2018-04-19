//
//  ViewController.swift
//  Consuming Node API
//
//  Created by Macbook Pro on 18/04/18.
//  Copyright © 2018 Macbook Pro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        callWebservice()
    }
    
    func callWebservice() {
        do {
            let data = try Data.init(contentsOf: URL(string: "http://localhost:8080/users")!)
            let decoder = JSONDecoder()
            let users = try decoder.decode([User].self, from: data)
            print(users)
        }
        catch {
            print(error.localizedDescription)
        }
    }
}

class User: Codable, CustomStringConvertible {
    var id : String
    var name : String
    var lastName : String
   
    var description: String {
        return "\(name), \(lastName), \(id)"
    }
}

