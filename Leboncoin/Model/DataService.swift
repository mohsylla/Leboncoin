//
//  DataService.swift
//  Leboncoin
//
//  Created by Sylla on 22/04/2022.
//

import Foundation
class DataService {
    
    func getAnnonce(){
        guard let url = URL(string: "https://eulink.smartrecruiters.com/c/eJx9ULtuwzAM_Jp4i0HJkh-DB6Nx2wB9AEX2gJJoR4UtGZLSIn9fpd0LcDjwyDseTS-gRVlov27obkfTSy077FoSNcGkAKBRCmUjCttz4BwE65iAilelZACqrVlX103FJO0ExBVDCqTD1SYKscyyBa1ol9Nto_5pfBs_hpfz-DocX86n9_PD8HY4HobTWCz9JaUt7qphxx9zBfwuZ5suV3WNFLR3iVy6y2VuIeWd9tZlvOGW6cVuGa8Ys-l9wMZk3Vx-Ru_-7J9zx4d7vJpL0oyrhoEQTTWZqiWAShehj7dlwXJttuBzlPm-9xvABztbN7ovG7xb8x39FNAV6b88K8WIM2VDzSoha2j3YGjaC41yr6CFvZGGGcy_n7QuLv1kOi0mYjUXSuoWcUJuwCjiSqvW6B_DhogF") else{
            return
        }
        
        print("making api call...")
        
        var request = URLRequest(url: url)
     
        let task = URLSession.shared.dataTask(with: request) { data, _ , error in
            guard let data = data, error == nil else {
                return print("error data")
            }
            
            do{
                let responseJson = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                print("succcess: \(responseJson)")
            }
            catch{
                  print(error)
            }
            


        }
        task.resume()
    }
}
