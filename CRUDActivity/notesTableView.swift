//
//  ViewController.swift
//  CRUDActivity

import UIKit
import CoreData
class notesTableView: UIViewController{

    @IBOutlet weak var notesTable: UITableView!
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var notes: [Note] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: (UIImage(named: "backG")!))
        self.notesTable.backgroundColor = .clear
        print("Hi ninjas mmmmm ")
        notesTable.dataSource = self
        notesTable.delegate = self
        notesTable.reloadData()
        // Do any additional setup after loading the view.
    }
}
extension notesTableView: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notesTable.rowHeight = 100
        
       
        return 3
       // return notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell") as! noteCell
        

        cell.titleLable.text = "title"
        cell.textLable.text = "text"
        cell.dateLable.text = "date"
        return cell
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let edit = UIContextualAction(style: .normal, title: "Edit") {(action, view, compeletionHandler) in
           
        }
        edit.backgroundColor = .systemGreen
        
        let delete = UIContextualAction(style: .normal, title: "Delete") {(action, view, compeletionHandler) in
           
        }
        delete.backgroundColor = .red
        
        let swip = UISwipeActionsConfiguration(actions: [edit, delete])
        return swip
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
    }
}

