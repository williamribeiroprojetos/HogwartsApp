//
//  BeastsDetailViewController.swift
//  HogwartsApp
//
//  Created by William Henrique Gonçalves Ribeiro on 03/10/21.
//

import UIKit

class BeastsDetailViewController: UIViewController {

    @IBOutlet weak var viewMain: GradientView!
    @IBOutlet weak var beastImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var favoriteButton: ButtonGradient!
    
    var beasts: Beasts?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        favoriteButton.layer.cornerRadius = favoriteButton.frame.height / 2
        beastImageView.layer.cornerRadius = 5
        setup()
    }
    
    @IBAction func tappedFavoriteButton(_ sender: UIButton) {
    }
    
    func setup() {
        guard let value = beasts else {
            return
        }
        self.beastImageView.image = UIImage(named: value.avatar ?? "")
        self.descriptionLabel.text = " Nome: \(value.name) \n Característias: \(value.characteristics)"
        title = value.name
    }
    
}


