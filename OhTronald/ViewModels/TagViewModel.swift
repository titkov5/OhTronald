//
//  TagViewModel.swift
//  OhTronald
//
//  Created by Ivan Titkov on 17.10.2019.
//  Copyright © 2019 none. All rights reserved.
//

import Foundation


struct TagViewModel: Identifiable, Hashable {
    var id: Int
    var value: String
    var isFavorite: Bool
}
