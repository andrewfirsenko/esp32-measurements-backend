//
//  AddMeasurementsRequest.swift
//  ESP32MeasurementsBackend
//
//  Created by Andrew on 02.01.2026.
//

import Vapor

struct AddMeasurementsRequest: Content {
    let deviceId: String
    let measurements: [MeasurementDTO]
}
