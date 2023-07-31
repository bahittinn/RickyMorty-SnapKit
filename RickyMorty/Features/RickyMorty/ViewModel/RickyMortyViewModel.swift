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
    
    var rickyMortyOutput: RickyMortyOutPut? { get }
    
    func setDelegate(output: RickyMortyOutPut)
}

//MARK: - ViewModel
final class RickyMortyViewModel: IRickyMortyViewModel {
    var rickyMortyOutput: RickyMortyOutPut?
    
    func setDelegate(output: RickyMortyOutPut) {
        rickyMortyOutput = output
    }
    
   
    private var isLoading = false
    var rickyMortyCharacters: [Result] = []
    var rickyMortyService: IRickyMortyService
    
    init() {
        rickyMortyService = RickyMortyService()
    }
    
    func fetchItems() {
        rickyMortyService.fetchAllDatas { [weak self] (response) in
            self?.changeLoading()
            self?.rickyMortyCharacters = response ?? []
            self?.rickyMortyOutput?.saveDatas(values: self?.rickyMortyCharacters ?? [])
        }
    }
    
    func changeLoading() {
        isLoading = !isLoading
        rickyMortyOutput?.changeLoading(isLoad: isLoading)
    }
}

