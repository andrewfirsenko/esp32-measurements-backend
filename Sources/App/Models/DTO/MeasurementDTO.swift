//
//  MeasurementDTO.swift
//  ESP32MeasurementsBackend
//
//  Created by Andrew on 02.01.2026.
//

import Vapor

struct MeasurementDTO: Content {
    let date: Double
    let temperature: Double?
    let humidity: Double?
    let pressure: Int?
}
