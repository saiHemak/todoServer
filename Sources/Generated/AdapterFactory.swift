import Foundation
import Configuration
import CloudFoundryConfig

public class AdapterFactory {
    let manager: ConfigurationManager

    init(manager: ConfigurationManager) {
        self.manager = manager
    }

    public func getTodoModelAdapter() throws -> TodoModelAdapter {
      return TodoModelMemoryAdapter()
    }

}
