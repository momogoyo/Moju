//
//  Log.swift
//  Utils
//
//  Created by 현유진 on 10/24/25.
//

import Foundation

// 메모리 로그
public struct Log {
  private static var memoryLog: [String] = []
  
  public static func addLog(_ message: String) {
    let timestamp = Date().formatted(.dateTime.hour().minute().second())
    let entry = "[\(timestamp)] \(message)"
    
    memoryLog.insert(entry, at: 0)
    
    if memoryLog.count > 20 {
      memoryLog.removeLast()
    }
  }
}
