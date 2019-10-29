//
//  ModelsStakeholder.swift
//  OhTronald
//
//  Created by Ivan Titkov on 13.10.2019.
//  Copyright © 2019 none. All rights reserved.
//

import Foundation
import Combine

final class DataContainer: ObservableObject {
    @Published var fetchedTags:[TagViewModel] = []
    @Published var showFavoritesOnly = false
    @Published var currentTag: String? = nil {
        didSet{
            if let currentTag = currentTag {
                self.fetchQuotes(tag: currentTag)
            }
        }
    }
    @Published var fetchedQuotes:[QuoteViewModel] = []
    
    init() {
        askTags()
   }
    
    private let service = NetworkService()
    
    func askTags() { //TODO: заменить название метода
        let tagRequest = ApiRequest.init(httpMethod: .GET, path: Endpoints.tag ,
                        headers: headers)
        
        service.fetchEntities(apiRequest: tagRequest, type: Tag.self) { (entities, error) in
            self.fetchedTags = self.createTags(tagValues: entities?.tags)
        }
    }
    
    func fetchQuotes(tag: String) { //TODO: заменить название сущностей на лист и т.п.
        if let tag = currentTag {
            let quoteRequest = ApiRequest.init(httpMethod: .GET, path: Endpoints.quote, parameters: ["query" : tag], headers: headers)
            
            service.fetchEntities(apiRequest: quoteRequest, type: Quote.self) { (entities, error) in
                self.fetchedQuotes = []
                if let quotes = entities?.quotes {
                    var id = 0
                    for quote in quotes {
                        let quoteViewModel = QuoteViewModel(id: id, value: quote.value)
                        self.fetchedQuotes.append(quoteViewModel)
                        id += 1
                    }
                }
                
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
    
    func createQuotes(quotes:[Quote]) -> [QuoteViewModel] {
        return []
    }
    
}

func createTags(_ tagValues: [String]?) -> [TagViewModel] {
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

//var tags: [TagViewModel] = createTags(tagValuesAsString)
//
//let tagValuesAsString = ["Hillary Clinton","Ted Cruz","Jeb Bush","Marco Rubio","President Obama","Elizabeth Warren","John Kasich","Bernie Sanders","Bill Clinton","Lindsey Graham","Ben Carson","Carly Fiorina","John McCain","Rick Perry","George Pataki","Scott Walker","Tim Kaine","Rand Paul","Donald Trump","George W. Bush","Megyn Kelly","Women","Bobby Jindal","Martin O'Malley","Tom Ridge","Michael Nutter","Barack Obama","Mexico","Immigrants","Cory Booker","Sam Liccardo","Lincoln Chafee","Apologies","Muslims","Bakari Sellers","Illegal Immigrants","Chris Christie","Arianna Huffington","Neil Young","History","Sexual Assults","Military","Marty Walsh","Ben Cardin","Stephanie Rawlings-Blake","Mitt Romney","Ivanka Trump","Ruth Bader Ginsburg","Girlfriends","Joseph R. Biden Jr.","Muammar Gaddafi","Bill and Hillary Clinton","Money","Bette Midler"]
//
//let quotes: [String] = ["We have become a far greater Economic Power than ever before, and we are using that power for WORLD PEACE!", "The Kurds and Turkey have been fighting for many years. Turkey considers the PKK the worst terrorists of all. Others may want to come in and fight for one side or the other. Let them! We are monitoring the situation closely. Endless Wars!"]
