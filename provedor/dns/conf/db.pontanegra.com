$ORIGIN pontanegra.com.
$TTL	604800

@   IN  SOA ns.pontanegra.com. root.pontanegra.com. (
			2025030101	; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	ns.pontanegra.com.
@	IN	MX	10	mail.pontanegra.com.
@	IN	A	192.168.1.108

ns      IN  A   192.168.1.108
mail    IN  A   192.168.1.108
web     IN  A   192.168.1.108
www     IN  A   192.168.1.108
proxy   IN  CNAME www
