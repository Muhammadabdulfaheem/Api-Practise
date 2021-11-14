//
//  NetflixManager.swift
//  JsonPalceholderDemo1
//
//  Created by MAC on 30/06/2021.
//

import Foundation

struct NetflixManager{
    
    func loadData(completion:@escaping([Netflix])-> Void){
        let movieUrl = "https://jsonplaceholder.typicode.com/photos"
        guard let url = URL(string: movieUrl) else {return}
        let task = URLSession.shared.dataTask(with: url){(data, response, error) in
            guard let getData = data else {return}
            let movies = parseJSON(getData)
            completion(movies ?? [])
        
        }
        task.resume()
    }
    
    func parseJSON(_ data:Data) -> [Netflix]?{
        let  decoder = JSONDecoder()
        
        do{
            let decodedData =  try decoder.decode([Netflix].self, from: data)
            return decodedData
        }
        catch{
            print(error.localizedDescription)
            return nil
        }
    }
}
