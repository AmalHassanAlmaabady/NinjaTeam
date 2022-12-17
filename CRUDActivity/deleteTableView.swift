//
//  deleteTableView.swift
//  CRUDActivity
//
//  Created by maram  on 23/05/1444 AH.
//

import UIKit

class deleteTableView: UITableView , UITableViewDataSource, UITableViewDelegate {
    
        var deletedNotes = [Note]()
    
        func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let edit = UIContextualAction(style: .normal, title: "Edit") {(action, view, compeletionHandler) in
            
        }
        edit.backgroundColor = .systemGreen
        
        let delete = UIContextualAction(style: .normal, title: "Delete") { [self](action, view, compeletionHandler) in
            self.deletedNotes.remove(at: indexPath.row)
        }
        delete.backgroundColor = .red
        
        let swip = UISwipeActionsConfiguration(actions: [edit, delete])
        return swip
    }
    
    
    

    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
        func deleteTableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deletedNotes.count
    }
    
   
    
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "deleteCell") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "deleteCell")

        let deletedNotes = deletedNotes[indexPath.row]
        

        return cell
        }
    
    
   

}
