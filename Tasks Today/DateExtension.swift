//
//  DateExtension.swift
//  Tasks Today
//
//  Created by Alexis Orellano on 6/25/19.
//  Copyright © 2019 Alexis Orellano. All rights reserved.
//

import Foundation

extension Date {
    func add(days: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: days, to: Date())!
    }
}
