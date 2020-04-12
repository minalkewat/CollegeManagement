//
//  ViewController.swift
//  CollegeManagement
//
//  Created by apple on 10/04/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class CollegeListViewController: UIViewController {

    @IBOutlet weak var collegeListView: UITableView!
    
    var collegeArr:[College]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        CollegeTableViewCell.registerXib(with: collegeListView)
        collegeArr = DataBaseHelper.sharedInstance.getCollegeRecord()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collegeArr = DataBaseHelper.sharedInstance.getCollegeRecord()
        collegeListView.reloadData()

    }

    @IBAction func buttonAddClick(_ sender: UIBarButtonItem) {
        let vc = self.storyboard?.instantiateViewController(identifier: "CollegeFormViewController") as? CollegeFormViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}

extension CollegeListViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collegeArr?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CollegeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "collegeCell", for: indexPath) as! CollegeTableViewCell
        cell.configureCellWith(name: collegeArr?[indexPath.row].name ?? "", city: collegeArr?[indexPath.row].city ?? "", university: collegeArr?[indexPath.row].university ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            collegeArr = DataBaseHelper.sharedInstance.deleteCollegeData(index: indexPath.row)
            self.collegeListView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(identifier: "CollegeTableViewController") as? CollegeTableViewController
        vc?.collegeDetail = collegeArr?[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
}

