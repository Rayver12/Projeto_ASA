;
; BIND data file for pitangui.com
;
$ORIGIN pitangui.com.
$TTL    604800

@       IN  SOA ns.pitangui.com. root.pitangui.com. (
                2024060101      ; Serial (formato data japonês)
                3600            ; Refresh
                1800            ; Retry
                1209600         ; Expire
                86400 )         ; Negative Cache TTL

; Nameservers
@       IN  NS  ns.pitangui.com.

; Endereços IP
@       IN  A   192.168.1.108
ns      IN  A   192.168.1.108
mail    IN  A   192.168.1.108
www     IN  A   192.168.1.108
web     IN  A   192.168.1.108
proxy   IN  CNAME 	www 
