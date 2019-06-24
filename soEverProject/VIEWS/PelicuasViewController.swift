//
//  PeliculasViewController.swift
//  soEverProject
//
//  Created by Andres Felipe Ocampo Eljaiesk on 24/06/2019.
//  Copyright © 2019 icologic. All rights reserved.
//

import UIKit

class PeliculasViewController: UIViewController {
    
    //MARK: - Variables globales
    var arrayBooks = [Entry]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.toDoCall()
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: - Metodos privados
    internal func toDoCall(){
        WebServiceProvider().getBooksFromWebItunes("es",
                                                   typeShow: "toppaidebooks",
                                                   numberData: "10") { (resultBooks) in
                                                    guard let resultBooksDes = resultBooks else { return }
                                                    self.arrayBooks = resultBooksDes.feed.entry
                                                    print("AQUI ANDRES -> \(self.arrayBooks.count)")
        }
    }
    


}

