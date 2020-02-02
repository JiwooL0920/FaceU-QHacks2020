
import Foundation
import UIKit
import FirebaseFirestore
import FirebaseAuth
import Charts

class AnalyzeViewController: UIViewController {
    @IBOutlet weak var pieView: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        getData()
//        print("PRINTING DICT AFTER GETTING DATA")
//        print(self.dict)
////        print(data)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { // Change `2.0` to the desired number of seconds.
           // Code you want to be delayed
            self.setupPieChart()

        }
        
//        self.getData { () -> () in
//            self.setupPieChart()
//        }
        
    }
    
    let db = Firestore.firestore()
//    var data : [String]? = nil;
    var dict = [String: Int]()

        
    func getData() {
        guard let currentUser = Auth.auth().currentUser else { return }
        
        db.collection("users").document(currentUser.uid).getDocument { (snapshot, error) in
            guard var predictions = snapshot?.data()?["predictions"] as? [[String: Any]] else { return }
//            print(predictions)
            if predictions.isEmpty {
                return
            }
            for i in 0...predictions.count-1 {
                let val = predictions[i]["emotion"] as? String
//                self.data?[i] = val!
//                print(self.data![i])
//                print(val ?? "")
                
                //append to dictionary
                let key = val ?? ""
                if self.dict[key] != nil {
                    self.dict[key] = self.dict[key]! + 1
                } else {
                    self.dict[key] = 1
                }
            }
            print("DICT IN GET DATA FUNCTION")
            print(self.dict)
            
            
        }
    }
        
    
    func setupPieChart() {
        pieView.chartDescription?.enabled = false
        pieView.drawHoleEnabled = false //make a hole in the middle
        pieView.rotationAngle = 0
        pieView.rotationEnabled = false
        pieView.isUserInteractionEnabled = false
//        pieView.legend.enabled = false
        var entries: [PieChartDataEntry] = Array()
        print("PRINTING DICT TO BE APPENDED TO ENTRIES")
        print(dict)
        //update entries with dict value
        for (key,value) in dict {
            entries.append(PieChartDataEntry(value: Double(value), label: key))
        }
        
        print("ENTRIES FOR PIE CHART:")
        print(entries)
        
        let dataSet = PieChartDataSet(entries: entries, label: "")
        
        let c1 = NSUIColor(red: 111.0/255.0, green: 131.0/255.0, blue: 117.0/255.0, alpha: 1.0)
        let c2 = NSUIColor(red:141.0/255.0, green: 157.0/255.0, blue: 132.0/255.0, alpha: 1.0)
        let c3 = NSUIColor(red: 189.0/255.0, green: 198.0/255.0, blue: 170.0/255.0, alpha: 1.0)
        let c4 = NSUIColor(red: 229.0/255.0, green: 228.0/255.0, blue: 207.0/255.0, alpha: 1.0)
        let c5 = NSUIColor(red: 119.0/255.0, green: 143.0/255.0, blue: 90.0/255.0, alpha: 1.0)
        let c6 = NSUIColor(red: 139.0/255.0, green: 172.0/255.0, blue: 108.0/255.0, alpha: 1.0)
        let c7 = NSUIColor(red: 206.0/255.0, green: 229.0/255.0, blue: 150.0/255.0, alpha: 1.0)
        
        dataSet.colors = [c1,c2,c3,c4,c5,c6,c7]
//        dataSet.drawValuesEnabled = false
        pieView.data = PieChartData(dataSet: dataSet)
        
        
    }
    

    
    
    
}

    

