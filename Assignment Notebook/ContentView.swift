//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Dhanush Tipparaju on 1/31/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Filler Space")
                    .navigationBarTitle("Assignment Notebook", displayMode: .inline)
            }
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
