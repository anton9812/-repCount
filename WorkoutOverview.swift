//
//  AddToWorkOutProgramViewController.swift
//  repCount
//
//  Created by Anton Samuilov on 23/10/2020.
//

import UIKit
import Foundation
import CoreData

class WorkoutOverview: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var workoutArray : [Workout]? = []
    //var exersiseArray : Exercise?
    var sda : String = ""
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dismissButton: UIBarButtonItem!
    
    let days = ["Monday" , "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    
    //delete
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: nil)
        
        fetchData()
       // print(exersiseArray)
       // navigationItem.title = "Workout"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.backgroundColor = UIColor.clear
        tableView.contentInsetAdjustmentBehavior = .never



        
    }
    func fetchData(){
        do {
            self.workoutArray = try context.fetch(Workout.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch{
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 30
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let exercise = self.workoutArray![indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! daysCell
        //cell.label2
        //cell.label2.text = exercise?.monday
            //print(exercise?.exerciseDay)
//        if indexPath.section == 0 && exercise?.exerciseDay == "Monday"{
//            //cell.lable.text = exercise?.exerciseDay
//            cell.label2.text = exercise?.exerciseName
//        }
//        if indexPath.section == 1 && exercise?.exerciseDay == "Tuesday"{
//            cell.lable.text = exercise?.exerciseDay
//            cell.label2.text = exercise?.exerciseName
//        }
//        if indexPath.section == 2 && exercise?.exerciseDay == "Wednesday"{
//            cell.lable.text = exercise?.exerciseDay
//            cell.label2.text = exercise?.exerciseName
//        }
//        if indexPath.section == 3 && exercise?.exerciseDay == "Thursday"{
//            cell.lable.text = exercise?.exerciseDay
//            cell.label2.text = exercise?.exerciseName
//        }
//        if indexPath.section == 4 && exercise?.exerciseDay == "Friday"{
//            cell.lable.text = exercise?.exerciseDay
//            cell.label2.text = exercise?.exerciseName
//        }
//        if indexPath.section == 5 && exercise?.exerciseDay == "Saturday"{
//            cell.lable.text = exercise?.exerciseDay
//            cell.label2.text = exercise?.exerciseName
//        }
//        if indexPath.section == 6 && exercise?.exerciseDay == "Sunday"{
//            cell.lable.text = exercise?.exerciseDay
//            cell.label2.text = exercise?.exerciseName
//        }
        
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return days.count
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       let view = UIView()
        if (section == 0) {
            view.frame =  CGRect(x: 10, y: 0, width: 0 , height: 40)
        }else{
            view.frame =  CGRect(x: 10, y: 0, width: 0, height: 22)
        }
        
        view.layer.cornerRadius = 8
                let label = UILabel(frame: CGRect(x: 10, y: 0, width: tableView.frame.size.width, height: 22))
                label.font = UIFont.systemFont(ofSize: 16)
        label.text = days[section].description
        label.textColor = .white
                view.addSubview(label)
                view.backgroundColor = UIColor.init(red: 103/255, green: 123/255, blue: 249/255, alpha: 1)// Set
         
        return view
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
    }
    
    
    
    @IBAction func dismissView(_ sender: Any) {
        
       // self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
  
}
extension WorkoutOverview : exerxciseSelected {
    
    func selected(exercise: Exercise) {
        
        
        
    }
    }




