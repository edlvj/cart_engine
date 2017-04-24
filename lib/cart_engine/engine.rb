module CartEngine
  class Engine < ::Rails::Engine
    isolate_namespace CartEngine
    
    config.assets.paths << File.expand_path('../../assets/stylesheets', __FILE__)
    config.assets.paths << File.expand_path('../../assets/javascripts', __FILE__)
    
    config.i18n.default_locale = :en
    config.i18n.load_path += Dir[Engine.root.join('config', 'locales', '**', '*.{rb,yml}')]
  end
end
