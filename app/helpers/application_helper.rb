module ApplicationHelper
  def positions_for_select
    Employee.positions.keys.map { |key| [I18n.t("activerecord.attributes.employee.positions.#{key}"), key]}
  end
end
