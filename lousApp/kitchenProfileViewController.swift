import UIKit

class kitchenProfileViewController: UIViewController,UITextFieldDelegate, UITextViewDelegate {
    var inc: [employeeKitchen] = []
    var incc = 0
    var myself: thirdViewController!
    var payy = 11.00
    var tableView: UITableView!

    @IBOutlet weak var nameOutet: UILabel!
    @IBOutlet weak var lastOutlet: UILabel!
    @IBOutlet weak var phoneeOutelt: UIButton!
    @IBOutlet weak var pay: UILabel!
    @IBOutlet weak var diSwitch: UISwitch!
    @IBOutlet weak var paSwitch: UISwitch!
    @IBOutlet weak var apSwitch: UISwitch!
    @IBOutlet weak var stSwitch: UISwitch!
    @IBOutlet weak var ovSwitch: UISwitch!
    @IBOutlet weak var toSwitcg: UISwitch!
    @IBOutlet weak var prSwitch: UISwitch!
    @IBOutlet weak var notesOutlet: UITextView!
    @IBOutlet weak var saSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameOutet.text! = inc[incc].firstName
        lastOutlet.text! = inc[incc].lastName
        phoneeOutelt.setTitle(inc[incc].phone, for: .normal)
        notesOutlet.text! = inc[incc].notes
        notesOutlet.delegate = self
        setAllSkills()
       

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
           
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
        
    //keyboard function
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
    
    
    //call button
    @IBAction func callButton(_ sender: Any) {
    var url:NSURL = NSURL(string: "tel://\(inc[incc].phone)")!
    UIApplication.shared.openURL(url as URL)
    }
    
    //settng pay
    func setPay(){
    payy = 11
    var add = inc[incc].di + inc[incc].pa + inc[incc].ap + inc[incc].st + inc[incc].ov + inc[incc].sa + inc[incc].to + inc[incc].pr
    payy = payy + 0.25 * Double(add)
    pay.text = "$\(String(payy))"
    }
    
    
    //changing values with the switch
    @IBAction func diChange(_ sender: UISwitch) {
        if diSwitch.isOn == true{
        inc[incc].di = 1
        setPay()
        }
        else {
        inc[incc].di = 0
        setPay()
        }
    }
    
    @IBAction func paChange(_ sender: Any) {
        if paSwitch.isOn == true{
        inc[incc].pa = 1
        setPay()
        }
        else {
        inc[incc].pa = 0
        setPay()
        }
    }
    
    
    @IBAction func apChange(_ sender: Any) {
        if apSwitch.isOn == true{
        inc[incc].ap = 1
        setPay()
        }
        else {
        inc[incc].ap = 0
        setPay()
        }
    }
    
    
    @IBAction func stChange(_ sender: Any) {
        if stSwitch.isOn == true{
        inc[incc].st = 1
        setPay()
        }
        else {
        inc[incc].st = 0
        setPay()
        }
    }
    
    
    @IBAction func ovChange(_ sender: Any) {
        if ovSwitch.isOn == true{
        inc[incc].ov = 1
        setPay()
        }
        else {
        inc[incc].ov = 0
        setPay()
        }
    }
    
    
    @IBAction func saChange(_ sender: Any) {
        if saSwitch.isOn == true{
        inc[incc].sa = 1
        setPay()
        }
        else {
        inc[incc].sa = 0
        setPay()
        }
    }
    
    @IBAction func toChange(_ sender: Any) {
        if toSwitcg.isOn == true{
        inc[incc].to = 1
        setPay()
        }
        else {
        inc[incc].to = 0
        setPay()
        }
    }
    
    @IBAction func prSwitch(_ sender: Any) {
        if prSwitch.isOn == true{
        inc[incc].pr = 1
        setPay()
        }
        else {
        inc[incc].pr = 0
        setPay()
        }
    }
    
    //switch set up
    func setAllSkills(){
    if inc[incc].di == 1{
    diSwitch.setOn(true, animated: true)
    }
    if inc[incc].pa == 1{
    paSwitch.setOn(true, animated: true)
    }
    if inc[incc].ap == 1{
    apSwitch.setOn(true, animated: true)
    }
    if inc[incc].st == 1{
    stSwitch.setOn(true, animated: true)
    }
    if inc[incc].ov == 1{
    ovSwitch.setOn(true, animated: true)
    }
    if inc[incc].sa == 1{
    saSwitch.setOn(true, animated: true)
    }
    if inc[incc].to == 1{
    toSwitcg.setOn(true, animated: true)
    }
    if inc[incc].pr == 1{
    prSwitch.setOn(true, animated: true)
    }
    }
    

    
    //sending stuff over
    override func viewWillDisappear(_ animated: Bool) {
    inc[incc].notes = notesOutlet.text
    tableView.reloadData()
    myself.callSave()
    }
  
       
    //return button on keyboard
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    if text == "\n" {
    notesOutlet.resignFirstResponder()
    return false
    }
    return true
    }
    
    
    
    

}
    
    
    
    
    
    
    
    



