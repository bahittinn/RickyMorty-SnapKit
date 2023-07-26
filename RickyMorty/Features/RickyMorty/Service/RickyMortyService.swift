//
//  RickyMortyService.swift
//  RickyMorty
//
//  Created by Bahittin on 25.07.2023.
//

import Alamofire

enum RickyMortyServiceEndPoint: String {
    case BASE_URL = "https://rickandmortyapi.com/api"
    case PATH     = "/character"
    
    static func characterPath() -> String {
        return "\(BASE_URL.rawValue)\(PATH.rawValue)"
    }
}

protocol IRickyMortyService {
    func fetchAllDatas()
}

struct RickyMortyService: IRickyMortyService {
    func fetchAllDatas() {
        AF.request(RickyMortyServiceEndPoint.characterPath()).responseDecodable(of: PostModel.self) {
            (model) in
            guard let data = model.value else  {
                return
            }
            
            
        }
    }
}
