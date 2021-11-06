//
//  EmailEditorViewController.swift
//  HogwartsApp
//
//  Created by Elena Diniz on 20/10/21.
//

import UIKit

class EmailEditorViewController: UIViewController {
    
    @IBOutlet weak var viewMain: GradientView!
    @IBOutlet weak var viewSuccess: UIView!
    @IBOutlet weak var confirmationEmailLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var changeEmailButton: ButtonGradient!
    
    var email = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    @IBAction func closeButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func tappedChangeEmailButton(_ sender: UIButton) {
        if validateForm() {
            self.view.endEditing(true)
            let emailUser = emailTextField.text!.trimmingCharacters(in: .whitespaces)
            
            let parameters = [
                "email": emailUser
            ]
            
//              let network = Network(self)
//              network.resetPassword(self, parameters: parameters) { (success) in
//                  if success {
//                      self.view.hideLoadingIndicator()
//                      self.emailTextfield.isHidden = true
//                      self.textLabel.isHidden = true
//                      self.viewSuccess.isHidden = false
//                      self.emailLabel.text = self.emailTextfield.text?.trimmingCharacters(in: .whitespaces)
//                      self.recoverPasswordButton.titleLabel?.text = "REENVIAR E-MAIL"
//                  }
//              }
        }
    }
    
    fileprivate func validateForm() -> Bool {
        let status = emailTextField.text!.isEmpty ||
            !emailTextField.text!.contains(".") ||
            !emailTextField.text!.contains("@") ||
        emailTextField.text!.count <= 5
        
        if status {
            emailTextField.setErrorColor()
            infoLabel.textColor = .systemRed
            infoLabel.text = "Verifique o e-mail informado"
            return false
        }
        
        return true
    }
}

extension EmailEditorViewController {
    
    fileprivate func setupView() {
        changeEmailButton.layer.cornerRadius = changeEmailButton.bounds.height / 2
        
        emailTextField.setEditingColor()
        
        if !email.isEmpty {
            emailTextField.text = email
            emailTextField.isEnabled = false
        }
        validateButton()
    }
    
    @IBAction func emailBeginEditing(_ sender: Any) {
        emailTextField.setEditingColor()
        infoLabel.textColor = .gray
        infoLabel.text = "Informe o e-mail associado à sua conta"
    }
    
    @IBAction func emailEditing(_ sender: Any) {
        emailTextField.setEditingColor()
        
        infoLabel.textColor = .gray
        infoLabel.text = "Informe o e-mail associado à sua conta"
        
        validateButton()
    }
    
    @IBAction func emailEndEditing(_ sender: Any) {
        emailTextField.setEditingColor()
    }
    
    fileprivate func validateButton() {
        if !emailTextField.text!.isEmpty {
            enableCreateButton()
        } else {
            disableCreateButton()
        }
    }
    
    fileprivate func disableCreateButton() {
        changeEmailButton.backgroundColor = .gray
        changeEmailButton.setTitleColor(.black, for: .normal)
        changeEmailButton.isEnabled = false
    }
    
    fileprivate func enableCreateButton() {
        changeEmailButton.setTitleColor(.white, for: .normal)
        changeEmailButton.isEnabled = true
    }
}

