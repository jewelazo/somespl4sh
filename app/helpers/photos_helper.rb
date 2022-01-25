module PhotosHelper
    def format_updated_date(date)
       "Updated at "+ date.strftime('%B %d, %Y')
    end
end
