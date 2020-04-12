//
//  DataBaseHelper.swift
//  CollegeManagement
//
//  Created by apple on 10/04/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import CoreData

class DataBaseHelper: NSObject {

    static let sharedInstance = DataBaseHelper()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func save(object:[String:String]){
        let college = NSEntityDescription.insertNewObject(forEntityName: "College", into: context) as! College
        college.name = object["collegeName"]
        college.city = object["collegeCity"]
        college.address = object["collegeAddress"]
        college.university = object["collegeUniversity"]
        
        do {
            try context.save()
        }catch let error{
            print("error in saving: \(error.localizedDescription)")
        }
    }
    
    func saveStudent(object:[String:String], college:College){
          let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context) as! Student
          student.name = object["name"]
          student.phone = object["phone"]
          student.email = object["email"]
        student.universities = college
          do {
              try context.save()
          }catch let error{
              print("error in saving: \(error.localizedDescription)")
          }
      }
    
    func getStudentRecord() -> [Student]{
        var student = [Student]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
        do {
            student = try context.fetch(fetchRequest) as! [Student]
        }catch let err{
            print("Error in fetching student data is : \(err.localizedDescription)")
        }
        return student
    }
    
    
    func getCollegeRecord() -> [College]{
        var collegeArr = [College]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "College")
        do {
          collegeArr =  try context.fetch(fetchRequest) as! [College]
        }catch let error{
            print("Error in fetching is: \(error.localizedDescription)")
        }
        return collegeArr
    }
    
    
    func deleteCollegeData(index:Int) -> [College]{
        var collegeArr = self.getCollegeRecord()
        context.delete(collegeArr[index])
        collegeArr.remove(at: index)
        
        do {
            try context.save()
        }catch{
            print("cannot delete college data: \(error.localizedDescription)")
        }
        
        return collegeArr
    }
    
    func updateCollegeData(dataDict: [String:String], index: Int){
        let college = self.getCollegeRecord()
              college[index].name = dataDict["collegeName"]
              college[index].city = dataDict["collegeCity"]
              college[index].address = dataDict["collegeAddress"]
              college[index].university = dataDict["collegeUniversity"]
        
        do{
            try context.save()
        }catch let err{
            print("error in update is: \(err.localizedDescription)")
        }
    }
}
