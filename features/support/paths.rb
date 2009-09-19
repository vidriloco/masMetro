module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in webrat_steps.rb
  #
  def path_to(page_name)
    case page_name
    
    when /the homepage/
      '/'
    when /the new mini_blog page/
      new_mini_blog_path

    when /administraciones/
      administraciones_path
      
    when /pagina de inicio de sesion/
      login_path      
    when /Mini-Blogs config page/
      mini_blogs_path
    when /new Mini-Blog page/
      new_mini_blog_path
    when /show Mini-Blog page/
      mini_blog_path
    when /edit Mini-Blog page/
      edit_mini_blog_path
    when /Usuarios config page/
      users_path
    when /Usuarios registration page/
      registro_normal_path
    when /Usuarios admin registration page/
      registro_admin_path
    when /Usuarios create page/
      register_path
    # Add more mappings here.
    # Here is a more fancy example:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
