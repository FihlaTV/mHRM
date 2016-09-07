module ApplicationHelper
  def can?(*args)
    args.map{|action| current_user.allowed_to? action }.include?(true)
  end

  def delete_link(url, options={})
    options = {
        :method => :delete,
        :data => {:confirm => t(:text_are_you_sure)}
    }.merge(options)

    link_to "<i class='fa fa-lg fa-trash-o'></i>".html_safe, url, options
  end

  def show_link(object, options={})
    link_to "<i class='fa fa-lg fa-eye'></i>".html_safe, object, options
  end

  def edit_link(url, options={})
    link_to "<i class='fa fa-lg fa-edit'></i>".html_safe, url, options
  end

  def render_employee_information
    output = '<div class="col-xs-8 margin-top-10" style="float: left; font-weight: bold;">'
    output<< "<div class='col-xs-2' >#{image_tag(User.current.profile_image, size: '35x35')}</div>"
    output<< "<div class='col-xs-2' >#{User.current.name}</div>"
    output<< "<div class='col-xs-2' >#{User.current.gender}</div>"
    output<< "<div class='col-xs-2' >#{User.current.birthday}</div>"
    output<< "<div class='col-xs-2' >#{User.current.active?}</div>"
    output<< '</div>'
    output
  end

  # Renders flash messages
  def render_flash_messages
    s = ''
    flash.each do |k,v|
      s << content_tag('div', v.html_safe, :class => "flash #{k}", :id => "flash_#{k}")
    end
    s.html_safe
  end

  def options_helper(klass, selected)
    options_for_select(klass.active.pluck(:name, :id), selected: selected )
  end

  # Returns a h2 tag and sets the html title with the given arguments
  def title(*args)
    strings = args.map do |arg|
      if arg.is_a?(Array) && arg.size >= 2
        link_to(*arg)
      else
        h(arg.to_s)
      end
    end
    html_title args.reverse.map {|s| (s.is_a?(Array) ? s.first : s).to_s}
    content_tag('h2', strings.join(' &#187; ').html_safe)
  end

  # Sets the html title
  # Returns the html title when called without arguments
  # Current project name and app_title and automatically appended
  # Exemples:
  #   html_title 'Foo', 'Bar'
  #   html_title # => 'Foo - Bar - My Project - Redmine'
  def html_title(*args)
    if args.empty?
      title = @html_title || []
      title << @project.name if @project
      title << Setting.app_title unless Setting.app_title == title.last
      title.reject(&:blank?).join(' - ')
    else
      @html_title ||= []
      @html_title += args
    end
  end

  def menu_active?(controller)
    params[:controller]== controller ? 'active' : ''
  end

  # For devise

  def resource_name
    :user
  end

  def resource_class
    User
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end


  #For extend Demography
  def render_extend_demography_information(extend_demo)
    return if extend_demo.nil?
    output = "<div class='row'>"
    if extend_demo.emails.present?
      output<< "<div class='col-xs-12'> <h4>Email</h4> </div>"
      output<< extend_demo.emails.map{|record| record.to_html }.join('')
    end
    if extend_demo.faxes.present?
      output<< "<div class='col-xs-12'> <h4>Fax</h4> </div>"
      output<< extend_demo.faxes.map{|record| record.to_html }.join('')
      end
    if extend_demo.phones.present?
      output<< "<div class='col-xs-12'> <h4>Phone</h4> </div>"
      output<< extend_demo.phones.map{|record| record.to_html }.join('')
    end
    if extend_demo.identifications.present?
      output<< "<div class='col-xs-12'> <h4>Identification</h4> </div>"
      output<< extend_demo.identifications.map{|record| record.to_html }.join('')
    end
    if extend_demo.social_media.present?
      output<< "<div class='col-xs-12'> <h4>Social media</h4> </div>"
      output<< extend_demo.social_media.map{|record| record.to_html }.join('')
    end
    if extend_demo.addresses.present?
      output<< "<div class='col-xs-12'> <h4>Address</h4> </div>"
      output<< extend_demo.addresses.map{|record| record.to_html }.join('')
    end
    output<< '</div>'
    output.html_safe
  end

end
