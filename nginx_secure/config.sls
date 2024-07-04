/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://nginx_secure/files/nginx.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - require:
      - pkg: nginx
    - watch_in:
      - service: nginx

/etc/nginx/sites-available/default:
  file.managed:
    - source: salt://nginx_secure/files/nginx-default
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - require:
      - pkg: nginx
    - watch_in:
      - service: nginx

/etc/nginx/snippets/self-signed.conf:
  file.managed:
    - source: salt://nginx_secure/files/self-signed.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - require:
      - pkg: nginx
    - watch_in:
      - service: nginx

/etc/nginx/snippets/ssl-params.conf:
  file.managed:
    - source: salt://nginx_secure/files/ssl-params.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: nginx
    - watch_in:
      - service: nginx
