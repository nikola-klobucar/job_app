module AdsHelper

    def remember(ad)
        session[:ad_id] = ad.id
    end

    def current_ad
        @current_ad ||= Ad.find_by(id:session[:ad_id])
    end

    def kill_ad_session
        session.delete(:ad_id)
        @current_ad = nil
    end

end
