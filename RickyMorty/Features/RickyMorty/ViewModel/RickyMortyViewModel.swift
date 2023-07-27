//
//  RickyMortyViewModel.swift
//  RickyMorty
//
//  Created by Bahittin on 27.07.2023.
//

import Foundation

protocol IRickyMortyViewModel {
    func fetchItems()
    func changeLoading()
    
    var rickyMortyCharacters: [Result] { get set }
    var rickyMortyService: IRickyMortyService { get }
    
}

struct RickyMortyViewModel: IRickyMortyViewModel {
    func fetchItems() {
        
    }
    
    func changeLoading() {
        
    }
    
    var rickyMortyCharacters: [Result]
    
    var rickyMortyService: IRickyMortyService
    
    
}

