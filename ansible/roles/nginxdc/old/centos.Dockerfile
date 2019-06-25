FROM centos RUN yum update -y && yum install -y systemd openssh-server && yum clean all && systemctl enable 
sshd RUN useradd devops && echo devops | passwd devops --stdin
#RUN echo "<h1>-==Sergei TiT==-</h1>" > /usr/share/nginx/html/index.html RUN echo "daemon off;" >> 
#/etc/nginx/nginx.conf RUN ln -s /dev/stdout /var/log/nginx/access.log && \
#    ln -s /dev/stderr /var/log/nginx/error.log
EXPOSE 22 ENTRYPOINT ["/usr/sbin/init"]
#CMD [ "/usr/sbin/nginx" ]
