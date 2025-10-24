//
//  TodoViewModel.swift
//  Todo
//
//  Created by 현유진 on 10/6/25.
//

import Foundation
import Combine
import Utils

//@MainActor
public class TodoViewModel: ObservableObject {
  @Published var todos: [TaskItem] = []
  @Published var timerText: String = "Timer: 0s"
  @Published var isTimerRunning: Bool = false
  
  /// Combine은 내부적으로 구독 취소를 자동으로 수행
  /// 모든 Combine 구독을 한번에 관리
  /// cancellables가 해지되면 모든 구독이 한번에 정리
  private var cancellables = Set<AnyCancellable>()
  private var timerCounter = 0
  
  init() {
    Log.addLog("TodoViewModel initialized")
  }
  
  deinit {
    Log.addLog("TodoViewModel deallocated")
  
    print("Had \(todos.count) todos")
    print("Timer was \(isTimerRunning ? "running" : "stopped")")
  }
  
  // MARK: - Todo 관리
  
  func addTodo(title: String) {
    let todo = TaskItem(title: title)
    todos.append(todo)
    
    Log.addLog("Added: \(title)")
  }
  
  func removeTodo(at offsets: IndexSet) {
    let removed = offsets.map { todos[$0].title }
    todos.remove(atOffsets: offsets)
    
    removed.forEach {
      Log.addLog("Removed: \($0)")
    }
  }
  
  func clearAllTodos() {
    let count = todos.count
    todos.removeAll()
    Log.addLog("Cleared \(count) todos")
  }
  
  
  // MARK: - Timer 관리
  
  func startTimer() {
    guard !isTimerRunning else { return }
    isTimerRunning = true
    timerCounter = 0
    Log.addLog("Timer start")
    
    TimerService.every(1)
      .sink { [weak self] _ in
        guard let self else { return }
        
        self.timerCounter += 1
        self.timerText = "Timer: \(self.timerCounter)s"
      }
      .store(in: &cancellables)
  }
  
  func stopTimer() {
    guard isTimerRunning else { return }
    cancellables.removeAll()
    isTimerRunning = false
    Log.addLog("Timer stopped at \(timerCounter)s")
  }
  
  // MARK: - Fetch Todo
  
  func fetchTodosAsync() {
    Log.addLog("Fetching Todos...")
    
    Task { [weak self] in
      try? await Task.sleep(nanoseconds: 2_000_000_000)
      
      guard let self else {
        print("패치 동안 TodoViewModel 할당 해제됨")
        return
      }
      
      await MainActor.run {
        self.addTodo(title: "Fetched Todo \(Date().formatted(.dateTime.hour().minute()))")
        Log.addLog("Fetch completed.")
      }
    }
  }
}
