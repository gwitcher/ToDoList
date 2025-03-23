//
//  DetailView.swift
//  ToDoList
//
//  Created by Gabe Witcher on 3/22/25.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    @State var toDo: ToDo
    @State private var item = ""
    @State private var reminderIsOn = false
    //    @State private var dueDate = Date.now + 60*60*24
    @State private var dueDate = Calendar.current.date(byAdding: .day, value: 1, to: .now)!
    @State private var notes = ""
    @State private var isCompleted = false
    @Environment(\.modelContext) var modelContext
    
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        List {
            TextField("Enter To Do Here", text: $item)
                .font(.title)
                .textFieldStyle(.roundedBorder)
                .padding(.vertical)
                .listRowSeparator(.hidden)
            
            Toggle("Set Reminder", isOn: $reminderIsOn)
                .padding(.top)
                .listRowSeparator(.hidden)
            
            DatePicker("Date", selection: $dueDate)
                .listRowSeparator(.hidden)
                .padding(.bottom)
                .disabled(!reminderIsOn)
            
            Text("Notes:")
                .padding(.top)
            
            TextField("Notes", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .listRowSeparator(.hidden)
            
            Toggle("Completed", isOn: $isCompleted)
                .padding(.top)
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .onAppear() {
            //move data from toDo object to local vars
            item = toDo.item
            reminderIsOn = toDo.reminderIsOn
            dueDate = toDo.dueDate
            notes = toDo.notes
            isCompleted = toDo.isCompleted
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    //Move data from local vars to toDo Object
                    toDo.item = item
                    toDo.reminderIsOn = reminderIsOn
                    toDo.dueDate = dueDate
                    toDo.notes = notes
                    toDo.isCompleted = isCompleted
                    modelContext.insert(toDo)
                    guard let _ = try? modelContext.save() else {
                        print("😡 Shit didn't work, brah")
                        return
                    }
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        DetailView(toDo: ToDo())
            .modelContainer(for: ToDo.self, inMemory: true)
    }
}

