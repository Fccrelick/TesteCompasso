//
//  InitialTableViewCell.swift
//  TesteCompasso
//
//  Created by Fernando Crelick on 19/06/21.
//

import UIKit

class InitialTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var eventImage: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(event: Event){
        
    
        self.titleLabel.text = event.title
        self.priceLabel.text = String(event.price)
        
        
    }
    
}
    

