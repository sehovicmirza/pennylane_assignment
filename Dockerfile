# Stage 1: Setup the Ruby/Rails environment
FROM ruby:3.0.0 as ruby-base
WORKDIR /app
COPY backend/Gemfile backend/Gemfile.lock ./
RUN bundle install
COPY backend .

# Stage 2: Build React Frontend
FROM node:latest as react-build
WORKDIR /app
COPY frontend/package.json frontend/package-lock.json ./
RUN npm install
COPY frontend .
RUN npm run build

# Stage 3: Final Stage with Nginx and Rails
FROM ruby:3.0.0
# Install Nginx
RUN apt-get update && apt-get install -y nginx
# Copy Ruby environment
COPY --from=ruby-base /app /app
COPY --from=ruby-base /usr/local/bundle /usr/local/bundle
# Copy React build and Nginx configuration
COPY --from=react-build /app/build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf
# Copy and set permissions for start script
COPY start.sh /start.sh
RUN chmod +x /start.sh
# Set Rails environment to production
ENV RAILS_ENV=production
CMD ["/start.sh"]
