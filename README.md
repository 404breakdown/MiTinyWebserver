# A lightweight, high-performance PHP 8.2 + Apache Docker image optimized for web applications requiring database support and large file handling.

# 🚀 Features

- Engine: PHP 8.2-Apache (Debian-based).
- Database: Pre-configured with PDO and PDO_SQLite.
- High Capacity: Optimized for large uploads (up to 1GB).
- Automation: Integrated GitHub Actions for automatic builds to Docker Hub.

# 🛠️ Configuration

This image is tuned for heavy-duty web tasks with the following PHP settings:

Setting	Value
memory_limit	512M
upload_max_filesize	1G
post_max_size	1.1G
max_execution_time	300s

# 📦 Local Setup

To run this project locally using Docker:
clone the repo 
`git clone https://github.com/404breakdown/mytinywebserver.git
cd the-archive`