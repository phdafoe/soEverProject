//
//  GenericPresenter.swift
//  soEverProject
//
//  Created by Andres Felipe Ocampo Eljaiesk on 24/06/2019.
//  Copyright © 2019 icologic. All rights reserved.
//

import Foundation
import APESuperHUD



class GenericPresenter {
    
    static let genericDelegate = GenericPresenter()
        
    internal func getDataFromProvider(_ country: String, typeShow: String, numberData: String, completionHandler: @escaping ([Entry]?) -> ()) {
        APESuperHUD.show(style: .loadingIndicator(type: .standard), title: nil, message: "Loading...")
        WebServiceProvider().getModelDataFromWebItunes(GenericModel.self,
                                                       country: country,
                                                       typeShow: typeShow,
                                                       numberData: numberData) { (resultDataGeneric) in
                                                        guard let resultDataGenericDes = resultDataGeneric else { return }
                                                        DispatchQueue.main.async {
                                                            completionHandler(resultDataGenericDes.feed.entry)
                                                            APESuperHUD.dismissAll(animated: true)
                                                        }
        }
    }
}
