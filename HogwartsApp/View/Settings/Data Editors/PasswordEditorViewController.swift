//
//  PasswordEditorViewController.swift
//  HogwartsApp
//
//  Created by Elena Diniz on 20/10/21.
//

import UIKit

class PasswordEditorViewController: UIViewController {
    
    @IBOutlet weak var viewMain: GradientView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var oldPasswordTextField: UITextField!
    @IBOutlet weak var oldPasswordShowButton: UIButton!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordShowButton: UIButton!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordShowButton: UIButton!
    @IBOutlet weak var saveButton: ButtonGradient!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    func setupView() {
        errorLabel.isHidden = true
        saveButton.layer.cornerRadius = saveButton.layer.frame.height / 2
        saveButton.layer.borderWidth = 1
        oldPasswordTextField.setEditingColor()
        newPasswordTextField.setEditingColor()
        confirmPasswordTextField.setEditingColor()
    }

    @IBAction func closeButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func tappedShowOldPassword(_ sender: UIButton) {
    }
    
    @IBAction func tappedShowNewPassword(_ sender: UIButton) {
    }
    
    @IBAction func tappedShowConfirmPassword(_ sender: UIButton) {
    }

    @IBAction func tappedSaveButton(_ sender: UIButton) {
    }
}
