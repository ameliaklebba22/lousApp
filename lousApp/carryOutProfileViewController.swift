import UIKit

class carryOutProfileViewController: UIViewController,UITextFieldDelegate, UITextViewDelegate {
    var inc: [employeeCO] = []
    var incc = 0
    var myself: secondViewController!
    @IBOutlet weak var phonesSwitch: UISwitch!
    @IBOutlet weak var runnerSwitch: UISwitch!
    @IBOutlet weak var bagSwitch: UISwitch!
    @IBOutlet weak var timesSwicth: UISwitch!
    @IBOutlet weak var greetSwitch: UISwitch!
    @IBOutlet weak var hostSwitch: UISwitch!
    @IBOutlet weak var cashSwitch: UISwitch!
    var payy = 11.00
    @IBOutlet weak var lastOutlet: UILabel!
    @IBOutlet weak var nameOutlet: UILabel!
    @IBOutlet weak var notesOutlet: UITextView!
    @IBOutlet weak var pay: UILabel!
    @IBOutlet weak var phoneeOutlet: UIButton!
    var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameOutlet.text! = inc[incc].firstName
        lastOutlet.text! = inc[incc].lastName
        phoneeOutlet.setTitle(inc[incc].phone, for: .normal)
        notesOutlet.text! = inc[incc].notes
        notesOutlet.delegate = self
        setAllSkills()
       

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
           
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
        
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
    setAllSkills()
    setPay()
    }
    
    

    @IBAction func funcCallButton(_ sender: Any) {
    var url:NSURL = NSURL(string: "tel://\(inc[incc].phone)")!
    UIApplication.shared.openURL(url as URL)
    }
        
    func setPay(){
    payy = 11
    var add = inc[incc].ph + inc[incc].ru + inc[incc].ba + inc[incc].ti + inc[incc].gr + inc[incc].ho + inc[incc].ca
    payy = payy + 0.25 * Double(add)
    pay.text = "$\(String(payy))"
    }
    
    
    
    
    
    
    @IBAction func phonesChange(_ sender: UISwitch) {
        if phonesSwitch.isOn == true{
        inc[incc].ph = 1
        setPay()
        }
        else {
        inc[incc].ph = 0
        setPay()
        }
    }
    
    
    @IBAction func runnerChange(_ sender: UISwitch) {
        if runnerSwitch.isOn == true{
        inc[incc].ru = 1
        setPay()
        }
        else {
        inc[incc].ru = 0
        setPay()
        }
    }
    
    @IBAction func bagChange(_ sender: UISwitch) {
        if bagSwitch.isOn == true{
        inc[incc].ba = 1
        setPay()
        }
        else {
        inc[incc].ba = 0
        setPay()
        }
    }
    
    
    @IBAction func timesChange(_ sender: UISwitch) {
        if timesSwicth.isOn == true{
        inc[incc].ti = 1
        setPay()
        }
        else {
        inc[incc].ti = 0
        setPay()
        }
    }
    
    
    @IBAction func greetChange(_ sender: UISwitch) {
        if greetSwitch.isOn == true{
        inc[incc].gr = 1
        setPay()
        }
        else {
        inc[incc].gr = 0
        setPay()
        }
    }
    

    @IBAction func hostChange(_ sender: UISwitch) {
        if hostSwitch.isOn == true{
        inc[incc].ho = 1
        setPay()
        }
        else {
        inc[incc].ho = 0
        setPay()
        }
    }
    
    
    
    
    @IBAction func cashChange(_ sender: UISwitch) {
        if cashSwitch.isOn == true{
        inc[incc].ca = 1
        setPay()
        }
        else {
        inc[incc].ca = 0
        setPay()
        }
    }
    
    
    func setAllSkills(){
        if inc[incc].ph == 1{
        phonesSwitch.setOn(true, animated: true)
        }
        if inc[incc].ru == 1{
        runnerSwitch.setOn(true, animated: true)
        }
        if inc[incc].ba == 1{
        bagSwitch.setOn(true, animated: true)
        }
        if inc[incc].ti == 1{
        timesSwicth.setOn(true, animated: true)
        }
        if inc[incc].gr == 1{
        greetSwitch.setOn(true, animated: true)
        }
        if inc[incc].ho == 1{
            hostSwitch.setOn(true, animated: true)
        }
        
        if inc[incc].ca == 1{
            cashSwitch.setOn(true, animated: true)
        }
    }
    
//    @IBAction func pooo(_ sender: Any) {
//           dismiss(animated: true, completion: nil)
//       }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        inc[incc].notes = notesOutlet.text
        tableView.reloadData()
        myself.callSave()
    }
  
       
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            notesOutlet.resignFirstResponder()
            return false
        }
        return true
    }
    
    
    
    

}
    
    
    
    
    
    
    
    


