module ArticlesHelper
    def ad_type_radio_button(ad_type)
        selected_ad_type = params[:ad_type]
        @product = params[:ad_type]

        if selected_ad_type == ad_type
          if ad_type == "name" 
            @product = ad_type
          
        end
          radio_button_tag(:ad_type, ad_type, checked = true , :class => 'form-check-input')

        else
          radio_button_tag(:ad_type, ad_type, checked = false , :class => 'form-check-input')
        end
      end
end
