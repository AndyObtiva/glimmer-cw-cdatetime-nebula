module GlimmerCwCdatetimeNebula
  class Engine < ::Rails::Engine
    isolate_namespace GlimmerCwCdatetimeNebula

    initializer "glimmer_cw_cdatetime_nebula.assets.precompile" do |app|
      app.config.assets.precompile += %w( glimmer_cw_cdatetime_nebula/glimmer_cw_cdatetime_nebula.css )
    end
  end
end
