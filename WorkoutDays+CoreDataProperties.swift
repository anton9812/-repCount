//
//  WorkoutDays+CoreDataProperties.swift
//  
//
//  Created by Anton Samuilov on 09/11/2020.
//
//

import Foundation
import CoreData


extension WorkoutDays {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WorkoutDays> {
        return NSFetchRequest<WorkoutDays>(entityName: "WorkoutDays")
    }

    @NSManaged public var workoutDay: String?
    @NSManaged public var workoutID: UUID?
    @NSManaged public var workoutName: String?
    @NSManaged public var canBe: NSSet?

}

// MARK: Generated accessors for canBe
extension WorkoutDays {

    @objc(addCanBeObject:)
    @NSManaged public func addToCanBe(_ value: Exercise)

    @objc(removeCanBeObject:)
    @NSManaged public func removeFromCanBe(_ value: Exercise)

    @objc(addCanBe:)
    @NSManaged public func addToCanBe(_ values: NSSet)

    @objc(removeCanBe:)
    @NSManaged public func removeFromCanBe(_ values: NSSet)

}
