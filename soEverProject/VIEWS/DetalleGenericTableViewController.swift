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
    
    
    //MARK: - IBOutlets
    @IBOutlet weak var myImageCustomView: UIImageView!
    @IBOutlet weak var myTitleCustomLBL: UILabel!
    @IBOutlet weak var myPriceCustomLBL: UILabel!
    @IBOutlet weak var myDescriptionCustomLBL: UILabel!
    @IBOutlet weak var myPhoneNumberCustomLBL: UILabel!
    @IBOutlet weak var myMobilePhoneCustomLBL: UILabel!
    @IBOutlet weak var myEmailCustomLBL: UILabel!
    @IBOutlet weak var myMapCustomView: MKMapView!
    
    
    
    
    //MARK: - IBActions
    
    @IBAction func myWebSiteACTION(_ sender: Any) {
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 && indexPath.row == 2{
            return UITableView.automaticDimension
        }
        return super.tableView(tableView, heightForRowAt: indexPath)
    }

    
}
