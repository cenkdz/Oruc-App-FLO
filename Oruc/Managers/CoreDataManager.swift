//
//  CoreDataManager.swift
//  Oruc
//
//  Created by Cenk Donmez on 3.07.2023.
//

import Foundation
import CoreData


class CoreDataManager{
    
    
    static let shared = CoreDataManager(modelName: "Fasting")
    
    let persistentContainer: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext{
        return persistentContainer.viewContext
    }
    
    init(modelName: String){
        persistentContainer = NSPersistentContainer(name: modelName)
    }
    
    func load(completion: (() -> Void)? = nil){
        persistentContainer.loadPersistentStores{
            (description, error) in
            guard error == nil else{
                fatalError(error!.localizedDescription)
            }
            completion?()
        }
    }
    
    func save(){
        if viewContext.hasChanges{
            do{
                try viewContext.save()
            }catch{
                print("Error when trying to save! \(error.localizedDescription)")
            }
        }
    }
    
    // CRUD FUNCTIONS

}


extension CoreDataManager{
    
    
    //MARK: - HELPERS
    
    func createUser() -> User{
        let user = User(context: viewContext)
        
        save()
        return user
    }
    
//    func createTimer() -> FastingTimer{
//        
//    }
    
    
    func getUserData() -> [User] {
        let request: NSFetchRequest<User> = User.fetchRequest()
        
        do{
            return try viewContext.fetch(request)
        }catch{
        }
        return []
    }
    
    func createTimer() -> FastingTimer{
        let timer = FastingTimer(context: viewContext)
        
        save()
        return timer
    }
    
    func getTimerData() -> [FastingTimer] {
        let request: NSFetchRequest<FastingTimer> = FastingTimer.fetchRequest()
        
        do{
            return try viewContext.fetch(request)
        }catch{
        }
        return []
    }
    
    func deleteTimer(timer: FastingTimer){
        viewContext.delete(timer)
        save()
    }
    
    func addFast(start: Date, end: Date){
        let fast = FData(context: viewContext)
        
        fast.startDate = start
        fast.endDate = end
        
        save()
    }
    
    func getFasts() -> [FData]{
        let request: NSFetchRequest<FData> = FData.fetchRequest()
        
        do{
            return try viewContext.fetch(request)
        }catch{
        }
        return []
    }
}
