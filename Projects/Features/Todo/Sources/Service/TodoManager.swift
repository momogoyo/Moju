//
//  TodoManager.swift
//  Todo
//
//  Created by 현유진 on 10/23/25.
//

import Foundation
import Utils

final class TodoManager: ObservableObject {
  var todos: [TaskItem] = []
  
  func addTodoWithStrongCapture() {
    print("Adding todo with STRONG capture.")
    
    Delay.main(2) {
      print("이건 강한 참조를 하는 경우 \(self.todos.count)")
    }
  }
  
  func addTodoWithWeakCapture() {
    print("Adding todo with WEAK capture.")
    
    Delay.main(2) { [weak self] in
      guard let self else {
        print("self는 이미 할당 해제 - 클로저는 실행되지 않는다.")
        return
      }
      
      print("약한 클로저 캡처 실행")
      print("Safely todos: \(self.todos.count)")
    }
  }
}
