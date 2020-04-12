//
//  StudentListViewController.swift
//  CollegeManagement
//
//  Created by apple on 12/04/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class StudentListViewController: UIViewController {
    @IBOutlet weak var studentListView: UITableView!
    var studentArr:[Student]?
    var college:College?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        studentListView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

    }
    @IBAction func buttonAddClick(_ sender: UIBarButtonItem) {
        let vc = self.storyboard?.instantiateViewController(identifier: "StudentFormViewController") as? StudentFormViewController
        vc?.college = college!
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if college?.students?.allObjects != nil {
            studentArr = college?.students?.allObjects as? [Student]
        }
       // studentArr = DataBaseHelper.sharedInstance.getStudentRecord()
        studentListView.reloadData()
    }
    
}

extension StudentListViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentArr?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if cell != nil {
            cell = UITableViewCell(style: .value2, reuseIdentifier: "cell")
        }
        cell.textLabel?.text = studentArr?[indexPath.row].name
        cell.detailTextLabel?.text = studentArr?[indexPath.row].phone
        return cell
    }
    
    
}
