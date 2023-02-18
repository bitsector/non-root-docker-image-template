# ubuntu:20.04 original
FROM ubuntu@sha256:bffb6799d706144f263f4b91e1226745ffb5643ea0ea89c2f709208e8d70c999

# Create a new non-root user
RUN groupadd -g 5000 guest-user && \
    useradd -u 5000 -g guest-user -s /bin/bash guest-user && \
    mkdir /home/guest-user && \
    chown guest-user:guest-user /home/guest-user

# Install any necessary packages or dependencies
RUN apt-get update
    
# Switch to the new user
USER guest-user

# Set the working directory for the user
WORKDIR /home/guest-user

# Copy any necessary files or data to the container
COPY script.sh /usr/local/bin/script.sh 

# Specify the command to run when the container starts
CMD ["script.sh"]
