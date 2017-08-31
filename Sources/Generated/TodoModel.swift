import SwiftyJSON

public struct TodoModel {
    public let id: String?
    public let uid: String
    public let taskName: String

    public init(id: String?, uid: String, taskName: String) {
        self.id = id
        self.uid = uid
        self.taskName = taskName
    }

    public init(json: JSON) throws {
        // Required properties
        guard json["uid"].exists() else {
            throw ModelError.requiredPropertyMissing(name: "uid")
        }
        guard let uid = json["uid"].string else {
            throw ModelError.propertyTypeMismatch(name: "uid", type: "string", value: json["uid"].description, valueType: String(describing: json["uid"].type))
        }
        self.uid = uid
        guard json["taskName"].exists() else {
            throw ModelError.requiredPropertyMissing(name: "taskName")
        }
        guard let taskName = json["taskName"].string else {
            throw ModelError.propertyTypeMismatch(name: "taskName", type: "string", value: json["taskName"].description, valueType: String(describing: json["taskName"].type))
        }
        self.taskName = taskName

        // Optional properties
        if json["id"].exists() &&
           json["id"].type != .string {
            throw ModelError.propertyTypeMismatch(name: "id", type: "string", value: json["id"].description, valueType: String(describing: json["id"].type))
        }
        self.id = json["id"].string

        // Check for extraneous properties
        if let jsonProperties = json.dictionary?.keys {
            let properties: [String] = ["id", "uid", "taskName"]
            for jsonPropertyName in jsonProperties {
                if !properties.contains(where: { $0 == jsonPropertyName }) {
                    throw ModelError.extraneousProperty(name: jsonPropertyName)
                }
            }
        }
    }

    public func settingID(_ newId: String?) -> TodoModel {
      return TodoModel(id: newId, uid: uid, taskName: taskName)
    }

    public func updatingWith(json: JSON) throws -> TodoModel {
        if json["id"].exists() &&
           json["id"].type != .string {
            throw ModelError.propertyTypeMismatch(name: "id", type: "string", value: json["id"].description, valueType: String(describing: json["id"].type))
        }
        let id = json["id"].string ?? self.id

        if json["uid"].exists() &&
           json["uid"].type != .string {
            throw ModelError.propertyTypeMismatch(name: "uid", type: "string", value: json["uid"].description, valueType: String(describing: json["uid"].type))
        }
        let uid = json["uid"].string ?? self.uid

        if json["taskName"].exists() &&
           json["taskName"].type != .string {
            throw ModelError.propertyTypeMismatch(name: "taskName", type: "string", value: json["taskName"].description, valueType: String(describing: json["taskName"].type))
        }
        let taskName = json["taskName"].string ?? self.taskName

        return TodoModel(id: id, uid: uid, taskName: taskName)
    }

    public func toJSON() -> JSON {
        var result = JSON([
            "uid": JSON(uid),
            "taskName": JSON(taskName),
        ])
        if let id = id {
            result["id"] = JSON(id)
        }

        return result
    }
}
