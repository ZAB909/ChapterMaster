function file_encrypt(argument0, argument1) {
	/*
	*
	* fileEncrypt( fname, password);
	* Arguments -
	*   fname - Path to file
	*   password - String to use for encryption
	*
	* Returns - Nothing
	*
	* Description - Encrypts a file with a password
	*
	*/

	var file, byte, pos, key;
	file = file_bin_open( argument0, 2);
	pos = 1;
	while( file_bin_position( file) < file_bin_size( file)) {
	    if ( pos <= string_length( argument1)) {
	        pos += 1;
	    } else pos = 1;
	    key = ord( string_char_at( argument1, pos));
	    byte = file_bin_read_byte( file);
	    file_bin_seek( file, file_bin_position( file) - 1);
	    file_bin_write_byte( file, ( byte + key) mod 256);
	}
	file_bin_close( file);


}
