# default path
Exec {
    path => ["/usr/bin", "/bin", "/usr/sbin", "/sbin", "/usr/local/bin", "/usr/local/sbin"]
}

include bootstrap
include tools
include postgresql
include apache
include python
include import_db
include production
