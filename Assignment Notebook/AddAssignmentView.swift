//
//  AddAssignmentView.swift
//  Assignment Notebook
//
//  Created by Dhanush Tipparaju on 1/31/23.
//

import SwiftUI

struct AddItemView: View {
    @ObservedObject var assignmentList: AssignmentList
    @State private var subject = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @Environment (\.presentationMode) var presentationMode
    static let subjects = ["Math", "Science", "English", "Social Studies", "History", "World Language", "Other"]
    var body: some View {
        NavigationView {
            Form {
                Picker("Subject", selection: $subject) {
                    ForEach(Self.subjects, id: \.self) { subject in
                        Text(subject)
                    }
                }
                TextField("Description", text: $description)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
            }
            .navigationBarTitle("Add Your Assignments", displayMode: .inline)
            .navigationBarItems(trailing: Button("Save"){
                if subject.count > 0 && description.count > 0 {
                    let items = AssignmentName(id: UUID(), subject: subject, description: description, dueDate: dueDate)
                    assignmentList.items.append(items)
                    presentationMode.wrappedValue.dismiss()
                }
            })
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView(assignmentList: AssignmentList())
    }
}
