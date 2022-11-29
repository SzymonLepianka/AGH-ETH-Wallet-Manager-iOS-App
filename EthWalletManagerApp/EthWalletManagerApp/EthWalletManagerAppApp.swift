//
//  EthWalletManagerAppApp.swift
//  EthWalletManagerApp
//
//  Created by Guest User on 15/11/2022.
//

import SwiftUI
import CoreData

@main
struct EthWalletManagerAppApp: App {
    @State private var wallets = EthWallet.sampleData
    
    let persistenceController = PersistenceController.shared
    @Environment(\.scenePhase) var scenePhase

    var body: some Scene {
        WindowGroup {
            NavigationView {
                let _ = self.temp()  // compiles happily
//                let _ = self.temp2()  // compiles happily
                WalletView(wallets: $wallets)
            }
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
    }
    
    //odczyt z bazy
    func temp() {
        let fr = NSFetchRequest<NSManagedObject>(entityName: "EWallet")
        let moc = PersistenceController.shared.container.viewContext
        do {
            let names = try moc.fetch(fr)
            print("names.count:")
            print(names.count)
            for object in names {
                if let object = object as? EWallet {
                    print("EWallet:", object.title)
                }
            }
        } catch {
            print("Error")
        }
    }
    
    // zapis do bazy
    func temp2() {
        let moc = PersistenceController.shared.container.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "EWallet", in: moc)
        let person = NSManagedObject(entity: entity!, insertInto: moc)
        person.setValue("John Smith", forKey: "title")
        try? moc.save()
    }
}

