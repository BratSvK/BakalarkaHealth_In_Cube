# using oracle image as a base image
FROM store/oracle/database-enterprise:12.2.0.1

# creating directory inside the container, where all sql scripts will be locaited
WORKDIR /home/oracle/setup/custom_scripts

# copy customized configDBora.sh (with code snippet) from PC to the container
COPY configDBora.sh /home/oracle/setup/