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
    
    func setUpGenericCell(_ modelEntry : Entry?, modelResult : Result?){
        if let modelEntryDes = modelEntry{
            myTitleLBL.text = modelEntryDes.title.label
            myPriceLBL.text = modelEntryDes.imPrice.label
            let pathImagenUrl = URL(string: modelEntryDes.imImage.last!.label)
            myImageView.kf.setImage(with: pathImagenUrl)
            myBackgroundImage.kf.setImage(with: pathImagenUrl)
        }else if let modelResultDes = modelResult{
            myTitleLBL.text = modelResultDes.artistName
            myPriceLBL.text = modelResultDes.copyright
            let pathImagenUrl = URL(string: (modelResultDes.artworkUrl100))
            myImageView.kf.setImage(with: pathImagenUrl)
            myBackgroundImage.kf.setImage(with: pathImagenUrl)
        }
        
       
    }
    
    
}
