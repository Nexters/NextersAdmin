# Form helper integration
# require 'active_enum/form_helpers/formtastic'  # for Formtastic <2
# require 'active_enum/form_helpers/formtastic2' # for Formtastic 2.x

ActiveEnum.setup do |config|

  # Extend classes to add enumerate method
  # config.extend_classes = [ ActiveRecord::Base ]

  # Return name string as value for attribute method
  # config.use_name_as_value = false

  # Storage of values (:memory, :i18n)
  # config.storage = :memory

end

ActiveEnum.define do
  enum(:role) do
    value :id => 0, :name => '', :symbol => ''
    value :id => 1, :name => 'Developer',   :symbol => ''
    value :id => 2, :name => 'Designer', :symbol => ''
    value :id => 3, :name => 'Planner', :symbol => ''
  end
end
