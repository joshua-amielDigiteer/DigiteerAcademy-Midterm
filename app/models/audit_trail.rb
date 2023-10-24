class AuditTrail < ApplicationRecord
    def self.save_audit(user_id, module_action, module_name, module_data)
        create(user_id: user_id, module_action: module_action, module_name: module_name, module_data: module_data)
    end
end

