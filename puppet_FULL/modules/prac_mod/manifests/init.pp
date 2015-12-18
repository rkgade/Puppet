class prac_mod {

file {
        '/var/www/html/ipfiles':
        content => template('prac_mod/addresslist.erb')
}

}
