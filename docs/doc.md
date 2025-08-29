# IotaChan
---
## terminal commands in order -
```
  rails new  iota_chan --css tailwind --javascript esbuild
  rails g controller home index about rules
  npm install daisyui@latest
  rails g scaffold Board name:string is_nsfw:boolean
  rails db:migrate
  bin/rails active_storage:install
  rails db:migrate
  rails generate scaffold DiscussionThread title:string content:text board:references
```
