//
//  ModelsStakeholder.swift
//  OhTronald
//
//  Created by Ivan Titkov on 13.10.2019.
//  Copyright © 2019 none. All rights reserved.
//

import Foundation
import Combine

final class AppState: ObservableObject {

    @Published var tagsListViewModel: TagsListViewModel = TagsListViewModel()
    
    private let dataAccessManager = DataAccessManager()
    
}
