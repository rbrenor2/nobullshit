//
//  DashboardView.swift
//  nobullshit
//
//  Created by Breno R R on 31/05/2024.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: BlockoutDetailView(blockout: blockoutSample)) {
                    VStack {
                        Spacer()
                        Text("Blockout of the Day")
                            .font(.largeTitle)
                            .fontWeight(.bold)
            //            GeometryReader { geometry in
            //                ThinArrow()
            //                    .stroke(Color.black, lineWidth: 2)
            //                    .frame(width: geometry.size.width, height: geometry.size.height)
            //                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2)
            //            }
                        Image("fire") // Replace "fire" with the name of your PNG image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                        Spacer()
                    }.frame(maxWidth: .infinity)
                    .alignmentGuide(.leading) { d in d[.leading] }
                }
                .buttonStyle(PlainButtonStyle()) // Optional: Remove default button styling
            }
        }
        
    }
}

#Preview {
    DashboardView()
}
