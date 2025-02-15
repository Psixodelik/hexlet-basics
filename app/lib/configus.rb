# frozen_string_literal: true

Configus.build Rails.env do
  env :production do
    hexlet_basics_release_version ENV['HEXLET_BASICS_RELEASE_VERSION']

    protocol :https
    host 'code-basics.com'
    https_host 'https://ru.code-basics.com'

    github do
      app_id ENV['GITHUB_CLIENT_ID']
      app_secret ENV['GITHUB_CLIENT_SECRET']
    end

    facebook do
      app_id ENV['FACEBOOK_CLIENT_ID']
      app_secret ENV['FACEBOOK_CLIENT_SECRET']
    end

    disqus_id 'hexlet-basics'

    gtm_id ENV['GOOGLE_TAG_MANAGER_KEY']

    mailer do
      from 'code-basics@hexlet.io'

      smtp do
        username ENV['SPARKPOST_SMTP_USERNAME']
        password ENV['SPARKPOST_SMTP_PASSWORD']
      end
    end
  end

  env :development, parent: :production do
    protocol :https
    host 'code-basics.test'
    disqus_id 'code-basics-test'
    gtm_id 'test-id'
  end

  env :test, parent: :development do
    github do
      app_id
      app_secret
    end
  end
end
