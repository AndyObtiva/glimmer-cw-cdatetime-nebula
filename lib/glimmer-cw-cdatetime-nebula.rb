$LOAD_PATH.unshift(File.expand_path('..', __FILE__))
$LOAD_PATH.unshift(File.expand_path('../..', __FILE__))

require 'glimmer-dsl-swt'

require 'vendor/nebula/org.eclipse.nebula.cwt_1.1.0.jar'
require 'vendor/nebula/org.eclipse.nebula.widgets.cdatetime_1.4.0.jar'

Glimmer::Config.import_swt_packages += [
  'org.eclipse.nebula.cwt',
  'org.eclipse.nebula.widgets.cdatetime',
]

require 'views/nebula/c_date_time'
