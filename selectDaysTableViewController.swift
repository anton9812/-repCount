//
//  selectDays.swift
//  repCount
//
//  Created by Anton Samuilov on 11/11/2020.
//

import UIKit
import CoreData


class selectDaysTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var tableView: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var selectedExercise : [Exercise] = []
    let days = ["Monday" , "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    var rowsWhichAreChecked = [NSIndexPath]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        //tableView.layer.borderWidth = 0.3
        tableView.layer.borderColor = UIColor.black.cgColor
        tableView.backgroundColor = .white
        
        

       

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return days.count
    }

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "daysC", for: indexPath) as! daysCellSelect
        cell.label.text = days[indexPath.item]
       // cell.tickButton.tag = indexPath.item
        
        cell.cellBackground.layer.shadowColor = UIColor.gray.cgColor
        cell.cellBackground.layer.shadowOpacity = 0.4
        cell.cellBackground.layer.shadowRadius = 3
        cell.cellBackground.layer.shadowOffset = CGSize(width: 1.0,height: 1.0)
        cell.cellBackground.layer.cornerRadius = 10
       // cell.cellView.layer.borderColor = UIColor.init(red: 103/255, green: 123/255, blue: 249/255, alpha: 1).cgColor
        cell.cellBackground.layer.borderWidth = 0
        
       // cell.cellView.layer.borderColor = UIColor.init(red: 103/255, green: 123/255, blue: 249/255, alpha: 1).cgColor
        cell.cellBackground.layer.borderWidth = 0
        
        
        
        
     
        //cell.tickButton.isHidden = true
        
        return cell
    }
//    @objc func checked(sender:UIButton){
//        if sender.isSelected {
//            sender.isSelected = false
//        }
//        else{
//            sender.isSelected = true
//
//        }
//        tableView.reloadData()
//
//    }
     func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
        let cell:daysCellSelect = tableView.cellForRow(at: indexPath) as! daysCellSelect
        //cell.tickButton.isHidden = true

        cell.cellBackground.backgroundColor = UIColor.white
        cell.label.textColor = .black
        cell.cellBackground.layer.borderColor  = UIColor.black.cgColor
        cell.cellBackground.layer.borderWidth = 0.2
            }
     func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let cell:daysCellSelect = tableView.cellForRow(at: indexPath) as! daysCellSelect
      
        cell.backgroundColor = .white
    }
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell:daysCellSelect = tableView.cellForRow(at: indexPath) as! daysCellSelect
        //cell.tickButton.isHidden = false
        
        cell.cellBackground.backgroundColor = UIColor.init(red: 103/255, green: 123/255, blue: 249/255, alpha: 1)
        cell.label.textColor = .white
        
        cell.cellBackground.layer.borderColor = UIColor.white.cgColor
        cell.cellBackground.layer.borderWidth = 0.7
        
        
//        cell.cellBackground.backgroundColor = UIColor.init(red: 103/255, green: 123/255, blue: 249/255, alpha: 1)
//        cell.label.textColor = .white
//
//        cell.cellBackground.layer.borderColor = UIColor.white.cgColor
//        cell.cellBackground.layer.borderWidth = 0.7
        
        
        
        
        for exercice in selectedExercise{
        
        do{
                            let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Exercise")
                                fetchReq.returnsObjectsAsFaults = false
            fetchReq.predicate = NSPredicate(format:"exerciseID = %@", exercice.exerciseID! as CVarArg)
                                do {
                                    let obj = try context.fetch(fetchReq) as!  [Exercise]

                                    for details in obj {
                                        print(details)
                                        //details.addToIsIn(<#T##value: Workout##Workout#>)


                                        //details.exerciseDay = selectedDay ?? "Monday"

                                        //array.append(details)
                                    }

                                } catch {
                                    print("Error in Fetching")

                                }
                }
        }
        
}

}
