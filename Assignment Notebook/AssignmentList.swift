//
//  AssignmentList.swift
//  Assignment Notebook
//
//  Created by Dhanush Tipparaju on 1/31/23.
//

import Foundation

class AssignmentList: ObservableObject {
    
    @Published var items : [AssignmentName] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "data")
            }
        }
    }
    init() {
        if let items = UserDefaults.standard.data(forKey: "data") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([AssignmentName].self, from: items) {
                self.items = decoded
                return
            }
        }
        items = []
    }
}
