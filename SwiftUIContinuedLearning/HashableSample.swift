//
//  HashableSample.swift
//  SwiftUIContinuedLearning
//
//  Created by 0x2ab70001b1 on 2023/8/16.
//

import SwiftUI

//struct CustomModel: Identifiable {
//    let id: String = UUID().uuidString
//    let title: String
//    let subTitle: String
//}

// 实现了 Hashable 后，重写 hash 方法，因为有 hash 值，所以会创造一个唯一的标识。
struct CustomModel: Hashable {
//    let id: String = UUID().uuidString
    let title: String
    let subTitle: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title + title)
    }
}

/**
 方法一：
 实现 *Identifiable*，实现 *id* 属性
 
 方法二：
 实现 *Hashable* 协议，
 重写 `func hash(into hasher: inout Hasher) {}` 方法
 
 */

struct HashableSample: View {
    var data: [CustomModel] = [
        CustomModel(title: "1", subTitle: "11"),
        CustomModel(title: "2", subTitle: "22"),
        CustomModel(title: "3", subTitle: "33"),
        CustomModel(title: "4", subTitle: "44"),
    ]
    
    var body: some View {
        ScrollView {
            ForEach(data, id: \.self) { item in
                Text(item.title)
                    .font(.largeTitle)
            }
        }
    }
}

struct HashableSample_Previews: PreviewProvider {
    static var previews: some View {
        HashableSample()
    }
}
