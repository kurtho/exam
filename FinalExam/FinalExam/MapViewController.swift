
//
//  MapViewController.swift
//  FinalExam
//
//  Created by KurtHo on 2016/7/24.
//  Copyright © 2016年 Kurt. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!

        var building = [["name":"Shop 01","address":"臺北市 信義區信義路5段7號", "lat":"25.033194", "long":"121.564837"]]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mapView.delegate = self
        for data in building {
            let annotation = MKPointAnnotation()
            annotation.title = data["name"]
            annotation.coordinate = CLLocationCoordinate2DMake(Double(data["lat"]!)!, Double(data["long"]!)!)
            self.mapView.addAnnotation(annotation)
        }
        self.mapView.showAnnotations(self.mapView.annotations, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "SpotPin"
        
        if annotation.isKindOfClass(MKUserLocation) {
            return nil
        }
        
        var annotationView: MKPinAnnotationView? = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) as? MKPinAnnotationView
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.image = UIImage().imageWithImage(UIImage(named: "台北101")!, scaledToSize: CGSizeMake(44, 44))
            annotationView?.clipsToBounds = true
            annotationView?.canShowCallout = false
        }
        
        return annotationView
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIImage {
    func imageWithImage(image:UIImage, scaledToSize newSize:CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        image.drawInRect(CGRectMake(0, 0, newSize.width, newSize.height))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}