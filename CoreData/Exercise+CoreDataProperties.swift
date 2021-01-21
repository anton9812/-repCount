//
//  Exercise+CoreDataProperties.swift
//  repCount
//
//  Created by Anton Samuilov on 21/01/2021.
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
    @NSManaged public var isIn: Workout?

}

extension Exercise : Identifiable {

}
