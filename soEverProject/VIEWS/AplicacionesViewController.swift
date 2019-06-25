//
//  AplicacionesViewController.swift
//  soEverProject
//
//  Created by Andres Felipe Ocampo Eljaiesk on 24/06/2019.
//  Copyright © 2019 icologic. All rights reserved.
//

import UIKit

class AplicacionesViewController: UIViewController {
    
    //MARK: - Variables globales
    var arrayApps = [Result]()
    
    //MARK: - IBOutlets
    @IBOutlet weak var myTableCustomView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableCustomView.delegate = self
        myTableCustomView.dataSource = self
        myTableCustomView.register(UINib(nibName: "GenericCell", bundle: nil), forCellReuseIdentifier: "GenericCellIdentifier")
        toDoCall()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myTableCustomView.reloadData()
    }
    
    //MARK: - Metodos privados
    internal func toDoCall(){
        GenericPresenter().getDataAppsFromProvider("es", typeShow: "top-free", numberData: "10") { (resultApps) in
            guard let resultAppsDes = resultApps else {return}
            self.arrayApps = resultAppsDes
            self.myTableCustomView.reloadData()
        }
    }

}

//MARK: - DELEGADO / DATA SOURCE
extension AplicacionesViewController : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayApps.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = myTableCustomView.dequeueReusableCell(withIdentifier: "GenericCellIdentifier", for: indexPath) as! GenericCell
        customCell.setUpGenericCell(nil, modelResult: arrayApps[indexPath.row])
        return customCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 233
    }
    
    
}
