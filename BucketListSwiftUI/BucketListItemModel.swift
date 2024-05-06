//
//  BucketListItemModel.swift
//  BucketListSwiftUI
//
//  Created by user on 9/2/23.
//

import Foundation

struct BucketListItemModel: Identifiable, Equatable, Codable {
    var name: Float
    var id = UUID()
    var isCompleted: Bool = false
}
