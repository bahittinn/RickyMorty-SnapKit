//
//  RickyMortyService.swift
//  RickyMorty
//
//  Created by Bahittin on 25.07.2023.
//

import Alamofire

//MARK: -  Service
enum RickyMortyServiceEndPoint: String {
    case BASE_URL = "https://rickandmortyapi.com/api"
    case PATH     = "/character"
    
    static func characterPath() -> String {
        return "\(BASE_URL.rawValue)\(PATH.rawValue)"
    }
}

protocol IRickyMortyService {
    func fetchAllDatas(response: @escaping ([Result]?) -> Void)
}

struct RickyMortyService: IRickyMortyService {
    func fetchAllDatas(response: @escaping ([Result]?) -> Void) {
        AF.request(RickyMortyServiceEndPoint.characterPath()).responseDecodable(of: PostModel.self) {
            (model) in
            guard let data = model.value else  {
                response(nil)
                return
            }
            response(data.results)
        }
        
        
    }
}
