module Jekyll
    module AssetFilter
        def to_time(date_string)
            Jekyll::Utils.parse_date(date_string)
        end
    end
end

Liquid::Template.register_filter(Jekyll::AssetFilter)

# https://talk.jekyllrb.com/t/site-time-tomorrow/6658/14
# changed `DateTime.parse(date_string).to_time` to `Jekyll::Utils.parse_date(date_string)` because possible Ruby version mismatches between local and GitHub