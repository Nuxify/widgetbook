# widgetbook

A new Flutter project.

# Deploying Widgetbook to web
 - `make build-web`
 - `git checkout release/widgetbook-production`
 - `cp -r build/web/* .`
 - `git add .`
 - `git commit -m "Deploy Flutter web app"`
 - `git push`