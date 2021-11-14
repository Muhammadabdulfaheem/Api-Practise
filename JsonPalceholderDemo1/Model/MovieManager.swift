//
//  MovieManager.swift
//  JsonPalceholderDemo1
//
//  Created by MAC on 24/06/2021.
//

import Foundation

struct MovieManager{
    
    func loadData2(completion: @escaping([Comments])-> Void){
        let commentsURL = "https://jsonplaceholder.typicode.com/comments"
        guard let url = URL(string: commentsURL) else {return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let getData = data  else {return}
            let comments = parseCommentsJSON(getData)
            completion(comments ?? [])
            
        }
        task.resume()
    }
    
    func loadData(completion:@escaping([Movie])->Void){
        let movieURL = "https://jsonplaceholder.typicode.com/posts"
        guard let url = URL(string: movieURL) else{return}
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let getData = data else {return}
            let movies = parseJSON(getData)
            completion(movies ?? [])
        }
        task.resume()
    }
    
    func parseJSON(_ data: Data) -> [Movie]?{
        let decoder = JSONDecoder()
        do{
            let deodedData = try decoder.decode([Movie].self, from: data)
            return deodedData
        }
        catch{
            print(error.localizedDescription)
            return nil
        }

    }
    
    func parseCommentsJSON(_ data : Data) -> [Comments]?{
        //here we convert into data becuse image is convert into data first
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode([Comments].self, from: data)
            return decodedData
            
        }
        catch{
            print (error.localizedDescription)
            return nil
        }
    }

}



