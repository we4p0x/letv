class systembase_newcdn::service_stop{
#  service{ "iptables":
#    ensure     => stopped,
#    enable     => false,
#  }

#  service{"monit":
#    ensure     => stopped,
#    enable     => false,
#    stop       => "/usr/bin/monit quit",   
#  }
}