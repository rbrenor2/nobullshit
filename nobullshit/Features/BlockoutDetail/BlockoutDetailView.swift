//
//  BlockoutDetailView.swift
//  nobullshit
//
//  Created by Breno R R on 01/06/2024.
//

import SwiftUI

struct BlockoutDetailView: View {
    var blockout: Blockout
    
    var body: some View {
        NavigationView {
            List(blockout.blocks) { block in
                NavigationLink(destination: BlockDetailView(block: block)) {
                    BlockoutView(block: block)
                        .listRowInsets(EdgeInsets())
                }
            }
        }
    }
}

#Preview {
    
//    return BlockoutDetailView(blockout: blockoutSample)
}
