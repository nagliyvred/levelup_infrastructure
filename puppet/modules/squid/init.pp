class squid {
   package { "squid":
	provider => "apt",
	ensure => "present"
   }
}
