module StaticPagesHelper

  def selectable_link(sel, id)
    str = if sel == id
      'current'
    else
      ''
    end
    
    str
  end

end
