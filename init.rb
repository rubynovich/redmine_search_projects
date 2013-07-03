Redmine::Plugin.register :redmine_search_projects do
  name 'Search Projects'
  author 'Roman Shipiev'
  description 'Plugin fast search projects on projects#index'
  version '0.0.1'
  url 'https://bitbucket.org/rubynovich/redmine_search_projects'
  author_url 'http://roman.shipiev.me'

  requires_redmine :version_or_higher => '2.1.2'
end
