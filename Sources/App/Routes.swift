//
//  Routes.swift
//  App
//
//  Created by Andrew on 01.01.2026.
//

import Vapor
import Fluent

//struct AddMeasuresRequest: Content {
//    let id: String
//    let measures: [MeasureDTO]
//}
//
//struct MeasureDTO: Content {
//    let date: Double
//    let temperature: Double?
//    let humidity: Double?
//    let pressure: Int?
//}
//
//struct LastMeasureResponse: Content {
//    let id: String
//    let measure: MeasureDTO
//}

public func routes(_ app: Application) async throws {
    app.get { req async in
        return "ESP32MeasurementsBackend. It works!"
    }
    
//    app.post("add-measures") { req async throws -> HTTPStatus in
//        let payload = try req.content.decode(AddMeasuresRequest.self)
//        let models = payload.measures.map {
//            Measure(
//                deviceID: payload.id,
//                date: $0.date,
//                temperature: $0.temperature,
//                humidity: $0.humidity,
//                pressure: $0.pressure
//            )
//        }
//        try await models.create(on: req.db)
//        return .ok
//    }
//
//    app.get("last-measure", ":id") { req async throws -> LastMeasureResponse in
//        guard let id = req.parameters.get("id") else {
//            throw Abort(.badRequest)
//        }
//
//        guard let measure = try await Measure.query(on: req.db)
//            .filter(\.$deviceID == id)
//            .sort(\.$date, .descending)
//            .first()
//        else {
//            throw Abort(.notFound)
//        }
//
//        return LastMeasureResponse(
//            id: id,
//            measure: MeasureDTO(
//                date: measure.date,
//                temperature: measure.temperature,
//                humidity: measure.humidity,
//                pressure: measure.pressure
//            )
//        )
//    }
}
