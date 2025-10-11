//
//  SkeletonView.swift
//  News
//
//  Created by 현유진 on 10/11/25.
//

import SwiftUI

// MARK: - SkeletonShape
//public enum SkeletonShape {
//  case rect
//  case circle
//  case roundedRectangle(radius: CGFloat)
//  
//  var shape: some Shape {
//    switch self {
//    case .rect:
//      return Rectangle()
//    case .circle:
//      return Circle()
//    case .roundedRectangle(let radius):
//      return RoundedRectangle(cornerRadius: radius)
//    }
//  }
//}

// MARK: - SkeletonView
public struct SkeletonView<S: Shape>: View {
  var shapeType: S
  var color: Color
  
  @State private var isAnimating: Bool = false
  
  public init(
    _ shapeType: S,
    _ color: Color = .gray.opacity(0.3)
  ) {
    self.shapeType = shapeType
    self.color = color
  }
  
  public var body: some View {
    let shape = shapeType
    
    shape
      .fill(color)
      .overlay {
        GeometryReader {
          let size = $0.size
          let skeletonWidth = size.width / 2
          let blurRadius: CGFloat = max(skeletonWidth / 2, 30)
          let blurDiametter = blurRadius * 2
          let minX = -(skeletonWidth + blurDiametter)
          let maxX = size.width + skeletonWidth + blurDiametter
          
          Rectangle()
            .fill(.gray)
            .frame(width: skeletonWidth, height: size.height / 2)
            .frame(height: size.height)
            .blur(radius: blurRadius)
            .rotationEffect(.degrees(rotation))
            .blendMode(.softLight)
            .offset(x: isAnimating ? maxX : minX)
        }
        .clipShape(shape)
        .compositingGroup()
        .onAppear {
          guard !isAnimating else { return }
          withAnimation(animation) {
            isAnimating = true
          }
        }
        .onDisappear {
          isAnimating = false
        }
      }
  }
  
  var rotation: Double {
    5
  }
  
  var animation: Animation {
    .easeInOut(duration: 1.5).repeatForever(autoreverses: false)
  }
}

#Preview {
  @Previewable
  @State var isTapped: Bool = false
  
  SkeletonView(.rect)
    .frame(width: 100, height: 100)
    .onTapGesture {
      withAnimation(.smooth) {
        isTapped.toggle()
      }
    }
    .padding(.bottom, isTapped ? 15 : 0)
}
