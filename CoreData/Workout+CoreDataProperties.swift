//
//  Workout+CoreDataProperties.swift
//  repCount
//
//  Created by Anton Samuilov on 21/01/2021.
//
//

import Foundation
import CoreData


extension Workout {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Workout> {
        return NSFetchRequest<Workout>(entityName: "Workout")
    }

    @NSManaged public var workoutDay: String?
    @NSManaged public var workoutID: UUID?
    @NSManaged public var workoutName: String?
    @NSManaged public var canBe: NSSet?

}

// MARK: Generated accessors for canBe
extension Workout {

    @objc(addCanBeObject:)
    @NSManaged public func addToCanBe(_ value: Exercise)

    @objc(removeCanBeObject:)
    @NSManaged public func removeFromCanBe(_ value: Exercise)

    @objc(addCanBe:)
    @NSManaged public func addToCanBe(_ values: NSSet)

    @objc(removeCanBe:)
    @NSManaged public func removeFromCanBe(_ values: NSSet)

}

extension Workout : Identifiable {

}
