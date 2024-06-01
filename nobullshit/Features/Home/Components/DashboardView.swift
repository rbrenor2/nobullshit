//
//  DashboardView.swift
//  nobullshit
//
//  Created by Breno R R on 31/05/2024.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Just")
                .font(.largeTitle)
                .fontWeight(.bold)
            GeometryReader { geometry in
                ThinArrow()
                    .stroke(Color.black, lineWidth: 2)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
            }
            Button(action: {
                // Define the action to be taken when the button is tapped
                print("Image button tapped!")
            }) {
                Image("fire") // Replace "example" with the name of your PNG image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
            }
            Spacer()
        }.frame(maxWidth: .infinity)
        .alignmentGuide(.leading) { d in d[.leading] }
    }
}

#Preview {
    DashboardView()
}
