//
//  CollegeFormViewController.swift
//  CollegeManagement
//
//  Created by apple on 10/04/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import Foundation

class CollegeFormViewController: UIViewController {

    @IBOutlet weak var txtCollegeName: UITextField!
    @IBOutlet weak var txtCollegeCity: UITextField!
    @IBOutlet weak var txtCollegeAddress: UITextField!
    @IBOutlet weak var txtCollegeUniversity: UITextField!
    @IBOutlet weak var buttonSave: UIButton!
    var collegeDetail:College?
    var isUpdate: Bool?
    var index = Int()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if isUpdate ?? false {
                  buttonSave.setTitle("Update", for: .normal)
                self.txtCollegeName.text = collegeDetail?.name
                  self.txtCollegeCity.text = collegeDetail?.city
                  self.txtCollegeAddress.text = collegeDetail?.address
                  self.txtCollegeUniversity.text = collegeDetail?.university
              }
              else{
                   buttonSave.setTitle("Save", for: .normal)
              }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension CollegeFormViewController{
    @IBAction func buttonSaveClick(_ sender: UIButton) {
        
        if isUpdate ?? false {
            self.collegeUpdateData()
        }
        else{
            self.collegeSaveData()
        }
       }
}

extension CollegeFormViewController{
    func collegeSaveData(){
       
        guard let collegeName = txtCollegeName.text, let collegeCity = txtCollegeCity.text, let collegeAddress = txtCollegeAddress.text, let collegeUniversity = txtCollegeUniversity.text else {
            return
        }
        
        let dict = ["collegeName": collegeName, "collegeCity":collegeCity,"collegeAddress": collegeAddress, "collegeUniversity":collegeUniversity]
        DataBaseHelper.sharedInstance.save(object: dict)
        navigationController?.popViewController(animated: true)
    }
    
    func collegeUpdateData(){
           
           guard let collegeName = txtCollegeName.text, let collegeCity = txtCollegeCity.text, let collegeAddress = txtCollegeAddress.text, let collegeUniversity = txtCollegeUniversity.text else {
               return
           }
           
           let dict = ["collegeName": collegeName, "collegeCity":collegeCity,"collegeAddress": collegeAddress, "collegeUniversity":collegeUniversity]
          
        DataBaseHelper.sharedInstance.updateCollegeData(dataDict: dict, index: index)
        
           navigationController?.popViewController(animated: true)
       }
}

