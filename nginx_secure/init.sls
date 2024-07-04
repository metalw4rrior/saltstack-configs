nginx:
  pkg.installed:
    - names:
      - nginx
      - nginx-extras  # Для дополнительных модуле
  service.running:
    - enable: true
    - reload: true
    - watch:
      - file: /etc/nginx/nginx.conf
