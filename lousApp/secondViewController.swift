import UIKit

class secondViewController: UIViewController,UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var tableViewOutlet: UITableView!
    
    
    @IBOutlet weak var addButtonOutlet: UIButton!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // students.count
       10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
       
        cell.textLabel?.text = "hi"
        return cell
    }
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
               if segue.identifier == "moving"{
               let nvc = segue.destination as! carryOutProfileViewController
                   
               }
               else{
               }
           }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           performSegue(withIdentifier: "moving", sender: nil)
       }

    
    

    
    
    
    @IBAction func addButton(_ sender: UIButton) {
        addButtonOutlet.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
    }
    
    
    @objc private func showAlert(){
    let alertt = UIAlertController(title: "Add a New Employee", message: "Enter the employee information.", preferredStyle: .alert)
        
        //adding options
        alertt.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alertt.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
        
        //adding fields
        alertt.addTextField { field in
            field.placeholder = "First Name"
            field.returnKeyType = .next
            field.keyboardType = .default
        }
        alertt.addTextField { field in
            field.placeholder = "Last Name"
            field.returnKeyType = .continue
            field.keyboardType = .default
        }
        alertt.addTextField { field in
            field.placeholder = "Phone Number"
            field.returnKeyType = .continue
            field.keyboardType = .numberPad
            
        }
        
        //read values
        guard let fields = alertt.textFields, fields.count == 3 else{
            return
        }
        
        let firstField = fields[0]
        let secondField = fields[1]
        let numberField = fields[2]
        
//        guard let firstName = firstField.text, !firstName.isEmpty, let lastName = secondField.text, !lastName.isEmpty, let phoneNum = numberField.text, !phoneNum.isEmpty else{
//            print("invalid entries")
//            return
//        }
        
        
        
        present(alertt, animated: true)

       
        
        
        
    }



    
    
    
    
    
    
    
    
    

}
