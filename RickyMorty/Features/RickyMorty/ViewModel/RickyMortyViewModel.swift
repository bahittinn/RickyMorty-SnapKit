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

class RickyMortyViewModel: IRickyMortyViewModel {
   
    private var isLoading = false
    var rickyMortyCharacters: [Result] = []
    var rickyMortyService: IRickyMortyService = RickyMortyService()
    
    init() {
        rickyMortyService = RickyMortyService()
    }
    
    func fetchItems() {
        rickyMortyService.fetchAllDatas { [weak self] (response) in
            self?.changeLoading()
            self?.rickyMortyCharacters = response ?? []
        }
    }
    
    func changeLoading() {
        
    }
}

