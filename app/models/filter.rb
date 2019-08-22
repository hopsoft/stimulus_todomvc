class Filter
  include ActiveModel::Model

  attr_accessor :value

  validates :value, inclusion: {in: %w[all active completed]}

  def all?
    value == "all"
  end

  def active?
    value == "active"
  end

  def completed?
    value == "completed"
  end

  def apply(todos)
    return todos.active if active?
    return todos.completed if completed?
    todos.all
  end
end
