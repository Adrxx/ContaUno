module ApplicationHelper

  def error_if_exists(object,name)
    str = ''
    object.errors[name].each do |m|
      str += "<div class='error-message'>#{m}</div>"
    end
    str
  end

  def full_field(form,name,title,placeholder)
    str = ''
    str += form.label(name, title)
    str += form.text_field(name, class: 'data-field u-full-width', placeholder: placeholder)
    str += error_if_exists(form.object,name)
    str.html_safe
  end

  def full_file_field(form,name)
    str = ''
    str += form.file_field(name, accept: ".cun", class: 'mnt-pm-file-input')
    str += error_if_exists(form.object,name)
    str.html_safe
  end

  def full_field_code(form,name,placeholder)
    str = ''
    str += form.text_field(name, class: 'code-field', placeholder: placeholder, :maxlength  => 6 )
    str += error_if_exists(form.object,name)
    str.html_safe
  end

  def full_password_field(form,name,title,placeholder)
    str = ''
    str += form.label(name, title)
    str += form.password_field(name, class: 'u-full-width', placeholder: placeholder)
    str += error_if_exists(form.object,name)
    str.html_safe
  end

  def full_text_area(form,name,title,placeholder)
    str = ''
    str += form.label(name, title)
    str += form.text_area(name, class: 'u-full-width', placeholder: placeholder)
    str += error_if_exists(form.object,name)
    str.html_safe
  end

  def full_numeric_field(form,name,title,placeholder)
    str = ''
    str += form.label(name, title)
    str += form.text_field(name, class: 'u-full-width mnt-pm-numeric-input', placeholder: placeholder)
    str += error_if_exists(form.object,name)
    str.html_safe
  end
end
