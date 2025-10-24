//
//  TaskItem.swift
//  Todo
//
//  Created by 현유진 on 10/23/25.
//

import Foundation

final class TaskItem: Identifiable {
  let id = UUID()
  let title: String
  let createdAt = Date()
  
  init(title: String) {
    self.title = title
    print("TaskItem \(title), createdAt: \(createdAt.formatted(.dateTime.hour().minute().second()))")
  }
  
  deinit {
    print("TaskItem \(title) deallocated")
  }
}
