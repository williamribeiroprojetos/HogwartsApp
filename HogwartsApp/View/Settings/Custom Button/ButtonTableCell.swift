//
//  ButtonTableCell.swift
//  HogwartsApp
//
//  Created by Elena Diniz on 20/10/21.
//

import UIKit

class ButtonTableCell: UITableViewCell {

    
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var buttonName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        buttonView.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
