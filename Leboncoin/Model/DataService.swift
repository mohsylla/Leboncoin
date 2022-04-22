//
//  DataService.swift
//  Leboncoin
//
//  Created by Sylla on 22/04/2022.
//

import Foundation
class DataService {
    
    func getAnnonce(){
        guard let url = URL(string: "https://raw.githubusercontent.com/leboncoin/paperclip/master/listing.json") else{
            return
        }
        print("making api call...")
        
        var request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request) { data, _ , error in
            guard let data = data, error == nil else {
                return print("error data")
            }
            
            do{
                let responseJson = try JSONDecoder().decode([Annonce].self, from: data)
                print("succcess: \(responseJson)")
            }
            catch{
                  print(error)
            }
        }
        task.resume()
       
    }
}
