//
//  CYC_TCAApp.swift
//  CYC_TCA
//
//  Created by 강치우 on 3/25/24.
//

import SwiftUI
import SwiftData
import UserNotifications

@main
struct CYC_TCAApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    // MARK: - SwiftData 컨테이너
    var sharedModelContainer: ModelContainer = {
        do {
            let schema = Schema([
                Todo.self,
            ])
            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear(perform: UIApplication.shared.addTapGestureRecognizer)
                
        }
        .modelContainer(sharedModelContainer)
    }
}
