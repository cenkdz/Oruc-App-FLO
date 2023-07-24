//
//  FirebaseViewModel.swift
//  Oruc
//
//  Created by Cenk Donmez on 21.07.2023.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import SwiftUI

class FirebaseViewModel: ObservableObject {
    
    @Published var fasts = [Fast]()
    
    @Published var weights = [Weight]()
    
    private var db = Firestore.firestore()
    
    private var auth = Auth.auth()
    
    
    func getData() async -> [Fast] {
      await withCheckedContinuation { continuation in
          db.collection("fasts").whereField("uid", isEqualTo: auth.currentUser?.uid)
              .getDocuments() { (querySnapshot, err) in
                  if let err = err {
                      print("Error getting documents: \(err)")
                  } else {
                      for document in querySnapshot!.documents {
                          print("\(document.documentID) => \(document.data())")
                          
                          let data = document.data()
                          let startDate = data["startDate"] as? Date ?? Date()
                          let endDate = data["endDate"] as? Date ?? Date()
                          let duration = data["duration"] as? TimeInterval ?? 0.0
                          
                          self.fasts.append(Fast(startDate: startDate, endDate: endDate, duration: duration))
                      }
                      continuation.resume(returning: self.fasts)
                  }
          }
      }
    }
}
