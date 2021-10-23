//
//  BeastTableCell.swift
//  HogwartsApp
//
//  Created by William Henrique Gonçalves Ribeiro on 03/10/21.

import UIKit

class BeastTableCell: UITableViewCell {

    @IBOutlet weak var viewMain: GradientView!
    @IBOutlet weak var beastImageView: UIImageView!
    @IBOutlet weak var beastNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(value: Beasts) {
        self.beastImageView.image = UIImage(named: value.avatar ?? "")
        self.beastNameLabel.text = value.name
        self.beastImageView.layer.cornerRadius = beastImageView.frame.height / 2
        self.beastImageView.clipsToBounds = true
        self.beastImageView.contentMode = UIView.ContentMode.scaleAspectFill
        self.beastImageView.layer.masksToBounds = true
    }
    
}
