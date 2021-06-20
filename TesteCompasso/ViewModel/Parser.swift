//
//  Parser.swift
//  TesteCompasso
//
//  Created by Fernando Crelick on 19/06/21.
//

import Foundation

struct Parser{
    func Parse(comp: @escaping ([Event]) -> ()){
        
        let session = URLSession.shared
        let decoder = JSONDecoder()
        
        if let apiURL = URL(string: "https://5f5a8f24d44d640016169133.mockapi.io/api/events/"){
        session.dataTask(with: apiURL) { data, response, error in
            if error != nil{
                print(error?.localizedDescription)
                return
            }
            do{
              let event = try decoder.decode([Event].self, from: data!)
                comp(event)
                
            }catch{
                print(error)
            }
        }.resume()
            
        }
    }

    
}
