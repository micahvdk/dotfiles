# Check ssl certificate dates
ssl::get::dates() {
	SERVERNAME=$1
	HOST=$2
	echo | openssl s_client -servername $SERVERNAME -connect $HOST:443 2>/dev/null | openssl x509 -noout -dates
}

# Output all data about a given certificate
ssl::get::text() {
	SERVERNAME=$1
	HOST=$2
	echo | openssl s_client -servername $SERVERNAME -connect $HOST:443 2>/dev/null | openssl x509 -noout -text
}
