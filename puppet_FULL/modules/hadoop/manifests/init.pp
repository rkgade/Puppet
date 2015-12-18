class hadoop{
#include java_generate
$hdfs='/opt/hdfs_tmp'
$fqdname = $::fqdn
$instance = '1'
$javahome = '/usr/lib/jvm/java-7-oracle/'
file {
	'/home/hadoop/hadoop/conf/core-site.xml':
	content => template('hadoop/core-site.xml.erb')

}
->
file {
	'/home/hadoop/hadoop/conf/hdfs-site.xml':
	content => template('hadoop/hdfs-site.xml.erb')

}
->
file {
	'/home/hadoop/hadoop/conf/mapred-site.xml':
	content => template('hadoop/mapred-site.xml.erb')

}

->
file {
	'/home/hadoop/hadoop/conf/hadoop-env.sh':
	content => template('hadoop/hadoop-env.sh.erb')


}
->
exec {
	'chown -R hadoop:hadoop hadoop':
	cwd => '/home/hadoop',
	path => '/bin/:/usr/bin',

}

->
exec {
	"su hadoop -c '/home/hadoop/hadoop/bin/hadoop namenode -format'":
	cwd => '/home/hadoop/hadoop/bin',
	path=> '/bin:/usr/bin',

}

->
exec {

	"su hadoop -c 'sh start-all.sh' ":
	cwd => '/home/hadoop/hadoop/bin',
	path => '/bin:/usr/bin',


}


}
class java_generate{
$javahome = generate('/etc/puppet/modules/hadoop/scripts/java_home.sh')
notify { "${javahome}":}
}
