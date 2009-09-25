require 'ftools'

module Typus

  def self.generator

    # Create needed folders if doesn't exist.
    admin_controllers_folder = "#{Rails.root}/app/controllers/admin"
    admin_views_folder = "#{Rails.root}/app/views/admin"

    [ admin_controllers_folder, admin_views_folder ].each do |folder|
      Dir.mkdir(folder) unless File.directory?(folder)
    end

    # Create test/functional/admin if doesn't exist.
    admin_controller_tests_folder = "#{Rails.root}/test/functional/admin"
    if File.directory?("#{Rails.root}/test")
      Dir.mkdir(admin_controller_tests_folder) unless File.directory?(admin_controller_tests_folder)
    end

    # Get a list of controllers under `app/controllers/admin`.
    admin_controllers = Dir["#{Rails.root}/vendor/plugins/*/app/controllers/admin/*.rb", "#{admin_controllers_folder}/*.rb"]
    admin_controllers = admin_controllers.map { |i| File.basename(i) }

    # Get a list of functional tests under `test/functional/admin`.
    admin_controller_tests = Dir["#{admin_controller_tests_folder}/*.rb"]
    admin_controller_tests = admin_controller_tests.map { |i| File.basename(i) }

    # Generate controllers for tableless models.
    resources.each do |resource|

      controller_filename = "#{resource.underscore}_controller.rb"
      controller_location = "#{admin_controllers_folder}/#{controller_filename}"

      if !admin_controllers.include?(controller_filename)
        template = File.read("#{File.dirname(__FILE__)}/templates/resource_controller.rb.erb")
        content = ERB.new(template).result(binding)
        File.open(controller_location, "w+") { |f| f << content }
      end

      # And now we create the view.
      view_folder = "#{admin_views_folder}/#{resource.underscore}"
      view_filename = "index.html.erb"

      if !File.exist?("#{view_folder}/#{view_filename}")
        Dir.mkdir(view_folder) unless File.directory?(view_folder)
        origin = "#{File.dirname(__FILE__)}/templates/index.html.erb"
        destination = "#{view_folder}/#{view_filename}"
        File.copy(origin, destination)
      end

    end

    # Generate:
    #   `app/controllers/admin/#{resource}_controller.rb`
    #   `test/functional/admin/#{resource}_controller_test.rb`
    models.each do |model|

      controller_filename = "#{model.tableize}_controller.rb"
      controller_location = "#{admin_controllers_folder}/#{controller_filename}"

      if !admin_controllers.include?(controller_filename)
        template = File.read("#{File.dirname(__FILE__)}/templates/resources_controller.rb.erb")
        content = ERB.new(template).result(binding)
        File.open(controller_location, "w+") { |f| f << content }
      end

      test_filename = "#{model.tableize}_controller_test.rb"
      test_location = "#{admin_controller_tests_folder}/#{test_filename}"

      if !admin_controller_tests.include?(test_filename) && File.directory?("#{Rails.root}/test")
        template = File.read("#{File.dirname(__FILE__)}/templates/resource_controller_test.rb.erb")
        content = ERB.new(template).result(binding)
        File.open(test_location, "w+") { |f| f << content }
      end

    end

  end

end