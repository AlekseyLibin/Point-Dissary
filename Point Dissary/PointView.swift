//
//  PointView.swift
//  Point Dissary
//
//  Created by Aleksey Libin on 28.09.2023.
//
import SwiftUI

struct PointView: View {
  @State var offsetX: CGFloat
  @State var offsetY: CGFloat
  
  @State var offsetX2: CGFloat
  @State var offsetY2: CGFloat
  
  var color1: Color
  var color2: Color
  
  init(color1: Color, color2: Color) {
    self.color1 = color1
    self.color2 = color2
    
    let offsetX = CGFloat.random(in: -300...300)
    let offsetY = CGFloat.random(in: -700...700)

    
    self.offsetX = offsetX
    self.offsetY = offsetY
    
    self.offsetX2 = offsetX
    self.offsetY2 = offsetY
  }
  
  var body: some View {
    ZStack {
      Circle()
        .frame(width: 150)
        .offset(x: offsetX, y: offsetY)
        .foregroundStyle(color1)
        .blur(radius: 50)
        .contrast(4)
      
      Circle()
        .frame(width: 120)
        .offset(x: offsetX2, y: offsetY2)
        .foregroundStyle(color2)
        .blur(radius: 30)
        .contrast(4)
      
    }.onAppear {
      changePosition()
    }
  }
  
  private func changePosition() {
    let randomOffsetX = CGFloat.random(in: -300...300)
    withAnimation(Animation.easeInOut(duration: 12)) {
      offsetX = randomOffsetX
      offsetX2 = randomOffsetX + CGFloat.random(in: -60...60)
    }
    
    let randomOffsetY = CGFloat.random(in: -700...700)
    withAnimation(Animation.easeInOut(duration: 12)) {
      offsetY = randomOffsetY
      offsetY2 = randomOffsetY + CGFloat.random(in: -60...60)
    }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
      self.changePosition()
    }
  }
}

struct Point_Previews: PreviewProvider {
  static var previews: some View {
    PointDissaryView()
  }
}
