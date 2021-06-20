//
//  DetailViewController.swift
//  TesteCompasso
//
//  Created by Fernando Crelick on 19/06/21.
//

import UIKit

class DetailViewController: ViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var selectedTitle: String!
    var selectedPrice: String!
    var selectedDescription: String!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = selectedTitle
        self.priceLabel.text = "R$ \(selectedPrice ?? "")"
        self.descriptionLabel.text = selectedDescription
    }
    



}
