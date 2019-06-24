//
//  GenericCell.swift
//  soEverProject
//
//  Created by Andres Felipe Ocampo Eljaiesk on 24/06/2019.
//  Copyright © 2019 icologic. All rights reserved.
//

import UIKit
import Kingfisher

class GenericCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var myBackgroundImage: UIImageView!
    @IBOutlet weak var myImageView : UIImageView!
    @IBOutlet weak var myTitleLBL: UILabel!
    @IBOutlet weak var myPriceLBL: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpGenericCell(_ model : Entry){
        myTitleLBL.text = model.title.label
        myPriceLBL.text = model.imPrice.label
        let pathImagenUrl = URL(string: model.imImage.last!.label)
        myImageView.kf.setImage(with: pathImagenUrl)
        myBackgroundImage.kf.setImage(with: pathImagenUrl)
       
    }
    
    
}
