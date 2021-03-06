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
        formatter.locale = EarthDateTransform.locale
        formatter.dateFormat = EarthDateTransform.dateFormat
        return formatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        downloadPhotos { 
            
        }
    }
    
    @IBAction func handleRefresh(refreshControl: UIRefreshControl) {
        downloadPhotos {
            refreshControl.endRefreshing()
        }
    }
    
    func downloadPhotos(completion:@escaping () -> Void) {
        let api = NetworkController()
        api.downloadNASARoverPhotos { (photos) in
            self.photos = photos
            self.tableView.reloadData()
            completion()
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
        
        //cells with an odd index use a different background color.
        cell.backgroundColor = indexPath.row % 2 == 0 ? nil : UIColor.green
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? NasaMarsRoverTableViewCell
        performSegue(withIdentifier: "DetailViewSegue", sender: cell?.cameraImageView.image)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? DetailViewController, let image = sender as? UIImage {
            viewController.detailImage = image
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

