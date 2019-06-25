//
//  DetalleGenericTableViewController.swift
//  soEverProject
//
//  Created by Andres Felipe Ocampo Eljaiesk on 25/06/2019.
//  Copyright © 2019 icologic. All rights reserved.
//

import UIKit
import Kingfisher
import MapKit

class DetalleGenericTableViewController: UITableViewController {
    
    //MARK: - Variales locales
    var modelData : Entry?
    let latitud = 40.431128
    let longitud = -3.658840
    
    var arrayApps = [Result]()
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var myImageCustomView: UIImageView!
    @IBOutlet weak var myTitleCustomLBL: UILabel!
    @IBOutlet weak var myPriceCustomLBL: UILabel!
    @IBOutlet weak var myDescriptionCustomLBL: UILabel!
    @IBOutlet weak var myPhoneNumberCustomLBL: UILabel!
    @IBOutlet weak var myMobilePhoneCustomLBL: UILabel!
    @IBOutlet weak var myEmailCustomLBL: UILabel!
    @IBOutlet weak var myMapCustomView: MKMapView!
    @IBOutlet weak var myCollectionCustomView: UICollectionView!
    
    //MARK: - IBActions
    
    @IBAction func myWebSiteACTION(_ sender: UIButton) {
        let urlLoad = sender.titleLabel?.text
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "WebSiteViewController") as! WebSiteViewController
        vc.url = urlLoad
        self.present(vc, animated: true, completion: nil)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myCollectionCustomView.delegate = self
        myCollectionCustomView.dataSource = self
        
        todoCallApps()
        
        guard let modelDataDes =  modelData else {return}
        title = modelDataDes.title.label
        
        let urlImage = URL(string: modelDataDes.imImage.last!.label)
        myImageCustomView.kf.setImage(with: urlImage)
        
        myTitleCustomLBL.text = modelDataDes.title.label
        myPriceCustomLBL.text = modelDataDes.imPrice.label
        myDescriptionCustomLBL.text = modelDataDes.summary.label
        myPhoneNumberCustomLBL.text = "915 123 123"
        myMobilePhoneCustomLBL.text = "65 39 40 573"
        myEmailCustomLBL.text = "mail@mail.com"
        
        let region = MKCoordinateRegion(center: CLLocationCoordinate2DMake(latitud, longitud),
                                        span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001))
        myMapCustomView.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2DMake(latitud, longitud)
        annotation.title = modelDataDes.title.label
        annotation.subtitle = modelDataDes.subtitle?.label
        myMapCustomView.addAnnotation(annotation)
        
        myMobilePhoneCustomLBL.isUserInteractionEnabled = true
        let gr = UITapGestureRecognizer(target: self, action: #selector(hacerLlamadaTelefonica))
        myMobilePhoneCustomLBL.addGestureRecognizer(gr)
        
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 && indexPath.row == 2{
            return UITableView.automaticDimension
        }
        return super.tableView(tableView, heightForRowAt: indexPath)
    }

    
    @objc func hacerLlamadaTelefonica(){
        if let phoneCallURL = URL(string: "tel://\(myMobilePhoneCustomLBL.text!)") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            }
        }
    }
    
    private func todoCallApps(){
        GenericPresenter().getDataAppsFromProvider("es", typeShow: "top-free", numberData: "10") { (resultApps) in
            guard let resultAppsDes = resultApps else {return}
            self.arrayApps = resultAppsDes
            self.myCollectionCustomView.reloadData()
        }
    }
    
}

//MARK: - DELEGADO / DATASOURCE -> CollectionView
extension DetalleGenericTableViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayApps.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = myCollectionCustomView.dequeueReusableCell(withReuseIdentifier: "AppsViewCellReuseIdentifier", for: indexPath) as! AppsViewCell
        let model = arrayApps[indexPath.row]
        collectionCell.myImageAppCustomView.kf.setImage(with: URL(string: model.artworkUrl100)!)
        
        /*do{
            let imageData = UIImage(data: try Data(contentsOf: URL(string: model.artworkUrl100)!))
            collectionCell.myImageAppCustomView.image = imageData
        }catch{
            
        }*/
        return collectionCell
    }
    
    
    
    
}
