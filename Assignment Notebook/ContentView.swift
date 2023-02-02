//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Dhanush Tipparaju on 1/31/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var assignmentList = AssignmentList()
    @State private var showingAddItemView = false
    var body: some View {
        NavigationView {
            VStack {
                if assignmentList.items.count == 0 {
                    Text("Press the + to start planning")
                        .font(.title)
                        .bold()
                        .opacity(0.6)
                        .padding(80)
                }
                List {
                    ForEach(assignmentList.items) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.subject)
                                    .font(.headline)
                                Text(item.description)
                            }
                            Spacer()
                            Text(item.dueDate, style: .date)
                        }
                    }
                    .onMove {indices, newOffset in
                        assignmentList.items.move(fromOffsets: indices, toOffset: newOffset)
                    }
                    .onDelete { IndexSet in
                        assignmentList.items.remove(atOffsets: IndexSet)
                    }
                }
                .sheet(isPresented: $showingAddItemView, content: {
                    AddItemView(assignmentList: assignmentList)
                })
                .navigationBarTitle("Assignment Planner", displayMode: .inline)
                .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                    showingAddItemView = true }) {
                        Image(systemName: "plus")
                    })
            }
            .background(.green.opacity(0.7))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AssignmentName: Identifiable, Codable {
    var id = UUID()
    var subject: String
    var description: String
    var dueDate = Date()
}
