//
//  Delay.swift
//  Utils
//
//  Created by 현유진 on 10/24/25.
//

import Foundation

public enum Delay {
  public static func main(_ seconds: Double, execute work: @escaping() -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: work)
  }
  
  public static func background(_ seconds: Double, execute work: @escaping () -> Void) {
    DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + seconds, execute: work)
  }
}
