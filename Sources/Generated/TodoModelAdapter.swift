public protocol TodoModelAdapter {
    func findAll(onCompletion: @escaping ([TodoModel], Error?) -> Void)
    func create(_ model: TodoModel, onCompletion: @escaping (TodoModel?, Error?) -> Void)
    func deleteAll(onCompletion: @escaping (Error?) -> Void)

    func findOne(_ maybeID: String?, onCompletion: @escaping (TodoModel?, Error?) -> Void)
    func update(_ maybeID: String?, with model: TodoModel, onCompletion: @escaping (TodoModel?, Error?) -> Void)
    func delete(_ maybeID: String?, onCompletion: @escaping (TodoModel?, Error?) -> Void)
}
