//
//  GestureView.swift
//  ComputersAndJazz
//
//  Created by Daniel Merrill on 11/11/21.
//

import SwiftUI

struct GestureView: View {
    
    @State var isDragging = false
    @State var translate: CGPoint = CGPoint(x: 0.0, y: 0.0)
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { val in
                self.isDragging = true
                self.translate.x = val.location.x - val.startLocation.x
                self.translate.y = val.location.y - val.startLocation.y
            }
            .onEnded { val in
                self.isDragging = false
                self.translate.x = 0.0
                self.translate.y = 0.0
                
            }
    }
    
    var body: some View {
        ZStack {
            Color.green
            Circle()
                .fill(self.isDragging ? Color.red : Color.blue)
                .animation(.spring(), value: self.isDragging)
                .frame(width: 100, height: 100, alignment: .center)
                .offset(x: self.translate.x, y: self.translate.y)
                .gesture(drag)
                

               
        }.navigationTitle("Gestures")
        

    }
}

struct GestureView_Previews: PreviewProvider {
    static var previews: some View {
        GestureView()
    }
}
