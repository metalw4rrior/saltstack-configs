apache2:
  pkg.installed:
    - names:
      - apache2
      - apache2-utils  
  service.running:
    - enable: true
    - reload: true
    - watch:
      - file: /etc/apache2/apache2.conf
