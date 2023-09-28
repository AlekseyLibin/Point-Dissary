//
//  PointDissaryView.swift
//  Point Dissary
//
//  Created by Aleksey Libin on 28.09.2023.
//

import SwiftUI

struct PointDissaryView: View {
  @State var hue: Double = 0
  
  var body: some View {
    ZStack {
      Group {
        Color.black
        Color.blue.opacity(0.2)
      }.ignoresSafeArea()
      ForEach(0...2, id: \.self) { _ in
        PointView(color1: .purple, color2: .indigo)
      }.scaleEffect(2)
       .blur(radius: 20)
      ForEach(0...2, id: \.self) { _ in
        PointView(color1: .purple, color2: .indigo)
      }.contrast(1)
       .blur(radius: 20)
    }.hueRotation(Angle(degrees: 10))
      .onAppear {
        changeHue()
      }
  }
  
  private func changeHue() {
    withAnimation(Animation.easeInOut(duration: 2)) {
      hue += 1
    }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      self.changeHue()
    }
  }
}

struct PointDissary_Previews: PreviewProvider {
  static var previews: some View {
    PointDissaryView()
  }
}
