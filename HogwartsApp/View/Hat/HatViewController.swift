//
//  HatViewController.swift
//  HogwartsApp
//
//  Created by Daniel Washington Ignacio on 01/09/21.
//

import UIKit

class HatViewController: UIViewController {
    
    @IBOutlet weak var viewMain: GradientView!
    @IBOutlet weak var hatImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var suffleButton: ButtonGradient!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        suffleButton.layer.cornerRadius = suffleButton.frame.height / 2
        nameTextField.setEditingColor()
        title = "Chapéu Seletor"
    }
    
    @IBAction func luckButton(_ sender: UIButton) {
        print("Cliked")
    }
    
}
