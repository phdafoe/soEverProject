//
//  API_UTILS.swift
//  soEverProject
//
//  Created by Andres Felipe Ocampo Eljaiesk on 24/06/2019.
//  Copyright © 2019 icologic. All rights reserved.
//

import Foundation

let CONSTANTES = Constantes()

struct Constantes {
    let LLAMADAS = LlamadasURL()
}

struct LlamadasURL {
    
    let BASE_URL = "https://itunes.apple.com/%@/rss/%@/limit=%@/json"
    let BASE_URL_NEW = "https://rss.itunes.apple.com/api/v1/%@/ios-apps/%@/all/%@/explicit.json"
    
}

func randomCountry(){
    
}
