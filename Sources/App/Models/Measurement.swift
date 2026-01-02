//
//  Measurement.swift
//  App
//
//  Created by Andrew on 01.01.2026.
//

import Fluent
import Vapor

final class Measurement: Model, Content {
    // MARK: - Static Properties
    static let schema = "measurements"

    // MARK: - Properties
    @ID(key: .id)
    var id: UUID?
    @Field(key: "device_id")
    var deviceId: String
    @Field(key: "date")
    var date: Double
    @OptionalField(key: "temperature")
    var temperature: Double?
    @OptionalField(key: "humidity")
    var humidity: Double?
    @OptionalField(key: "pressure")
    var pressure: Int?

    // MARK: - Init
    init() {}
    
    init(
        deviceId: String,
        date: Double,
        temperature: Double?,
        humidity: Double?,
        pressure: Int?
    ) {
        self.deviceId = deviceId
        self.date = date
        self.temperature = temperature
        self.humidity = humidity
        self.pressure = pressure
    }
}
