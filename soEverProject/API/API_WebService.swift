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
    
    
    func getModelDataFromWebItunes<T : Decodable>(_ type : T.Type,
                                                  country: String,
                                                  typeShow : String,
                                                  numberData : String,
                                                  completionHandler : @escaping (T?) -> ()) {
        var url = ""
        if type == GenericModel.self{
           url = CONSTANTES.LLAMADAS.BASE_URL
        }else{
           url = CONSTANTES.LLAMADAS.BASE_URL_NEW
        }
       
        
        let arguments : [CVarArg] = [country, typeShow, numberData]
        let urlString = String(format: url, arguments: arguments)
        
        if let urlStringDes = URL(string: urlString){
            Alamofire.request(URLRequest(url: urlStringDes)).validate().responseData { (data) in
                guard let dataDes = data.data else { return }
                do{
                    switch data.result{
                    case .success:
                        let json = try JSONDecoder().decode(T.self, from: dataDes)
                        completionHandler(json)
                    case .failure(let error):
                        print("AQUI ANDRES \(error)")
                        completionHandler(nil)
                    }
                } catch let DecodingError.dataCorrupted(context) {
                    print(context)
                } catch let DecodingError.keyNotFound(key, context) {
                    print("Key '\(key)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.valueNotFound(value, context) {
                    print("Value '\(value)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.typeMismatch(type, context)  {
                    print("Type '\(type)' mismatch:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch {
                    print("error: ", error)
                }
            }
        }
    }
    
}




