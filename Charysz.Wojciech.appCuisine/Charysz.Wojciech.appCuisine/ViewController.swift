//
//  ViewController.swift
//  Charysz.Wojciech.appCuisine
//
//  Created by Wojciech Charysz on 20.01.17.
//  Copyright © 2017 Wojciech Charysz. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UITableViewController {
    
    var photos: [Photo]?
    
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let api = NetworkController()
        api.downloadNASARoverPhotos { (photos) in
            self.photos = photos
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NasaMarsRoverCell", for: indexPath) as? NasaMarsRoverTableViewCell else {
            return UITableViewCell()
        }
        
        let photo = photos?[indexPath.row]
        cell.cameraFullNameLabel.text = photo?.cameraFullName
        
        if let date = photo?.earth_date {
            cell.earthDateLabel.text = dateFormatter.string(from: date)
        }
        
        if let url = photo?.img_src {
            cell.cameraImageView.sd_setImage(with: url)
        }
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

