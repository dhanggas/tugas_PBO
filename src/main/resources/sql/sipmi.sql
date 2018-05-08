-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 08, 2018 at 02:08 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sipmi`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `kode` varchar(30) NOT NULL,
  `id_kategori` int(4) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `harga_jual` double NOT NULL DEFAULT '0',
  `harga_beli` double NOT NULL DEFAULT '0',
  `jumlah` int(8) NOT NULL DEFAULT '0',
  `paket` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kode`, `id_kategori`, `nama`, `harga_jual`, `harga_beli`, `jumlah`, `paket`) VALUES
('A0101', 2, 'Sandisk', 150000, 100000, 9, 0),
('A0102', 2, 'Toshiba 16 GB', 0, 65000, 26, 0),
('A0103', 2, 'gado gado rasa keju', 2000, 1000, 12, 0),
('A0104', 2, 'mouse', 0, 0, 0, 0),
('A0201', 3, 'Logitec B 100', 0, 50000, 8, 0),
('A0301', 4, 'pulpen', 2000, 1500, 3, 0),
('A0401', 5, 'Logiteck K100', 0, 750000, 14, 0);

-- --------------------------------------------------------

--
-- Table structure for table `kategori_brg`
--

CREATE TABLE `kategori_brg` (
  `id` int(4) NOT NULL,
  `kode` varchar(3) NOT NULL,
  `nama` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori_brg`
--

INSERT INTO `kategori_brg` (`id`, `kode`, `nama`) VALUES
(2, 'A01', 'Flashdisk'),
(3, 'A02', 'Mouse'),
(4, 'A03', 'Monitor'),
(5, 'A04', 'Keyboard'),
(7, 'A05', 'UTP');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `kode` varchar(10) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `notlp` varchar(100) NOT NULL,
  `agen` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`kode`, `nama`, `alamat`, `notlp`, `agen`) VALUES
('PEL01', 'Ruby', 'Cikupa', '081315138940', 0),
('PEL02', 'Dhiskar', 'Bitung', '547', 0),
('PEL03', 'Faisal ', 'Curug', '789', 0),
('PEL04', 'Denny', 'Cikupa', '456', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pemasok`
--

CREATE TABLE `pemasok` (
  `id` int(5) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` text NOT NULL,
  `tlp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemasok`
--

INSERT INTO `pemasok` (`id`, `nama`, `alamat`, `tlp`) VALUES
(2, 'Hasanah', 'Jl Gatot Subroto No.15 Tangerang', '089603284660'),
(3, 'Roni', 'Pasar Cikupa , Tangerang , Banten', '081623654985');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id` int(11) NOT NULL,
  `kode` varchar(15) NOT NULL,
  `tgl` date NOT NULL,
  `id_pemasok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id`, `kode`, `tgl`, `id_pemasok`) VALUES
(1, '', '2018-04-15', 2),
(2, '', '2018-04-15', 2),
(3, '', '2018-04-15', 2),
(4, '01', '2018-04-15', 2),
(5, '01', '2018-04-15', 3),
(6, '03', '2018-04-15', 3),
(9, 'Ada12', '2018-04-19', 2),
(10, 'PEM01', '2018-04-21', 2),
(11, 'AM01', '2018-04-21', 2),
(12, 'A0401', '2018-05-06', 2),
(13, '001', '2018-05-06', 2),
(14, '01', '2018-05-06', 2),
(15, '897', '2018-05-06', 2),
(16, '897', '2018-05-06', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_detail`
--

CREATE TABLE `pembelian_detail` (
  `id` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `kode_barang` varchar(5) NOT NULL,
  `harga` double NOT NULL DEFAULT '0',
  `jumlah` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian_detail`
--

INSERT INTO `pembelian_detail` (`id`, `id_pembelian`, `kode_barang`, `harga`, `jumlah`) VALUES
(1, 1, 'A0101', 100000, 6),
(3, 2, 'A0101', 100000, 6),
(6, 3, 'A0101', 100000, 1),
(8, 4, 'A0101', 100000, 6),
(9, 5, 'A0101', 100000, 1),
(10, 9, 'A0101', 100000, 11),
(11, 9, 'A0101', 100000, 6),
(12, 9, 'A0201', 50000, 1),
(13, 10, 'A0401', 751000, 2),
(14, 10, 'A0201', 50000, 7),
(15, 11, 'A0102', 65000, 6),
(16, 11, 'A0401', 750000, 6),
(17, 12, 'A0401', 750000, 8),
(18, 12, 'A0102', 65000, 14),
(19, 12, 'A0401', 750000, 3),
(20, 13, 'A0401', 750000, 1),
(21, 14, 'A0102', 65000, 6),
(22, 14, 'A0301', 1500, 3),
(23, 14, 'A0401', 750000, 2),
(24, 15, 'A0103', 1000, 4),
(25, 16, 'A0103', 1000, 8);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `kode` varchar(25) NOT NULL,
  `tgl` date NOT NULL,
  `kode_pelanggan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`kode`, `tgl`, `kode_pelanggan`) VALUES
('PNJ-180415-01', '2018-04-15', 'PEL03'),
('PNJ-180415-02', '2018-04-15', 'PEL04'),
('PNJ-180415-03', '2018-04-15', 'PEL04');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_detail`
--

CREATE TABLE `penjualan_detail` (
  `id` int(11) NOT NULL,
  `kode_penjualan` varchar(25) NOT NULL,
  `kode_barang` varchar(5) NOT NULL,
  `harga` double NOT NULL DEFAULT '0',
  `diskon` double NOT NULL DEFAULT '0',
  `jumlah` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan_detail`
--

INSERT INTO `penjualan_detail` (`id`, `kode_penjualan`, `kode_barang`, `harga`, `diskon`, `jumlah`) VALUES
(1, 'PNJ-180415-01', 'A0101', 110000, 0, 6),
(4, 'PNJ-180415-03', 'A0101', 150000, 0, 11);

-- --------------------------------------------------------

--
-- Table structure for table `pesanan_pembelian`
--

CREATE TABLE `pesanan_pembelian` (
  `kode` varchar(15) NOT NULL,
  `tgl` date NOT NULL,
  `id_pemasok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pesanan_pembelian`
--

INSERT INTO `pesanan_pembelian` (`kode`, `tgl`, `id_pemasok`) VALUES
('PO-180506-02', '2018-05-06', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pesanan_pembelian_detail`
--

CREATE TABLE `pesanan_pembelian_detail` (
  `id` int(11) NOT NULL,
  `kode_pesanan` varchar(15) NOT NULL,
  `kode_barang` varchar(5) NOT NULL,
  `jumlah` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `jabatan` enum('ADMIN','GUDANG','KASIR') NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama`, `username`, `password`, `jabatan`, `status`) VALUES
(1, 'admin', 'admin', 'admin', 'ADMIN', 1),
(2, 'lani ', 'lani', 'gudang', 'GUDANG', 1),
(3, 'wulan', 'wulan', 'kasir', 'KASIR', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_barang`
-- (See below for the actual view)
--
CREATE TABLE `v_barang` (
`kode_barang` varchar(30)
,`nama_barang` varchar(50)
,`harga_jual_barang` double
,`harga_beli_barang` double
,`stok_barang` int(8)
,`barang_paketan` tinyint(1)
,`id_kategori` int(4)
,`kode_kategori` varchar(3)
,`nama_kategori_barang` varchar(30)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_pembelian`
-- (See below for the actual view)
--
CREATE TABLE `v_pembelian` (
`id_pembelian` int(11)
,`kode_pembelian` varchar(15)
,`tanggal_pembelian` date
,`kode_pemasok` int(5)
,`nama_pemasok` varchar(30)
,`alamat_pemasok` text
,`telp_pemasok` varchar(15)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_pembelian_detail`
-- (See below for the actual view)
--
CREATE TABLE `v_pembelian_detail` (
`id_pembelian` int(11)
,`kode_pembelian` varchar(15)
,`tanggal_pembelian` date
,`kode_pemasok` int(5)
,`nama_pemasok` varchar(30)
,`alamat_pemasok` text
,`telp_pemasok` varchar(15)
,`id_pembelian_detail` int(11)
,`harga_pembelian` double
,`jumlah_pembelian` int(11)
,`kode_barang` varchar(30)
,`nama_barang` varchar(50)
,`harga_jual_barang` double
,`harga_beli_barang` double
,`stok_barang` int(8)
,`barang_paketan` tinyint(1)
,`id_kategori_barang` int(4)
,`kode_ketegori_barang` varchar(3)
,`nama_kategori_barang` varchar(30)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_penjualan`
-- (See below for the actual view)
--
CREATE TABLE `v_penjualan` (
`kode_penjualan` varchar(25)
,`tanggal_penjualan` date
,`kode_pelanggan` varchar(10)
,`nama_pelanggan` varchar(100)
,`alamat_pelanggan` text
,`tlp_pelanggan` varchar(100)
,`pelanggan_agen` tinyint(1)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_penjualan_detail`
-- (See below for the actual view)
--
CREATE TABLE `v_penjualan_detail` (
`kode_penjualan` varchar(25)
,`tanggal_penjualan` date
,`kode_pelanggan` varchar(10)
,`nama_pelanggan` varchar(100)
,`alamat_pelanggan` text
,`tlp_pelanggan` varchar(100)
,`pelanggan_agen` tinyint(1)
,`kode_penjualan_detail` int(11)
,`harga_penjualan` double
,`jumlah_penjualan` int(11)
,`diskon_penjualan` double
,`kode_barang` varchar(30)
,`nama_barang` varchar(50)
,`harga_jual_barang` double
,`harga_beli_barang` double
,`stok_barang` int(8)
,`barang_paketan` tinyint(1)
,`id_kategori_barang` int(4)
,`kode_kategori_barang` varchar(3)
,`nama_kategori_barnag` varchar(30)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_pesanan_pembelian`
-- (See below for the actual view)
--
CREATE TABLE `v_pesanan_pembelian` (
`kode_pesanan` varchar(15)
,`tanggal_pesanan` date
,`kode_pemasok` int(5)
,`nama_pemasok` varchar(30)
,`alamat_pemasok` text
,`telp_pemasok` varchar(15)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_pesanan_pembelian_detail`
-- (See below for the actual view)
--
CREATE TABLE `v_pesanan_pembelian_detail` (
`kode_pemesanan` varchar(15)
,`tanggal_pemesanan` date
,`kode_pemasok` int(5)
,`nama_pemasok` varchar(30)
,`alamat_pemasok` text
,`telp_pemasok` varchar(15)
,`id_pemesanan_detail` int(11)
,`jumlah_pemesanan` int(11)
,`kode_barang` varchar(30)
,`nama_barang` varchar(50)
,`harga_jual_barang` double
,`harga_beli_barang` double
,`stok_barang` int(8)
,`barang_paketan` tinyint(1)
,`id_kategori_barang` int(4)
,`kode_ketegori_barang` varchar(3)
,`nama_kategori_barang` varchar(30)
);

-- --------------------------------------------------------

--
-- Structure for view `v_barang`
--
DROP TABLE IF EXISTS `v_barang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_barang`  AS  select `b`.`kode` AS `kode_barang`,`b`.`nama` AS `nama_barang`,`b`.`harga_jual` AS `harga_jual_barang`,`b`.`harga_beli` AS `harga_beli_barang`,`b`.`jumlah` AS `stok_barang`,`b`.`paket` AS `barang_paketan`,`k`.`id` AS `id_kategori`,`k`.`kode` AS `kode_kategori`,`k`.`nama` AS `nama_kategori_barang` from (`barang` `b` join `kategori_brg` `k` on((`b`.`id_kategori` = `k`.`id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_pembelian`
--
DROP TABLE IF EXISTS `v_pembelian`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_pembelian`  AS  select `b`.`id` AS `id_pembelian`,`b`.`kode` AS `kode_pembelian`,`b`.`tgl` AS `tanggal_pembelian`,`p`.`id` AS `kode_pemasok`,`p`.`nama` AS `nama_pemasok`,`p`.`alamat` AS `alamat_pemasok`,`p`.`tlp` AS `telp_pemasok` from (`pembelian` `b` join `pemasok` `p` on((`b`.`id_pemasok` = `p`.`id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_pembelian_detail`
--
DROP TABLE IF EXISTS `v_pembelian_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_pembelian_detail`  AS  select `b`.`id` AS `id_pembelian`,`b`.`kode` AS `kode_pembelian`,`b`.`tgl` AS `tanggal_pembelian`,`p`.`id` AS `kode_pemasok`,`p`.`nama` AS `nama_pemasok`,`p`.`alamat` AS `alamat_pemasok`,`p`.`tlp` AS `telp_pemasok`,`bd`.`id` AS `id_pembelian_detail`,`bd`.`harga` AS `harga_pembelian`,`bd`.`jumlah` AS `jumlah_pembelian`,`brg`.`kode` AS `kode_barang`,`brg`.`nama` AS `nama_barang`,`brg`.`harga_jual` AS `harga_jual_barang`,`brg`.`harga_beli` AS `harga_beli_barang`,`brg`.`jumlah` AS `stok_barang`,`brg`.`paket` AS `barang_paketan`,`kbrg`.`id` AS `id_kategori_barang`,`kbrg`.`kode` AS `kode_ketegori_barang`,`kbrg`.`nama` AS `nama_kategori_barang` from ((((`pembelian` `b` join `pemasok` `p` on((`b`.`id_pemasok` = `p`.`id`))) join `pembelian_detail` `bd` on((`b`.`id` = `bd`.`id_pembelian`))) join `barang` `brg` on((`bd`.`kode_barang` = `brg`.`kode`))) join `kategori_brg` `kbrg` on((`kbrg`.`id` = `brg`.`id_kategori`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_penjualan`
--
DROP TABLE IF EXISTS `v_penjualan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_penjualan`  AS  select `j`.`kode` AS `kode_penjualan`,`j`.`tgl` AS `tanggal_penjualan`,`p`.`kode` AS `kode_pelanggan`,`p`.`nama` AS `nama_pelanggan`,`p`.`alamat` AS `alamat_pelanggan`,`p`.`notlp` AS `tlp_pelanggan`,`p`.`agen` AS `pelanggan_agen` from (`penjualan` `j` join `pelanggan` `p` on((`j`.`kode_pelanggan` = `p`.`kode`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_penjualan_detail`
--
DROP TABLE IF EXISTS `v_penjualan_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_penjualan_detail`  AS  select `j`.`kode` AS `kode_penjualan`,`j`.`tgl` AS `tanggal_penjualan`,`p`.`kode` AS `kode_pelanggan`,`p`.`nama` AS `nama_pelanggan`,`p`.`alamat` AS `alamat_pelanggan`,`p`.`notlp` AS `tlp_pelanggan`,`p`.`agen` AS `pelanggan_agen`,`jd`.`id` AS `kode_penjualan_detail`,`jd`.`harga` AS `harga_penjualan`,`jd`.`jumlah` AS `jumlah_penjualan`,`jd`.`diskon` AS `diskon_penjualan`,`brg`.`kode` AS `kode_barang`,`brg`.`nama` AS `nama_barang`,`brg`.`harga_jual` AS `harga_jual_barang`,`brg`.`harga_beli` AS `harga_beli_barang`,`brg`.`jumlah` AS `stok_barang`,`brg`.`paket` AS `barang_paketan`,`kbrg`.`id` AS `id_kategori_barang`,`kbrg`.`kode` AS `kode_kategori_barang`,`kbrg`.`nama` AS `nama_kategori_barnag` from ((((`penjualan` `j` join `pelanggan` `p` on((`j`.`kode_pelanggan` = `p`.`kode`))) join `penjualan_detail` `jd` on((`j`.`kode` = `jd`.`kode_penjualan`))) join `barang` `brg` on((`brg`.`kode` = `jd`.`kode_barang`))) join `kategori_brg` `kbrg` on((`kbrg`.`id` = `brg`.`id_kategori`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_pesanan_pembelian`
--
DROP TABLE IF EXISTS `v_pesanan_pembelian`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_pesanan_pembelian`  AS  select `b`.`kode` AS `kode_pesanan`,`b`.`tgl` AS `tanggal_pesanan`,`p`.`id` AS `kode_pemasok`,`p`.`nama` AS `nama_pemasok`,`p`.`alamat` AS `alamat_pemasok`,`p`.`tlp` AS `telp_pemasok` from (`pesanan_pembelian` `b` join `pemasok` `p` on((`b`.`id_pemasok` = `p`.`id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_pesanan_pembelian_detail`
--
DROP TABLE IF EXISTS `v_pesanan_pembelian_detail`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_pesanan_pembelian_detail`  AS  select `b`.`kode` AS `kode_pemesanan`,`b`.`tgl` AS `tanggal_pemesanan`,`p`.`id` AS `kode_pemasok`,`p`.`nama` AS `nama_pemasok`,`p`.`alamat` AS `alamat_pemasok`,`p`.`tlp` AS `telp_pemasok`,`bd`.`id` AS `id_pemesanan_detail`,`bd`.`jumlah` AS `jumlah_pemesanan`,`brg`.`kode` AS `kode_barang`,`brg`.`nama` AS `nama_barang`,`brg`.`harga_jual` AS `harga_jual_barang`,`brg`.`harga_beli` AS `harga_beli_barang`,`brg`.`jumlah` AS `stok_barang`,`brg`.`paket` AS `barang_paketan`,`kbrg`.`id` AS `id_kategori_barang`,`kbrg`.`kode` AS `kode_ketegori_barang`,`kbrg`.`nama` AS `nama_kategori_barang` from ((((`pesanan_pembelian` `b` join `pemasok` `p` on((`b`.`id_pemasok` = `p`.`id`))) join `pesanan_pembelian_detail` `bd` on((`b`.`kode` = `bd`.`kode_pesanan`))) join `barang` `brg` on((`bd`.`kode_barang` = `brg`.`kode`))) join `kategori_brg` `kbrg` on((`kbrg`.`id` = `brg`.`id_kategori`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kode`),
  ADD KEY `fk_barang_kategori` (`id_kategori`);

--
-- Indexes for table `kategori_brg`
--
ALTER TABLE `kategori_brg`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode` (`kode`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`kode`);

--
-- Indexes for table `pemasok`
--
ALTER TABLE `pemasok`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_beli_pemasok` (`id_pemasok`);

--
-- Indexes for table `pembelian_detail`
--
ALTER TABLE `pembelian_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_beli_detail_beli` (`id_pembelian`),
  ADD KEY `fk_beli_detail_barang` (`kode_barang`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`kode`),
  ADD KEY `fk_jual_pelanggan` (`kode_pelanggan`);

--
-- Indexes for table `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_jual_detail_jual` (`kode_penjualan`),
  ADD KEY `fk_jual_detail_barang` (`kode_barang`);

--
-- Indexes for table `pesanan_pembelian`
--
ALTER TABLE `pesanan_pembelian`
  ADD PRIMARY KEY (`kode`),
  ADD KEY `fk_pesan_beli_pemasok` (`id_pemasok`);

--
-- Indexes for table `pesanan_pembelian_detail`
--
ALTER TABLE `pesanan_pembelian_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pesan_beli_detail_pesan_beli` (`kode_pesanan`),
  ADD KEY `fk_pesan_beli_detail_barang` (`kode_barang`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kategori_brg`
--
ALTER TABLE `kategori_brg`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pemasok`
--
ALTER TABLE `pemasok`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `pembelian_detail`
--
ALTER TABLE `pembelian_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pesanan_pembelian_detail`
--
ALTER TABLE `pesanan_pembelian_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `fk_barang_kategori` FOREIGN KEY (`id_kategori`) REFERENCES `kategori_brg` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `fk_beli_pemasok` FOREIGN KEY (`id_pemasok`) REFERENCES `pemasok` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pembelian_detail`
--
ALTER TABLE `pembelian_detail`
  ADD CONSTRAINT `fk_beli_detail_barang` FOREIGN KEY (`kode_barang`) REFERENCES `barang` (`kode`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_beli_detail_beli` FOREIGN KEY (`id_pembelian`) REFERENCES `pembelian` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `fk_jual_pelanggan` FOREIGN KEY (`kode_pelanggan`) REFERENCES `pelanggan` (`kode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  ADD CONSTRAINT `fk_jual_detail_barang` FOREIGN KEY (`kode_barang`) REFERENCES `barang` (`kode`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_jual_detail_jual` FOREIGN KEY (`kode_penjualan`) REFERENCES `penjualan` (`kode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pesanan_pembelian`
--
ALTER TABLE `pesanan_pembelian`
  ADD CONSTRAINT `fk_pesan_beli_pemasok` FOREIGN KEY (`id_pemasok`) REFERENCES `pemasok` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pesanan_pembelian_detail`
--
ALTER TABLE `pesanan_pembelian_detail`
  ADD CONSTRAINT `fk_pesan_beli_detail_barang` FOREIGN KEY (`kode_barang`) REFERENCES `barang` (`kode`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pesan_beli_detail_pesan_beli` FOREIGN KEY (`kode_pesanan`) REFERENCES `pesanan_pembelian` (`kode`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
