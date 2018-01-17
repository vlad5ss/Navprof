//
//  MapviewController.swift
//  Navprof
//
//  Created by mac on 1/18/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps


class MapviewController: BaseViewController {
    
    
    struct Place {
        let id: Int
        let name: String
        let lat: CLLocationDegrees
        let lng: CLLocationDegrees
        let icon: String
    }
    
    @IBOutlet weak var mapView: GMSMapView!
    var markerDict: [Int: GMSMarker] = [:]
    
    var zoom: Float = 15
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
        //             self.navigationBar.barTintColor = .blue
        
        //create a new button
        let button = UIButton.init(type: .custom)
        //set image for button
        button.setImage(UIImage(named: "joxnablack24png.png"), for: UIControlState.normal)
        //add function for button
        button.addTarget(self, action: #selector(MapviewController.joxnablckPressed), for: UIControlEvents.touchUpInside)
        //set frame
        button.frame = CGRect(x: 0, y: 0, width: 53, height: 51)
        
        let barButton = UIBarButtonItem(customView: button)
        //assign button to navigationbar
        self.navigationItem.rightBarButtonItem = barButton
        
        
        
        let camera = GMSCameraPosition.camera(withLatitude: 34.1381168, longitude: -118.3555723, zoom: zoom)
        self.mapView.camera = camera
        
        do {
            if let styleURL = Bundle.main.url(forResource: "style", withExtension: "json") {
                mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
                NSLog("Unable to find style.json")
            }
        } catch {
            NSLog("One or more of the map styles failed to load. \(error)")
        }
        
        let places = [
            Place(id: 0, name: "MrMins", lat: 34.1331168, lng: -118.3550723, icon: "i01"),
            ]
        
        for place in places {
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: place.lat, longitude: place.lng)
            marker.title = place.name
            marker.snippet = "Custom snipet message \(place.name)"
            marker.appearAnimation = GMSMarkerAnimation.pop
            //marker.icon = self.imageWithImage(image: UIImage(named: place.icon)!, scaledToSize: CGSize(width: 35.0, height: 35.0))
            marker.map = self.mapView
            
            markerDict[place.id] = marker
        }
        
        // Do any additional setup after loading the view.
    }
    
    @objc func joxnablckPressed() {
        
        print("joxnablckPressed")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //
        //        //deklarasi nav sebagai navigation bar
        //        let nav = self.navigationController?.navigationBar
        //
        //        //tambahkan style bar
        //        nav?.barStyle = UIBarStyle.black
        //        nav?.tintColor = UIColor.white
        
        //menambahkan gambar atau logo
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        imageView.contentMode = .scaleAspectFill
        
        //memanggil nama gambarNya
        let image = UIImage(named: "joxnalogo100")
        //menampilkan image ke imageView
        imageView.image = image
        
        //menampilkan title navigation item sebagai imageView
        navigationItem.titleView = imageView
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //    override func loadView() {
    //        // Create a GMSCameraPosition that tells the map to display the
    //        // coordinate -33.86,151.20 at zoom level 6.
    //        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
    //        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
    //        view = mapView
    //
    //        // Creates a marker in the center of the map.
    //        let marker = GMSMarker()
    //        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
    //        marker.title = "Sydney"
    //        marker.snippet = "Australia"
    //        marker.map = mapView
    //    }
    
    @IBAction func btnZoomIn(_ sender: Any) {
        zoom = zoom + 1
        self.mapView.animate(toZoom: zoom)
    }
    
    @IBAction func btnZoomOut(_ sender: Any) {
        zoom = zoom - 1
        self.mapView.animate(toZoom: zoom)
    }
    @IBAction func selectMapView(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            mapView.mapType = .normal
            break
        case 1:
            mapView.mapType = .hybrid
            break
        case 2:
            mapView.mapType = .satellite
            break
        default:
            break
        }
        
    }
    
}


