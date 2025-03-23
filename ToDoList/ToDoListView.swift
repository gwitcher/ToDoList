//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Gabe Witcher on 3/22/25.
//

import SwiftUI

struct ToDoListView: View {
    
    var toDos = ["Learn Swift",
                 "build Apps",
                 "Change the Word",
                 "Be Awesome",
                 "Take a Vacation"
    ]
    var body: some View {
        NavigationStack{
            List {
                ForEach(toDos, id: \.self) { toDo in
                    NavigationLink {
                        DetailView(passedValue: toDo)
                    } label: {
                        Text(toDo)
                    }

                    
                }
            }
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
        }
    }
}

#Preview {
    ToDoListView()
}
