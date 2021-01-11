//
//  Exercise+CoreDataProperties.swift
//  
//
//  Created by Anton Samuilov on 11/11/2020.
//
//

import Foundation
import CoreData


extension Exercise {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Exercise> {
        return NSFetchRequest<Exercise>(entityName: "Exercise")
    }

    @NSManaged public var exerciseDay: String?
    @NSManaged public var exerciseID: UUID?
    @NSManaged public var exerciseName: String?
    @NSManaged public var exerciseRep: Int64
    @NSManaged public var exerciseSet: Int64
    @NSManaged public var exerciseWeight: Int64
    @NSManaged public var exerciseWeightType: String?
    @NSManaged public var isIn: NSSet?

}

// MARK: Generated accessors for isIn
extension Exercise {

    @objc(addIsInObject:)
    @NSManaged public func addToIsIn(_ value: Workout)

    @objc(removeIsInObject:)
    @NSManaged public func removeFromIsIn(_ value: Workout)

    @objc(addIsIn:)
    @NSManaged public func addToIsIn(_ values: NSSet)

    @objc(removeIsIn:)
    @NSManaged public func removeFromIsIn(_ values: NSSet)

}
