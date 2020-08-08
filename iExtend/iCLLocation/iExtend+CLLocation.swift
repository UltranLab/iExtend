//
//  iExtend+CLLocation.swift
//  iExtend
//
//  Created by ULTLab on 17/04/19.
//  Copyright © 2019 UltranLab Engineering Pvt. Ltd. All rights reserved.
//

import UIKit
import CoreLocation

public extension CLLocation{
    func getFullAddress(onCompletion: @escaping ((_ address: String?) -> Void)){
        let baseGeocoder: CLGeocoder = CLGeocoder()
        baseGeocoder.reverseGeocodeLocation(self) { (placeMark, err) in
            guard err == nil, let placeMarkData = placeMark?.first,
                let locality = placeMarkData.locality,
                !locality.isEmpty, let thoroughfare = placeMarkData.thoroughfare,
                !thoroughfare.isEmpty, let name = placeMarkData.name,
                !name.isEmpty, let postalCode = placeMarkData.postalCode,
                !postalCode.isEmpty, let country = placeMarkData.country,
                !country.isEmpty else {
                    onCompletion(nil)
                    return
            }
            onCompletion("\(name), \(locality), \(thoroughfare), \(postalCode), \(country)")
        }
    }
    func getCityName(onCompletion: @escaping ((_ locationName: String?) -> Void)){
        let baseGeocoder: CLGeocoder = CLGeocoder()
        baseGeocoder.reverseGeocodeLocation(self) { (placeMark, err) in
            guard err == nil, let placeMarkData = placeMark?.first else {
                onCompletion(nil)
                return
            }
            onCompletion(placeMarkData.locality)
        }
    }
    func getStreetAddress(onCompletion: @escaping ((_ streetAddress: String?) -> Void)) {
        let baseGeocoder: CLGeocoder = CLGeocoder()
        baseGeocoder.reverseGeocodeLocation(self) { (placeMark, err) in
            guard err == nil, let placeMarkData = placeMark?.first else {
                onCompletion(nil)
                return }
            onCompletion(placeMarkData.thoroughfare)
        }
    }
    func getLocationName(onCompletion: @escaping ((_ locationName: String?) -> Void)) {
        let baseGeocoder: CLGeocoder = CLGeocoder()
        baseGeocoder.reverseGeocodeLocation(self) { (placeMark, err) in
            guard err == nil, let placeMarkData = placeMark?.first else {
                onCompletion(nil)
                return }
            onCompletion(placeMarkData.name)
        }
    }
    func getZipCode(onCompletion: @escaping ((_ zip: String?) -> Void)) {
        let baseGeocoder: CLGeocoder = CLGeocoder()
        baseGeocoder.reverseGeocodeLocation(self) { (placeMark, err) in
            guard err == nil, let placeMarkData = placeMark?.first else {
                onCompletion(nil)
                return }
            onCompletion(placeMarkData.postalCode)
        }
    }
    func getCountry(onCompletion: @escaping ((_ country: String?) -> Void)) {
        let baseGeocoder: CLGeocoder = CLGeocoder()
        baseGeocoder.reverseGeocodeLocation(self) { (placeMark, err) in
            guard err == nil, let placeMarkData = placeMark?.first else {
                onCompletion(nil)
                return }
            onCompletion(placeMarkData.country)
        }
    }
}
