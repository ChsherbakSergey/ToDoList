//
//  ViewController.swift
//  ToDoList
//
//  Created by Sergey on 6/15/20.
//  Copyright © 2020 Chsherbak Sergey. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    //Linked all IBOutlets.
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var userSurnameTextField: UITextField!
    
    @IBOutlet weak var userNameAndSurnameLabel: UILabel!
    
    @IBOutlet weak var createNewTaskButton: UIButton!
    
    @IBOutlet weak var enterDesignButton: UIButton!
    
    @IBAction func enterActionButton(_ sender: Any) {
        //Check if fields are empty then userNameAndSurnameLabel shows - "Hello, stranger". Otherwise is shows what user has typed in the fields.
        if userNameTextField.text == "" && userSurnameTextField.text == "" {
            UserInfo.shared.userName = ""
            UserInfo.shared.userSurname = ""
            userNameAndSurnameLabel.text = "Hello, stranger"
        } else {
            UserInfo.shared.userName = userNameTextField.text!
            UserInfo.shared.userSurname = userSurnameTextField.text!
            userNameAndSurnameLabel.text = "Hello, " + userNameTextField.text! + " " + userSurnameTextField.text!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateEnterButton()
        showNameAndSurname()
        updateCreateNewTaskButton()
    }

    //Design of the EnterButton.
    func updateEnterButton() {
        enterDesignButton.layer.borderWidth = 1
        enterDesignButton.layer.borderColor = UIColor.black.cgColor
        enterDesignButton.backgroundColor = UIColor.white
        enterDesignButton.layer.cornerRadius = 20
    }
    
    //Checks if UserInfo not equals nil or "" and then shows us the info an user has typed before. In another case shows = "Hello, stranger"
    func showNameAndSurname() {
        if UserInfo.shared.userName != nil && UserInfo.shared.userName != "" && UserInfo.shared.userSurname != nil && UserInfo.shared.userSurname != "" {
            userNameAndSurnameLabel.text = "Hello, " + UserInfo.shared.userName! + " " + UserInfo.shared.userSurname!
        } else if UserInfo.shared.userName == "" && UserInfo.shared.userSurname == ""  {
            userNameAndSurnameLabel.text = "Hello, stranger"
        }
    }
    
    //Design of the CreateNewTaskButton.
    func updateCreateNewTaskButton() {
        createNewTaskButton.layer.borderWidth = 1
        createNewTaskButton.layer.borderColor = UIColor.white.cgColor
        createNewTaskButton.backgroundColor = UIColor.black
        createNewTaskButton.layer.cornerRadius = 20
    }
}


