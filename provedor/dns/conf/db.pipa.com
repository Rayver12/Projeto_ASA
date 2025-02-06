;
; BIND data file for local loopback interface
;
$ORIGIN pipa.com.
$TTL	604800

@   IN  SOA ns.pipa.com. root.pipa.com. (
			      1		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	ns.pipa.com.
@	IN	MX	10	mail.pipa.com.
@	IN	A	192.168.1.108

ns      IN  A   192.168.1.108
mail    IN  A   192.168.1.108
webmail IN  A   192.168.1.108
www     IN  A   192.168.1.108
proxy   IN  CNAME www
