module ApplicationHelper
    def full_title(page_title = " ")
        default_title = "Poslovni Oglasnik"

        if page_title.empty?
            default_title
        else
            "#{page_title} | #{default_title}"
        end
    end

    def time_format(ad_date)
        ad_date.strftime(" %e %B %Y")
    end
end
