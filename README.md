# Med SPA
MedMS – Medical Management System // CRM system for managing a medical organization

##Technologies:
- Laravel 8.83.
- Wue JS 3.
- Wue router.
- Axios.
- Docker-compose.

###Install
    git clone https://github.com/RAlekseev/MedMS.git
    cd MedMS
    
    
    
###Setup database

    // in docker-compose.yml set up your database password
    mysql:
        image: mysql:5.7
        ports:
          - 33065:3306
        environment:
          - MYSQL_ROOT_PASSWORD=YOUR_DB_PASSWORD
          - MYSQL_DATABASE=medms
          
     // and set up your ports
     services:
       nginx:
         image: nginx:latest
         ports:
         // for local
           - 8085:80
         // for prodaction
           - 80:80
           - 443:443
          
          
          
     cp .env.example .env
     
     // in .env set up your database password
     DB_PASSWORD=YOUR_DB_PASSWORD
     
     // and your app URL
     APP_URL=https://YOUR_APP_URL
     SANCTUM_STATEFUL_DOMAINS=YOUR_APP_URL
          
          
###Install and Run Docker containers
    docker-compose build
    docker-compose up -d
    
###Install dependencies
    docker-compose exec fpm php ../laravel-docker/composer.phar install --working-dir ../laravel-docker
    docker-compose exec fpm php ../laravel-docker/artisan storage:link

###Give permissions to Docker
    sudo chgrp -R www-data storage bootstrap/cache; sudo chmod -R ug+rwx storage bootstrap/cache;
    
###Custom logo and favicon
if you want use your custom logos and favicon
move they to /storage/app/public:

    /storage/app/public/favicon.ico
    /storage/app/public/primary_logo.png
    /storage/app/public/light_logo.png

###Get SSL (only for production server)
    apt-geet install certbot
    certbot certonly -d YOUR_DOMAIN
    
    // in your docker-compose.yml
    services:
      nginx:
        image: nginx:latest
        ports:
    #      - 8085:80
    #    prod ports
          - 80:80
          - 443:443
        volumes:
    #    prod SSL keys
          - /etc/letsencrypt/live/YOUR_DOMAIN/fullchain.pem:/etc/letsencrypt/live/lms.kg/fullchain.pem
          - /etc/letsencrypt/live/YOUR_DOMAIN/privkey.pem:/etc/letsencrypt/live/lms.kg/privkey.pem
          
    cp Nginx/core/nginx.conf.prod Nginx/core/nginx.conf
    
