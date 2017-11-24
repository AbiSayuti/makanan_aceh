//
//  AcehTableViewController.swift
//  Makanan Aceh
//
//  Created by Abi Sayuti on 11/24/17.
//  Copyright © 2017 Abi Sayuti. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AcehTableViewController: UITableViewController {
    
    var resepSelected:String?
    var waktuSelected:String?
    var orangSelected:String?
    var hargaSelected:String?
    
    var nampungId : String? = nil
    var arrayRESEP = [[String:String]]()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let params = ["id_nama" : nampungId]
        let url = "http://localhost/makanan_aceh/index.php/api/getnama"
        
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler:
            { (response) in
                
                
                if response.result.isSuccess {
                    //kalau response suces kita ambil json
                    let json = JSON(response.result.value as Any)
                    print(json)
                    //get jsonaray dari json arrayq
                    self.arrayRESEP = json["data"].arrayObject as! [[String : String]]
                    //check d log
                    //check jumlah array
                    if (self.arrayRESEP.count > 0){
                        
                        //refresh tableview
                        self.tableView.reloadData()
                    }
                }
                else{
                    
                    print("error server")
                    
                }
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayRESEP.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AcehTableViewCell

        // Configure the cell...
        
        
        var serverid = arrayRESEP[indexPath.row]
        
        var resep = serverid["nama"]
        let waktu = serverid["waktu"]
        let orang = serverid["orang"]
        let harga = serverid["harga"]
        let bahan = serverid["bahan"]
        let cara = serverid["cara"]
        //print judul
        
        cell.labelNamaResep.text = resep
        cell.labelHarga.text = harga
        cell.labelPorsi.text = orang
        cell.labelWaktu.text = waktu

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Row \(indexPath.row)selected")
        
        let task = arrayRESEP[indexPath.row]
        resepSelected = task["nama"] as! String
        waktuSelected = task["waktu"] as! String
        orangSelected = task["orang"] as! String
        hargaSelected = task["harga"] as! String
        
        
        performSegue(withIdentifier: "PassDetail", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "PassDetail" {
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! DetailViewController
                let value = arrayRESEP[indexPath.row]
                
                controller.passResep = value["nama"] as! String
                controller.passWaktu = value["waktu"] as! String
                controller.passPorsi = value["orang"] as! String
                controller.passHarga = value["harga"] as! String
                controller.passStep = value["cara"] as! String
                controller.passBahan = value["bahan"] as! String
                
                
            }
        }
    }
    
}

