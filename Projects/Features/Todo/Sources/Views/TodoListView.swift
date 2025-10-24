//
//  TodoListView.swift
//  Todo
//
//  Created by 현유진 on 10/6/25.
//

import SwiftUI
import Utils

public struct TodoListView: View {
  @StateObject private var todoViewModel: TodoViewModel = TodoViewModel()
  
  @State private var showTodoList: Bool = true
  @State private var testResults: [String] = []
  
  public init() {}
  
  public var body: some View {
    VStack(spacing: 0) {
      StatusBar()
      
      if showTodoList {
        List(todoViewModel.todos) { todo in
          HStack {
            VStack(alignment: .leading) {
              Text(todo.title)
                .font(.body)
              
              Text(todo.createdAt.formatted())
                .font(.caption2)
                .foregroundColor(.secondary)
            }
          }
        }
      }
      
      HStack {
        Menu("Test") {
          Button("Test 1: Basic ARC") { testBasicARC() }
          Button("Test 2: Retain Cycle") { testRetainCycle() }
          Button("Test 3: Weak Self") { testWeakSelf() }
          Divider()
          Button("Remove TestResults") { testResults.removeAll() }
        }
        
        Toggle("Show Todo List", isOn: $showTodoList)
          .toggleStyle(SwitchToggleStyle(tint: Color.purple))
      }
      .padding()
      
      ScrollView {
        VStack(alignment: .leading) {
          if !testResults.isEmpty {
            ForEach(testResults, id: \.self) { result in
              Text(result)
                .font(.caption)
                .foregroundStyle(.secondary)
            }
          }
        }
      }
    }
  }
  
  // MARK: - Test Function
  
  private func testBasicARC() {
    testResults.removeAll()
    testResults.append("=== Add Basic ARC ===")
    
    var item: TaskItem? = TaskItem(title: "Learn ARC")
    testResults.append("Created TaskItem")
    
    Delay.main(1) {
      item = nil
      testResults.append("Set item to nil (check console for deinit)")
    }
  }
  
  private func testRetainCycle() {
    testResults.removeAll()
    testResults.append("=== Add Retain Cycle ===")
    
    var manager: TodoManager? = TodoManager()
    manager?.addTodoWithStrongCapture()
    testResults.append("Added todo with STRONG capture.")
    
    Delay.main(0.5) {
      manager = nil
      testResults.append("Manager nil로 초기화")
      testResults.append("Check console - deinit이 불리지 않아!")
    }
  }
  
  private func testWeakSelf() {
    testResults.removeAll()
    testResults.append("=== Add Weak Self ===")
    
    var manager: TodoManager? = TodoManager()
    manager?.addTodoWithWeakCapture()
    testResults.append("Added todo with WEAK capture.")
    
    Delay.main(0.5) {
      manager = nil
      testResults.append("Manager nil로 초기화")
      testResults.append("Check console - deinit이 불렸을거야!")
    }
  }
}
