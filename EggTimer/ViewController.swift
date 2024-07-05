import UIKit

class ViewController: UIViewController {
    
    let eggTime=["Soft":300,"Medium":420,"Hard":720];
    
    @IBOutlet weak var displayTimer: UILabel!
    @IBOutlet weak var cancelTimerBtn: UIButton!
    
    override func viewDidLoad() {
            super.viewDidLoad()
        cancelTimerBtn.isHidden=true;
        }
    var timer:Timer?
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness=sender.currentTitle!;
        var targetTime=eggTime[hardness]!;
        
        displayTimer.text="\(self.formatTime(targetTime))s left";
        cancelTimerBtn.isHidden=false;
        timer=Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){
            timer in
            targetTime-=1
//            self.displayTimer.text="\(targetTime)s left"
            self.displayTimer.text = "\(self.formatTime(targetTime))s left";


            if targetTime==0{
                self.displayTimer.text = "Done!"
                self.cancelTimerBtn.isHidden = true
            }
        }
    }
    @IBAction func handleCancelTimer(_ sender: UIButton) {
        timer?.invalidate()
        self.displayTimer.text="--:-- left";
        cancelTimerBtn.isHidden=true
    }
    func formatTime(_ seconds: Int) -> String {
            let minutes = seconds / 60
            let remainingSeconds = seconds % 60
            return String(format: "%02d:%02d", minutes, remainingSeconds)
    }
}
