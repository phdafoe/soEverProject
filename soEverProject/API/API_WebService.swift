//
//  API_WebService.swift
//  soEverProject
//
//  Created by Andres Felipe Ocampo Eljaiesk on 24/06/2019.
//  Copyright © 2019 icologic. All rights reserved.
//

import Alamofire
import Foundation


class WebServiceProvider {
    
    
    func getBooksFromWebItunes(_ country: String, typeShow : String, numberData : String, completionHandler : @escaping (BooksModel?) -> ()) {
       
        let url = CONSTANTES.LLAMADAS.BASE_URL
        let arguments : [CVarArg] = [country, typeShow, numberData]
        let urlString = String(format: url, arguments: arguments)
        if let urlStringDes = URL(string: urlString){
            Alamofire.request(URLRequest(url: urlStringDes)).validate().responseData { (data) in
                guard let dataDes = data.data else { return }
                do{
                    switch data.result{
                    case .success:
                        let json = try JSONDecoder().decode(BooksModel.self, from: dataDes)
                        completionHandler(json)
                    case .failure(let error):
                        print("AQUI ANDRES \(error)")
                        completionHandler(nil)
                    }
                }catch let error{
                    print(error.localizedDescription)
                }
            }
        }
        
        
        
        
        
    }
    
}




