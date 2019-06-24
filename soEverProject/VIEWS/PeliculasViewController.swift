//
//  PeliculasViewController.swift
//  soEverProject
//
//  Created by Andres Felipe Ocampo Eljaiesk on 24/06/2019.
//  Copyright © 2019 icologic. All rights reserved.
//

import UIKit
import APESuperHUD

class PeliculasViewController: UIViewController {
    
    //MARK: - Variables globales
    var arrayPeliculas = [Entry]()
    
    //MARK: - IBOutlets
    @IBOutlet weak var myTableCustomView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableCustomView.delegate = self
        myTableCustomView.dataSource = self
        myTableCustomView.register(UINib(nibName: "GenericCell", bundle: nil), forCellReuseIdentifier: "GenericCellIdentifier")
        toDoCall()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myTableCustomView.reloadData()
    }
    
    //MARK: - Metodos privados
    internal func toDoCall(){
        APESuperHUD.show(style: .loadingIndicator(type: .standard), title: nil, message: "Loading...")
        WebServiceProvider().getModelDataFromWebItunes(GenericModel.self,
                                                       country: "es",
                                                       typeShow: "topmovies",
                                                       numberData: "10") { (resultBooks) in
                                                        guard let resultBooksDes = resultBooks else { return }
                                                        self.arrayPeliculas = resultBooksDes.feed.entry
                                                        DispatchQueue.main.async {
                                                            self.myTableCustomView.reloadData()
                                                            APESuperHUD.dismissAll(animated: true)
                                                        }
        }
    }
    
    
    


}


//MARK: - DELEGADO / DATA SOURCE
extension PeliculasViewController : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayPeliculas.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = myTableCustomView.dequeueReusableCell(withIdentifier: "GenericCellIdentifier", for: indexPath) as! GenericCell
        customCell.setUpGenericCell(arrayPeliculas[indexPath.row])
        return customCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 233
    }
    
    
}

