//
//  EmailEditorViewController.swift
//  HogwartsApp
//
//  Created by Elena Diniz on 20/10/21.
//

import UIKit

class EmailEditorViewController: UIViewController {
    
    @IBOutlet weak var viewMain: GradientView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var newEmailTextField: UITextField!
    @IBOutlet weak var confirmNewEmailTextField: UITextField!
    @IBOutlet weak var saveButton: ButtonGradient!
    @IBOutlet weak var changePasswordButton: ButtonGradient!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupView()
    }
    
    func setupView() {
        errorLabel.isHidden = true
        changePasswordButton.layer.cornerRadius = changePasswordButton.layer.frame.height / 2
        changePasswordButton.layer.borderWidth = 1
        saveButton.layer.cornerRadius = saveButton.layer.frame.height / 2
        saveButton.layer.borderWidth = 1
        emailTextField.setEditingColor()
        newEmailTextField.setEditingColor()
        confirmNewEmailTextField.setEditingColor()
    }
    
    @IBAction func closeButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func tappedChangePasswordButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "UserSettings", bundle: nil)
        let password = storyboard.instantiateViewController(withIdentifier: "PasswordEditorViewController") as! PasswordEditorViewController
        password.providesPresentationContextTransitionStyle = true
        password.definesPresentationContext = true
        password.modalPresentationStyle = .automatic
        self.present(password, animated: true)
    }
    
    @IBAction func tappedSaveButton(_ sender: UIButton) {
    }
}
