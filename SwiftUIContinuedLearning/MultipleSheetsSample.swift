//
//  MultipleSheetsSample.swift
//  SwiftUIContinuedLearning
//
//  Created by 0x2ab70001b1 on 2023/8/14.
//

import SwiftUI

// multiple sheets
struct ItemModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

struct MultipleSheetsSample: View {
    @State var selectItemModel: ItemModel? = nil
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(0..<20) { index in
                    Button("BUTTON \(index)") {
                        selectItemModel = ItemModel(title: "\(index)")
                    }
                }
            }
            .sheet(item: $selectItemModel) { itemModel in
                NextScreenView(itemModel: itemModel)
            }
        }
    }
}

struct NextScreenView: View {
    let itemModel: ItemModel
    var body: some View {
        Text(itemModel.title)
            .font(.largeTitle)
    }
}

struct MultipleSheetsSample_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSheetsSample()
    }
}
