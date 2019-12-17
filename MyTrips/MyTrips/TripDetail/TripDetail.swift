//
//  TripDetail.swift
//  MyTrips
//
//  Created by Giulia on 15/12/2019.
//  Copyright © 2019 giulia. All rights reserved.
//

import SwiftUI
import CoreData

struct TripDetail: View {
    
    var trip: Trip
    
    var body: some View {
        
        VStack {
            ZStack {
                MapView(latitude: trip.latitude?.doubleValue ?? 0, longitude: trip.longitude?.doubleValue ?? 0)
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 250)
                Image(trip.imageName ?? "")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .clipShape(Circle())
                    .offset(x: 0, y: 100)
            }
            
            VStack() {
                Text(trip.name ?? "Name")
                    .font(.title)
                Text("\(trip.startDateString) - \(trip.endDateString)")
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                Text(trip.desc ?? "Description")
                    .padding()
                
            }
            .offset(x:0, y: 70)
            .padding()
            Spacer()
        }
    }
}

struct TripDetail_Previews: PreviewProvider {
    static var previews: some View {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        //Test data
        let trip = Trip.init(context: context)
        trip.name = "Seychelles"
        trip.desc = "Seychelles is a member of the African Union, the Southern African Development Community, the Commonwealth of Nations, and the United Nations. After proclamation of independence from the United Kingdom in 1976, Seychelles has developed from a largely agricultural society to a market-based diversified economy, with agriculture being supplanted by rapidly rising service and public sectors as well as tourism. From 1976 until 2015, nominal GDP output increased nearly sevenfold, and the purchasing power parity increased nearly sixteenfold."
        trip.startDate = Calendar.current.date(byAdding: .year, value: -4, to: Date())
        trip.endDate = Calendar.current.date(byAdding: .year, value: 4, to: Date())
        trip.imageName = Trip.DestinationType.sea.rawValue
        trip.latitude = -4
        trip.longitude = 55
        
        
        return TripDetail(trip: trip).environment(\.managedObjectContext, context)
    }
}
