pipeline {
    agent any
    stages {
        stage('Pull Code') {
            steps {
                dir('/home/ubuntu/College-ERP/College-ERP') {
                    sh 'git pull origin master'
                }
            }
        }
        stage('Build & Deploy') {
            steps {
                dir('/home/ubuntu/College-ERP/College-ERP') {
                    sh 'sudo docker rm -f $(sudo docker ps -aq) || true'
                    sh 'sudo docker-compose build --no-cache web'
                    sh 'sudo docker-compose up -d web'
                }
            }
        }
        stage('Migrate') {
            steps {
                dir('/home/ubuntu/College-ERP/College-ERP') {
                    sh 'sudo docker-compose exec -T web python manage.py makemigrations'
                    sh 'sudo docker-compose exec -T web python manage.py migrate'
                }
            }
        }
    }
}
