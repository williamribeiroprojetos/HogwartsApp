//
//  PersonalDataViewController.swift
//  HogwartsApp
//
//  Created by Elena Diniz on 20/10/21.
//

import UIKit

class PersonalDataViewController: UIViewController {

    @IBOutlet weak var viewMain: GradientView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var bdayTextField: UITextField!
    @IBOutlet weak var bdayDatePicker: UIDatePicker!
    @IBOutlet weak var saveButton: ButtonGradient!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }

    func setupView() {
        bdayDatePicker.isHidden = true
        saveButton.layer.cornerRadius = saveButton.layer.frame.height / 2
        saveButton.layer.borderWidth = 1
        nameTextField.setEditingColor()
        nameTextField.isEnabled = false
        bdayTextField.setEditingColor()
        bdayTextField.isEnabled = false
        countryTextField.setEditingColor()
        closeButton.isHidden = true
        titleLabel.isHidden = true
        title = "Dados Pessoais"
    }
    
    @IBAction func closeButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func tappedSaveButton(_ sender: UIButton) {
    }
    
}
