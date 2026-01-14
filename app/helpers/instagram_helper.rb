module InstagramHelper
  require "net/http"
  require "json"
  require "uri"

  def instagram_embed(instagram_url)
    return unless instagram_url.present?

    uri = URI("https://graph.facebook.com/v19.0/instagram_oembed")
    params = {
      url: instagram_url,
      access_token: "#{ENV['META_APP_ID']}|#{ENV['META_CLIENT_TOKEN']}"
    }
    uri.query = URI.encode_www_form(params)

    response = Net::HTTP.get_response(uri)

    Rails.logger.info "Instagram oEmbed status: #{response.code}"
    Rails.logger.info "Instagram oEmbed body: #{response.body}"

    return unless response.is_a?(Net::HTTPSuccess)

    data = JSON.parse(response.body)
    data["html"]&.html_safe
  rescue => e
    Rails.logger.error "Instagram oEmbed error: #{e.message}"
    nil
  end
end
