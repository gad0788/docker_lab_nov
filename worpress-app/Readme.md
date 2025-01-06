# Launch a WordPress app with and without Docker compose
# docker-compose up -d # Deploying two containers linked wordpress and database mysql
# docker-compose down # shutting down the app
# docker-compose ps # check running containers
# docker-compose logs # checking logs coming out of the containers
# ** To make two container talk , we need to isolate them in the same network.
# docker network ls
# docker network create net 
# docker run -d --rm --network net -e MARIADB_ROOT_PASSWORD=abc123 -e MARIADB_DATABASE=webserver -e MARIADB_USER=oracle -e MARIADB_PASSWORD=abc123 --name mariadb mariadb:latest
# docker run -d --rm --name wordpress1 -p 80:80 --network net  -e WORDPRESS_DB_HOST=mariadb -e WORDPRESS_DB_USER=oracle -e WORDPRESS_DB_PASSWORD=abc123 -e WORDPRESS_DB_NAME=webserver wordpress
# ** It is stidious to manage container individually so best solution to run them is using docker-compose tool.
