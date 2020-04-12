//
//  CollegeTableViewCell.swift
//  CollegeManagement
//
//  Created by apple on 10/04/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit

class CollegeTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var lblUniversity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCellWith(name: String, city: String, university: String){
        self.nameLbl.text = "Name: \(name)"
        self.cityLbl.text = "City: \(city)"
        self.lblUniversity.text = "University: \(university)"
    }
    
    static func registerXib(with tableview: UITableView){
        let nib = UINib(nibName: String(describing: self), bundle: nil)
        tableview.register(nib, forCellReuseIdentifier: "collegeCell")
    }
    
}
