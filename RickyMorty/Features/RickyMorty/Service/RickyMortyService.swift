//
//  RickyMortyService.swift
//  RickyMorty
//
//  Created by Bahittin on 25.07.2023.
//

import Foundation

enum RickyMortyServiceEndPoint: String {
    case BASE_URL = "https://rickandmortyapi.com/api"
    case PATH     = "/character"
}

protocol IRickyMortyService {
    func fetchAllDatas()
}

struct RickyMortyService: IRickyMortyService {
    func fetchAllDatas() {
        
    }
}
