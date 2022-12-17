//
//  NotesViewController.swift
//  CRUDActivity

import UIKit
import CoreData

class NotesViewController: UIViewController {

    //All IBOutlet
    @IBOutlet weak var noteTitle: UITextField!
    @IBOutlet weak var descriptionTitle: UITextView!
    @IBOutlet weak var addPhoto: UIButton!
    @IBOutlet weak var write: UIButton!
    @IBOutlet weak var alignmentText: UIButton!
    @IBOutlet weak var save: UIButton!
    
    //CoreData
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var noteArray : [Note] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addPhotoAction(_ sender: Any) {
    }
    
    @IBAction func writeAction(_ sender: Any) {
        
    }
    
    @IBAction func alignmentTextAction(_ sender: Any) {
        if descriptionTitle.textAlignment == .center{
            descriptionTitle.textAlignment = .right
            alignmentText.setImage(UIImage(systemName: "text.justifyright"), for: .normal)
        }else if descriptionTitle.textAlignment == .left{
            descriptionTitle.textAlignment = .center
            alignmentText.setImage(UIImage(systemName: "text.justify"), for: .normal)
        }else{
            descriptionTitle.textAlignment = .left
            alignmentText.setImage(UIImage(systemName: "text.justifyleft"), for: .normal)
        }
    }
    
    @IBAction func saveAction(_ sender: Any) {
        if noteTitle.text != ""{
            let note = NSEntityDescription.insertNewObject(forEntityName: "Note", into: self.managedObjectContext) as! Note

            note.noteTitle = noteTitle.text
            note.noteText = descriptionTitle.text
            
            do{
                try self.managedObjectContext.save()
            }catch {
                print("\(error)")
            }
            self.noteArray.append(note)
        }
    }
    
}
