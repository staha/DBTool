module SearchHelper
  def pretty_date(date, format='')
    pretty_date = 'N/A'
    if date.present?
      pretty_date = date.to_s(:short)
      case format
      when 'long', :long
        pretty_date = "#{date.year}, #{pretty_date}"
      end
    end
    return pretty_date
  end
end