require_relative '../libs/router'

Router.init do
  get('/') { 'Home Page' }

  get('/posts') { 'Posts Index Page' }
end
