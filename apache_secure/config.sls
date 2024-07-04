/etc/apache2/apache2.conf:
  file.managed:
    - source: salt://apache_secure/files/apache2.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - require:
      - pkg: apache2
    - watch_in:
      - service: apache2

/etc/apache2/sites-available/default-ssl.conf:
  file.managed:
    - source: salt://apache_secure/files/default-ssl.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - require:
      - pkg: apache2
    - watch_in:
      - service: apache2

/etc/apache2/ssl:
  file.directory:
    - user: www-data
    - group: www-data
    - mode: 755
    - require:
      - pkg: apache2

/etc/apache2/ssl/apache.crt:
  file.managed:
    - source: salt://apache_secure/files/apache.crt
    - user: www-data
    - group: www-data
    - mode: 644
    - require:
      - pkg: apache2
    - watch_in:
      - service: apache2

/etc/apache2/ssl/apache.key:
  file.managed:
    - source: salt://apache_secure/files/apache.key
    - user: www-data
    - group: www-data
    - mode: 600
    - require:
      - pkg: apache2
    - watch_in:
      - service: apache2
