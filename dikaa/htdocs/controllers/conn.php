<?php
session_start();
class database
{

	private $host = "sql312.infinityfree.com";
	private $uname = "if0_38722550";
	private $pass = "lan91w09RJD8f";
	private $db = "if0_38722550_diskon";
	public $koneksi;

	function __construct()
	{

		$this->koneksi = mysqli_connect($this->host, $this->uname, $this->pass);
		mysqli_select_db($this->koneksi, $this->db);

		if ($this->koneksi) {
			// echo "Koneksi database mysql dan php berhasil.";
			return $this->koneksi;
		} else {
			echo "Koneksi database mysql dan php GAGAL !";
		}
	}
}

$conn = new database();