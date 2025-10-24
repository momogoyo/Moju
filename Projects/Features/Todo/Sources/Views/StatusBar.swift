//
//  StatusBar.swift
//  Todo
//
//  Created by 현유진 on 10/24/25.
//

import SwiftUI

struct StatusBar: View {
  @StateObject var todoViewModel: TodoViewModel = TodoViewModel()
  
  var body: some View {
    HStack {
      VStack(alignment: .leading, spacing: 4) {
        Text("\(todoViewModel.timerText)")
          .font(.caption)
          .foregroundStyle(.secondary)
        
        Text("\(todoViewModel.todos.count)")
          .font(.caption2)
          .foregroundStyle(.secondary)
      }
      
      Spacer()
      
      HStack(spacing: 12) {
        Button(todoViewModel.isTimerRunning ? "Stop Timer" : "Start Timer") {
          if todoViewModel.isTimerRunning {
            todoViewModel.stopTimer()
          } else {
            todoViewModel.startTimer()
          }
        }
        .font(.caption)
        .buttonStyle(.bordered)
        
        Button("Fetch Async") {
          todoViewModel.fetchTodosAsync()
        }
        .font(.caption)
        .buttonStyle(.bordered)
      }
    }
    .padding()
    .background(Color(.secondarySystemBackground))
  }
}

#Preview {
  StatusBar()
}
