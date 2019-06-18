static_page_mappings = {
  '/'   => 'public/index.html',
  '/index.html'   => 'public/index.html',
  '/blog.html' => 'public/blog.html',
  '/career.html'   => 'public/career.html',
  '/contact.html'   => 'public/contact.html',
  '/portfolio.html'   => 'public/portfolio.html',
  '/services.html'   => 'public/services.html',
  '/team.html'   => 'public/team.html',
  '/technology.html'   => 'public/technology.html',
  '/about.html'   => 'public/about.html',
}


use Rack::Static,
  :urls => ["/images", "/js", "/css", "/public"],
  :root => "public"


static_page_mappings.each do |req, file|
  map req do 
    run lambda { |env|
      [
        200, 
        {
          'Content-Type'  => 'text/html', 
          'Cache-Control' => 'public, max-age=6400',
        },
        File.open(file, File::RDONLY)
      ]
    }
  end
end