//
//  Parser.swift
//  GMaps
//
//  Created by Karthik on 9/23/20.
//  Copyright © 2020 Karthik. All rights reserved.
//

import UIKit
import CoreData

class Parser {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let request : NSFetchRequest<User> = User.fetchRequest()
    
    var orders = [Order]()
    
    //read from JSON file
    func readLocalJSON(file:String)->Order?{
        guard let path = Bundle.main.path(forResource: file, ofType: ".json") else {
            return nil
        }
        
        let url = URL(fileURLWithPath: path)
        do {
            let data = try Data(contentsOf: url)
            let this = try JSONDecoder().decode(Customer.self, from: data)
            return this.order
        } catch {
            print(error.localizedDescription)
            return nil
        }
        
    }
    // Save data to Coredata
    func saveData(){
        let entity = User(context:context)
        guard let order = readLocalJSON(file: "data") else {return}
        
        entity.name = order.customerName
        entity.number = order.customerNumber
        entity.lattitude = order.lattitude
        entity.longitude = order.longitude
        entity.route  = order.routeKey
        
        if checkDuplicate(input: entity.number!) {
            return
        }
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    //read data from Coredata
    func retrieveData( comp : @escaping ([Order])->()){
        orders.removeAll()
        do{
            let ent = try context.fetch(request)
            for i in ent {
                let name = i.value(forKey: "name") as! String
                let lat = i.value(forKey: "lattitude") as! String
                let long = i.value(forKey: "longitude") as! String
                let number =  i.value(forKey: "number") as! String
                let route = i.value(forKey: "route") as! String
                orders.append(Order(customerName: name, customerNumber: number, routeKey: route, lattitude: lat, longitude: long))
                print(orders.count,"orders")
                comp(orders)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    //CHeck for duplicate entries in coredata
    func checkDuplicate(input : String)->Bool {
        do {
            request.predicate = NSPredicate(format: "number contains[cd] %@", input)
            let ent = try context.fetch(request)
            return ent.count > 0
            
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    //Due to restrictions in using Places API, this is not called.

    func getRoute(){
        let url = URL(string: "https://maps.googleapis.com/maps/api/directions/json?origin=\("sourceLat"),\("sourceLong")&destination=\("destinationLat"),\("destinationLong")&sensor=false&mode=driving")!
        let session = URLSession.shared
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            guard let jsonResult = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any] else {
                
                print("error in JSONSerialization")
                return
                
            }
                        
            guard let routes = jsonResult["routes"] as? [Any] else {
                return
            }
            
            guard let route = routes[0] as? [String: Any] else {
                return
            }
            
            guard let legs = route["legs"] as? [Any] else {
                return
            }
            
            guard let leg = legs[0] as? [String: Any] else {
                return
            }
            
            guard let steps = leg["steps"] as? [Any] else {
                return
            }
            for item in steps {
                
                guard let step = item as? [String: Any] else {
                    return
                }
                
                guard let polyline = step["polyline"] as? [String: Any] else {
                    return
                }
                
                guard let polyLineString = polyline["points"] as? String else {
                    return
                }
                
            }
        })
        task.resume()
        
    }

    
    
    
}
