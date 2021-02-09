//
//  Workout+CoreDataProperties.swift
//  repCount
//
//  Created by Anton Samuilov on 09/02/2021.
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
    @NSManaged public var has: NSSet?

}

// MARK: Generated accessors for has
extension Workout {

    @objc(addHasObject:)
    @NSManaged public func addToHas(_ value: Exercise)

    @objc(removeHasObject:)
    @NSManaged public func removeFromHas(_ value: Exercise)

    @objc(addHas:)
    @NSManaged public func addToHas(_ values: NSSet)

    @objc(removeHas:)
    @NSManaged public func removeFromHas(_ values: NSSet)

}

extension Workout : Identifiable {

}
