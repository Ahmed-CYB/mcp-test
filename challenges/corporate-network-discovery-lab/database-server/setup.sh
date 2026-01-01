#!/bin/bash
# Database Server Setup Script

echo "Setting up Corporate Database Server..."

# Install services
apt-get update
apt-get install -y mysql-server postgresql redis-server openssh-server apache2 postfix

# Configure MySQL
systemctl start mysql
mysql -e "CREATE USER 'webapp'@'%' IDENTIFIED BY 'web_db_pass';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'webapp'@'%';"
mysql -e "CREATE DATABASE customers;"
mysql -e "CREATE DATABASE orders;"
mysql -e "FLUSH PRIVILEGES;"

# Configure PostgreSQL
systemctl start postgresql
sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'pg_super_secure';"
sudo -u postgres createuser report_user
sudo -u postgres createdb reporting
sudo -u postgres psql -c "ALTER USER report_user PASSWORD 'report_pass_123';"

# Configure Redis
systemctl start redis-server

# Configure SSH users
useradd -m -s /bin/bash dbadmin
echo 'dbadmin:admin_database' | chpasswd
useradd -m -s /bin/bash webapp
echo 'webapp:web_service_user' | chpasswd
echo 'root:root_db_server' | chpasswd

# Configure Apache
systemctl start apache2
a2enmod status
a2enmod info
a2enmod rewrite

# Configure Postfix
echo 'database-server.corpnet.local' > /etc/mailname
systemctl start postfix

# Create backup directory
mkdir -p /var/backups/web
chown www-data:www-data /var/backups/web

# Start all services
systemctl enable mysql postgresql redis-server ssh apache2 postfix
systemctl restart mysql postgresql redis-server ssh apache2 postfix

echo "Database server setup complete!"
echo "Services running on: 22 (SSH), 25 (SMTP), 80 (HTTP), 3306 (MySQL), 5432 (PostgreSQL), 6379 (Redis)"