Jekyll::Hooks.register :works, :post_write do |work|
    all_existing_tags = Dir.entries("_tags")
    .map { |t| t.match(/(.*).md/) }
    .compact.map { |m| m[1] }

    tags = work['tags'].reject { |t| t.empty? }
    tags.each do |tag|
    generate_tag_file(tag) if !all_existing_tags.include?(tag)
    end
end

def generate_tag_file(tag)
    # generate tag file
    File.open("_tags/#{tag}.md", "wb") do |file|
    file << "---\nlayout: tag\ntitle: #{tag}\n---\n"
    end
end

# this only runs locally to generate tag files, and the tag files are included in the commit