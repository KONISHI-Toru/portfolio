require "administrate/base_dashboard"

class ProjectDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    hw_diagram: Field::ActiveStorage.with_options({destroy_path: :admin_destroy_image_path}),
    sw_diagram: Field::ActiveStorage.with_options({destroy_path: :admin_destroy_image_path}),
    project_tech_tags: Field::HasMany,
    tech_tags: Field::HasMany,
    project_phases: Field::HasMany,
    phases: Field::HasMany,
    project_roles: Field::HasMany,
    roles: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    target: Field::String,
    overview: Field::Text,
    hw_configuration: Field::Text,
    sw_configuration: Field::Text,
    production_url: Field::String,
    repository_url: Field::String,
    from: Field::DateTime.with_options(format: "%Y/%m"),
    to: Field::DateTime.with_options(format: "%Y/%m"),
    published: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
  name
  from
  to
  published
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
  user
  hw_diagram
  sw_diagram
  tech_tags
  phases
  roles
  id
  name
  target
  overview
  hw_configuration
  sw_configuration
  production_url
  repository_url
  from
  to
  published
  created_at
  updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
  user
  hw_diagram
  sw_diagram
  tech_tags
  phases
  roles
  name
  target
  overview
  hw_configuration
  sw_configuration
  production_url
  repository_url
  from
  to
  published
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how projects are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(project)
  #   "Project ##{project.id}"
  # end
  def display_resource(project)
    project.name
  end
end
