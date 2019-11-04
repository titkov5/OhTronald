//
//  TagsListViewModel.swift
//  OhTronald
//
//  Created by Ivan Titkov on 02.11.2019.
//  Copyright © 2019 none. All rights reserved.
//

import Foundation

final class TagsListViewModel: ObservableObject {
    
    @Published var showFavoritesOnly = false
    @Published var tags: [TagViewModel] = []
    
    private let networkManager = NetworkManager()
     
    init() {
        self.loadTags()
    }
    
    func loadTags() {
        networkManager.fetchTagListModel() {[weak self] model in
            if let newModel = model {
                self?.tags = self?.createTags(tagValues: newModel.tags) ?? []
            }
        }
    }
    
    func createTags(tagValues: [String]?) -> [TagViewModel] {
        guard let tagValues = tagValues else {
            return []
        }
        var result: [TagViewModel] = []
        var i = 0
        for tag in tagValues {
            let isFavorite = (i == 3) || (i == 7) || (i == 0)
            result.append(TagViewModel(id: i, value: tag, isFavorite: isFavorite))
            i+=1
        }
        return result
    }
}
