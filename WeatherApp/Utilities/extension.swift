//
//  extension.swift
//  Weather
//
//  Created by Vibha on 2020/09/09.
//  Copyright © 2020 DVT. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import MapKit

extension Int {
    func dateFromMilliseconds() -> Date {
        return Date(timeIntervalSince1970: TimeInterval(self))
    }
}

extension Date {
    func dayWord() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
    
    func hour() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        return dateFormatter.string(from: self)
    }

    func hourMinute() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH.mm"
        return dateFormatter.string(from: self)
    }
}

extension String {
    func localized (bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "\(self)", comment: "")
    }
}

extension Double {
    func convertToDegree() -> String {
        let temp = Int((Double(self) - 273.15))
        return String(temp) + "°"
    }
}

extension UIColor {
    convenience init?(hexString: String) {
        var chars = Array(hexString.hasPrefix("#") ? hexString.dropFirst() : hexString[...])
        let red, green, blue, alpha: CGFloat
        switch chars.count {
        case 3:
            chars = chars.flatMap { [$0, $0] }
            fallthrough
        case 6:
            chars = ["F","F"] + chars
            fallthrough
        case 8:
            alpha = CGFloat(strtoul(String(chars[0...1]), nil, 16)) / 255
            red   = CGFloat(strtoul(String(chars[2...3]), nil, 16)) / 255
            green = CGFloat(strtoul(String(chars[4...5]), nil, 16)) / 255
            blue  = CGFloat(strtoul(String(chars[6...7]), nil, 16)) / 255
        default:
            return nil
        }
        self.init(red: red, green: green, blue:  blue, alpha: alpha)
    }
}

extension CLLocationCoordinate2D {
    func toCodable() -> Coordinate {
        return Coordinate(latitude: latitude, longitude: longitude)
    }
    
    func areCoordinatesEqualTo(otherCoord: CLLocationCoordinate2D) -> Bool {
        return latitude == otherCoord.latitude && longitude == otherCoord.longitude
    }
}

extension Notification.Name {
    static let locationAllowed = Notification.Name("locationAllowed")
    static let locationDenied = Notification.Name("locationDenied")
    static let currentLocationChanged = Notification.Name("currentLocationChanged")
}

extension Decodable {
    init(from: Any) throws {
        let data = try JSONSerialization.data(withJSONObject: from, options: .prettyPrinted)
        let decoder = JSONDecoder()
        self = try decoder.decode(Self.self, from: data)
    }
}
