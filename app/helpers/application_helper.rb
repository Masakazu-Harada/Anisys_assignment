module ApplicationHelper
  def positions_for_select
    Employee.positions.keys.map { |key| [I18n.t("activerecord.attributes.employee.positions.#{key}"), key]}
  end

  def required_field_label(field_label)
    raw("#{field_label} <span class='text-required'>(必須)</span>")
  end
end
