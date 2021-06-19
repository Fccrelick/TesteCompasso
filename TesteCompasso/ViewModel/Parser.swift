//
//  Parser.swift
//  TesteCompasso
//
//  Created by Fernando Crelick on 19/06/21.
//

import Foundation

struct Parser{
    func automatedParse(comp: @escaping ([Event]) -> ()){
        var apiURL = URL(string: "https://5f5a8f24d44d640016169133.mockapi.io/api/events/")
        let session = URLSession.shared
        let decoder = JSONDecoder()
        
        session.dataTask(with: apiURL!) { data, response, error in
            if error != nil{
                print("============LocalizedError=========")
                print(error?.localizedDescription)
                return
            }
            do{
              let event = try decoder.decode([Event].self, from: data!)
               
                comp(event)
                
            }catch{
                print("================catch==============")
                print(error)
            }
        }.resume()
            
        }
    
}
