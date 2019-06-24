//
//  LibrosViewController.swift
//  soEverProject
//
//  Created by Andres Felipe Ocampo Eljaiesk on 24/06/2019.
//  Copyright © 2019 icologic. All rights reserved.
//

import UIKit
import APESuperHUD

class LibrosViewController: UIViewController {
    
    //MARK: - Variables globales
    var arrayBooks = [Entry]()
    
    //MARK: - IBOutlets
    @IBOutlet weak var myTableCustomView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableCustomView.delegate = self
        myTableCustomView.dataSource = self
        myTableCustomView.register(UINib(nibName: "GenericCell", bundle: nil), forCellReuseIdentifier: "GenericCellIdentifier")
        
        toDoCall()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myTableCustomView.reloadData()
    }
    
    //MARK: - Metodos privados
    internal func toDoCall(){
        APESuperHUD.show(style: .loadingIndicator(type: .standard), title: nil, message: "Loading...")
        WebServiceProvider().getBooksFromWebItunes(BooksModel.self,
                                                   country: "es",
                                                   typeShow: "toppaidebooks",
                                                   numberData: "10") { (resultBooks) in
                                                    guard let resultBooksDes = resultBooks else { return }
                                                    self.arrayBooks = resultBooksDes.feed.entry
                                                    DispatchQueue.main.async {
                                                        self.myTableCustomView.reloadData()
                                                        APESuperHUD.dismissAll(animated: true)
                                                    }
        }
    }
    
    //MARK: - Delegados

}

//MARK: - DELEGADO /
extension LibrosViewController : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayBooks.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = myTableCustomView.dequeueReusableCell(withIdentifier: "GenericCellIdentifier", for: indexPath) as! GenericCell
        customCell.setUpGenericCell(arrayBooks[indexPath.row])
        return customCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 233
    }
   
    
}



