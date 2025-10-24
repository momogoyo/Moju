//
//  TimerService.swift
//  Utils
//
//  Created by 현유진 on 10/24/25.
//

import Foundation
import Combine

public enum TimerService {
  
  /// 지정된 간격마다 이벤트를 방출하는 퍼블리셔를 반환
  /// - Parameters:
  ///   - interval: 타이머 간격(초)
  ///   - runLoop: 실행할 RunLoop (기본값: .main)
  ///   - mode: RunLoop 모드 (기본값: .common)
  /// - Returns: `AnyPublisher<Date, Never>`
  public static func every(
    _ interval: TimeInterval,
    on runLoop: RunLoop = .main,
    in mode: RunLoop.Mode = .common
  ) -> AnyPublisher<Date, Never> {
    Timer.publish(every: interval, on: .main, in: .common)
      .autoconnect()
      .eraseToAnyPublisher()
  }
}
