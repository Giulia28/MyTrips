//
//  Trip.swift
//  MyTrips
//
//  Created by Giulia on 15/12/2019.
//  Copyright © 2019 giulia. All rights reserved.
//

import Foundation
import CoreData
import CoreLocation

class Trip: NSManagedObject, Identifiable {

    @NSManaged public var name: String?
    @NSManaged public var desc: String?
    @NSManaged public var imageName: String?
    @NSManaged public var startDate: Date?
    @NSManaged public var endDate: Date?
    @NSManaged public var latitude: NSDecimalNumber?
    @NSManaged public var longitude: NSDecimalNumber?

}


extension Trip {
    static func allTripsFetchRequest() -> NSFetchRequest<Trip> {
        let request: NSFetchRequest<Trip> = Trip.fetchRequest() as! NSFetchRequest<Trip>
        
        request.sortDescriptors = [NSSortDescriptor(key: "startDate", ascending: true)]
          
        return request
    }
}

extension Trip {
    var startDateString: String {
        guard let startDate = self.startDate else {
            return  ""
        }
        return getDateFormatter().string(from: startDate)
    }
    
    var endDateString: String {
        guard let endDate = self.endDate else {
                   return  ""
               }
        return getDateFormatter().string(from: endDate)
    }
    
    func getDateFormatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter
    }
}

extension Trip {
    enum DestinationType: String, CaseIterable {
        case city = "City"
        case sea = "Sea"
        case mountain = "Mountain"
        case savana = "Savana"
        case lake = "Lake"
    }
}

