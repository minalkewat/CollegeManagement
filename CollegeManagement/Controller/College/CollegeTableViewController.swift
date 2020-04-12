//
//  CollegeTableViewController.swift
//  CollegeManagement
//
//  Created by apple on 10/04/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class CollegeTableViewController: UITableViewController {
    @IBOutlet weak var collegeNameLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var addressLbl: UILabel!
    @IBOutlet weak var universityLbl: UILabel!
    @IBOutlet weak var studentsLbl: UILabel!
    
    var collegeDetail:College?
    var index = Int()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collegeNameLbl.text = collegeDetail?.name
        cityLbl.text = collegeDetail?.city
        addressLbl.text = collegeDetail?.address
        universityLbl.text = collegeDetail?.university
        studentsLbl.text = collegeDetail?.students?.count.description
    }
    
    @IBAction func buttonEditClick(_ sender: UIBarButtonItem) {
        let vc = self.storyboard?.instantiateViewController(identifier: "CollegeFormViewController") as? CollegeFormViewController
        vc?.collegeDetail = collegeDetail
        vc?.isUpdate = true
        vc?.index = index
               self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 4{
            let vc = self.storyboard?.instantiateViewController(identifier: "StudentListViewController") as? StudentListViewController
            vc?.college = collegeDetail
            self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
    
    
    
    
    
    

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 4
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
