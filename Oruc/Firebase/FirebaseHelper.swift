//
//  FirebaseHelper.swift
//  Oruc
//
//  Created by Cenk Donmez on 5.07.2023.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
final class FirebaseHelper{
    static let shared = FirebaseHelper()
    
    let db = Firestore.firestore()
    
    let downloadGroup = DispatchGroup()
    
    private var user: FUser?
    
    private init() { }
    //test
    func login(email: String, password: String, completion: @escaping(Bool) -> Void){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2)
        {[weak self] in
            if email == "c@c.com" && password == "user123"{
                //                self?.user = FUser(name: "Cenk", gender: "Male", age: Date(), height: 186, weight: 88.8, targetWeight: 70.0, prefferedFProgram: FProgram(name: "hehe", length: 123123.0))
                completion(true)
            }else{
                self?.user = nil
                completion(false)
            }
        }
    }
    
    func addFastingData(startDate: Date, endDate: Date){
        // Add a new document with a generated id.
        var ref: DocumentReference? = nil
        ref = db.collection("fasts").addDocument(data: [
            "startDate": startDate.timeIntervalSince1970,
            "endDate": endDate.timeIntervalSince1970,
            "duration": endDate.timeIntervalSince(startDate),
            "uid": Auth.auth().currentUser?.uid as Any
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    func addUserWeight(date: Date, weight: Decimal){
        var ref: DocumentReference? = nil
        ref = db.collection("weight").addDocument(data: [
            "date": date.timeIntervalSince1970,
            "weight": weight,
            "uid": Auth.auth().currentUser?.uid as Any
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
        
    }
}

//func myCriticalFunction() {
//    var value1: String?
//    var value2: String?
//
//
//
//
//
//    //async operation 1
//    DispatchQueue.global(qos: .default).async {
//        // Network calls or some other async task
//        value1 = //out of async task
//
//    }
//
//
//    group.enter()
//    //async operation 2
//    DispatchQueue.global(qos: .default).async {
//        // Network calls or some other async task
//        value2 = //out of async task
//        group.leave()
//    }
//
//
//
//
//    print("Value1 \(value1) , Value2 \(value2)")
//}


