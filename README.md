# web

[![Despliega un sitio web + sll + docker]



Using Certbot Manually for SSL certificates

For Ubuntu or Debian systems you can use APT to install certbot

sudo apt-get install certbot
After you have installed type this long command

certbot certonly –manual -d *.exampledomain.com -d exampledomain.com –agree-tos –manual-public-ip-logging-ok –preferred-challenges dns-01 –server https://acme-v02.api.letsencrypt.org/directory –register-unsafely-without-email –rsa-key-size 4096

Going into the command 

certbot: the certbot program
certonly: run the certbot once, certbot-auto runs certbot automatically
manual: run certbot in manual mode
d: domains to be included in certificate, use your domain an its wildcard instead of exampledomain.com
agree-tos: agreeing terms of Service of letsencrypt and eff
manual-public-ip-logging-ok: logging IP of our the system you are using for security purposes
preferred-challenges: The way used to verify domain ownership, We used DNS challenge
server: The letsencrypt ACME server
register-unsafely-without-email: getting certificate without register unsafely without email, but while in production use email to receive information about getting, renewing and revoking of certificate
rsa-key-size: the length of RSA key size

<a href="https://www.geeksforgeeks.org/using-certbot-manually-for-ssl-certificates/">Visit Geeksforgeeks</a>
