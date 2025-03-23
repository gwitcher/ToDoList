//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Gabe Witcher on 3/22/25.
//

import SwiftUI
import SwiftData

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            ToDoListView()
                .modelContainer(for: ToDo.self)
        }
    }
    
    //prints path to simulator data
    init() {
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
