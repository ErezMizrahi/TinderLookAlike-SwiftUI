//
//  MyObserver.swift
//  TinderSwiftUI
//
//  Created by Erez Mizrahi on 09/12/2019.
//  Copyright © 2019 Erez Mizrahi. All rights reserved.
//

import Foundation
import SwiftUI
import Firebase

enum Status: String {
    case like
    case dislike
    case none = ""
}

class MyObserver: ObservableObject {
    @Published var users = [DataTypes]()
    @Published var last = -1
    
    init() {
        getFireStoreData()
    }
    
    
    private func getFireStoreData() {
        let db = Firestore.firestore()
        
        db.collection("users").getDocuments { (snap , err) in
            if err != nil {
                print(err?.localizedDescription)
                return
            }
            guard let documents = snap?.documents else { return }
            for user in documents {
                let name = user.get("name") as! String
                let image = user.get("image") as! String
                let age = user.get("age") as! String
                let status = user.get("status") as! String
                let id = user.documentID
                
//                if status != "dislike" {
                    if status == "" {
                    self.users.append(DataTypes.init(id: id,
                                                     name: name,
                                                     image: image,
                                                     age: age,
                                                     swipe: 0,
                                                     degree: 0))
                }
            }
        }
    }
    
    func updateDataBase(id: DataTypes, status: Status) {
        let db = Firestore.firestore()
        db.collection("users").document(id.id)
            .updateData(["status": status.rawValue]) { err in
                if err != nil  {
                    print(err?.localizedDescription)
                    return
                }
                
                for index in 0..<self.users.count {
                    if self.users[index].id == id.id {
                        if status == .like {
                            self.users[index].swipe = 500
                            self.last = index

//                            self.update(id: self.users[index], value: 500, degree: 0)
                        } else if status == .dislike {
                            self.users[index].swipe = -500
                            self.last = index

//                            self.update(id: self.users[index], value: -500, degree: 0)

                        } else {
                            self.users[index].swipe = 0
                            self.last = index

                        }
                    }
                }
        }
    }
    
    
    func update(id: DataTypes, value: CGFloat, degree: Double) {
        for index in 0..<users.count {
            if users[index].id == id.id {
                users[index].swipe = value
                users[index].degree = degree
                self.last = index
            }
        }
    }
    
    
//    func goBack(index: Int) {
//        users[index].swipe = 0
//
//    }
}


struct DataTypes: Identifiable {
    var id: String
    var name: String
    var image: String
    var age: String
    var swipe: CGFloat
    var degree: Double
}
