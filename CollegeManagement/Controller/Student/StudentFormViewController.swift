//
//  StudentFormViewController.swift
//  CollegeManagement
//
//  Created by apple on 12/04/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class StudentFormViewController: UIViewController {
    @IBOutlet weak var txtStudentName: UITextField!
    @IBOutlet weak var txtStudentPhone: UITextField!
    @IBOutlet weak var txtStudentEmail: UITextField!
    var college = College()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func buttonSaveClick(_ sender: UIButton) {
        guard let name = txtStudentName.text, let phone = txtStudentPhone.text, let email = txtStudentEmail.text else {return}
        let studentDict = ["name":name, "phone": phone, "email": email]
        DataBaseHelper.sharedInstance.saveStudent(object: studentDict, college: college)
        self.navigationController?.popViewController(animated: true)
    }
    
    

}
