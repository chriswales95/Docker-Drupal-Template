FROM mariadb:10.1.40

# Set the working directory
WORKDIR /tmp

# Copy all the files to the working directory of the container
COPY *.sql /tmp/

# Copy the world.sql file to docker-entrypoint-initdb.d.
COPY drupal_edcjd.sql /docker-entrypoint-initdb.d