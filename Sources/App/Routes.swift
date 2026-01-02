//
//  Routes.swift
//  App
//
//  Created by Andrew on 01.01.2026.
//

import Vapor
import Fluent

struct LastMeasurementResponse: Content {
    let deviceId: String
    let measurement: MeasurementDTO
}

public func routes(_ app: Application) async throws {
    app.get { req async in
        return "ESP32MeasurementsBackend. It works!"
    }
    
    app.post("add-measurements") { req async throws -> HTTPStatus in
        let payload = try req.content.decode(AddMeasurementsRequest.self)
        
        let measurements = payload.measurements.map { measurementDTO in
            return Measurement(
                deviceId: payload.deviceId,
                date: measurementDTO.date,
                temperature: measurementDTO.temperature,
                humidity: measurementDTO.humidity,
                pressure: measurementDTO.pressure
            )
        }
        
        try await measurements.create(on: req.db)

        return .ok
    }

    app.get("last-measurement", ":deviceId") { req async throws -> LastMeasurementResponse in
        guard let deviceId = req.parameters.get("deviceId") else {
            throw Abort(.badRequest)
        }

        guard let lastMeasurement = try await Measurement.query(on: req.db)
            .filter(\.$deviceId == deviceId)
            .sort(\.$date, .descending)
            .first() else {
            throw Abort(.notFound)
        }

        return LastMeasurementResponse(
            deviceId: deviceId,
            measurement: MeasurementDTO(
                date: lastMeasurement.date,
                temperature: lastMeasurement.temperature,
                humidity: lastMeasurement.humidity,
                pressure: lastMeasurement.pressure
            )
        )
    }
}
