//
//  DataService.swift
//  Leboncoin
//
//  Created by Sylla on 22/04/2022.
//

import Foundation
class DataService {
    static let shared = DataService()
    private init(){}
    
    private var task: URLSessionDataTask?
    private var session = URLSession(configuration: .default)
    
    func getAnnonce(callback: @escaping (Result<[Annonce]?,ErrorCases>)->Void){
        guard let url = URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/listing.json") else{
            return
        }
        print("making api call...")
        
        var request = URLRequest(url: url)

        task = session.dataTask(with: request) { data, _ , error in
            DispatchQueue.main.async {
                
                guard let data = data, error == nil else {
                                return callback(.failure(.errorNetwork))
                            }
                            
                            guard let responseJson = try? JSONDecoder().decode([Annonce].self, from: data) else{
                                return callback(.failure(.errorJson))
                            }
                callback(.success(responseJson))
            }
            
            
        }
        task?.resume()
       
    }
}
