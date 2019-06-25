//
//  AplicacionesViewController.swift
//  soEverProject
//
//  Created by Andres Felipe Ocampo Eljaiesk on 24/06/2019.
//  Copyright © 2019 icologic. All rights reserved.
//

import UIKit
import Kingfisher

class AplicacionesViewController: UIViewController {
    
    //MARK: - Variables globales
    var arrayApps = [Result]()
    
    //MARK: - IBOutlets
    @IBOutlet weak var myCollectionCustomView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        myCollectionCustomView.delegate = self
        myCollectionCustomView.dataSource = self
        myCollectionCustomView.register(UINib(nibName: "GenericCollectionCell", bundle: nil), forCellWithReuseIdentifier: "GenericCollectionCellIdentifier")
        toDoCall()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myCollectionCustomView.reloadData()
    }
    
    //MARK: - Metodos privados
    internal func toDoCall(){
        GenericPresenter().getDataAppsFromProvider("es", typeShow: "top-free", numberData: "99") { (resultApps) in
            guard let resultAppsDes = resultApps else {return}
            self.arrayApps = resultAppsDes
            self.myCollectionCustomView.reloadData()
        }
    }

}

//MARK: - DELEGADO / DATASOURCE -> CollectionView
extension AplicacionesViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayApps.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = myCollectionCustomView.dequeueReusableCell(withReuseIdentifier: "GenericCollectionCellIdentifier", for: indexPath) as! GenericCollectionCell
        let model = arrayApps[indexPath.row]
        collectionCell.myImageAppCellView.kf.setImage(with: URL(string: model.artworkUrl100)!)
        return collectionCell
    }  
}
