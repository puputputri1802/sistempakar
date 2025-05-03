<title>Diagnosa</title>
<style>
  span.kondisipilih {
    background-color: transparent;
    padding: 2px 4px;
    border-radius: 4px;
}
td{
  background-color:rgb(255, 255, 255);
}
#diagnosaBtn:active {
    background-color: #ff80bf; /* Ganti warna saat tombol diklik */
  }


</style>
<?php
switch ($_GET['act']) {

  default:
    if ($_POST['submit']) {
      $arcolor = array('#ffffff','#FFE6EC', '#FFB6C1', '#FF80A4', '#FF4D94', '#FF1A75', '#FF0066'	);

      date_default_timezone_set("Asia/Jakarta");
      $inptanggal = date('Y-m-d H:i:s');

      $arbobot = array('0', '0', '0.2', '0.4', '0.6', '0.8', '1');
      $argejala = array();

      for ($i = 0; $i < count($_POST['kondisi']); $i++) {
        $arkondisi = explode("_", $_POST['kondisi'][$i]);
        if (strlen($_POST['kondisi'][$i]) > 1) {
          $argejala += array($arkondisi[0] => $arkondisi[1]);
        }
      }

      $sqlkondisi = mysqli_query($conn, "SELECT * FROM kondisi order by id+0");
      while ($rkondisi = mysqli_fetch_array($sqlkondisi)) {
        $arkondisitext[$rkondisi['id']] = $rkondisi['kondisi'];
      }

      $sqlpkt = mysqli_query($conn, "SELECT * FROM penyakit order by kode_penyakit+0");
      while ($rpkt = mysqli_fetch_array($sqlpkt)) {
        $arpkt[$rpkt['kode_penyakit']] = $rpkt['nama_penyakit'];
        $ardpkt[$rpkt['kode_penyakit']] = $rpkt['det_penyakit'];
        $arspkt[$rpkt['kode_penyakit']] = $rpkt['srn_penyakit'];
        $argpkt[$rpkt['kode_penyakit']] = $rpkt['gambar'];
      }

      //print_r($arkondisitext);
      // -------- perhitungan certainty factor (CF) ---------
      // --------------------- START ------------------------
      $sqlpenyakit = mysqli_query($conn, "SELECT * FROM penyakit order by kode_penyakit");
      $arpenyakit = array();
      while ($rpenyakit = mysqli_fetch_array($sqlpenyakit)) {
        $cflama = 0;
        $sqlgejala = mysqli_query($conn, "SELECT * FROM basis_pengetahuan where kode_penyakit=$rpenyakit[kode_penyakit]");
        while ($rgejala = mysqli_fetch_array($sqlgejala)) {
          foreach ($_POST['kondisi'] as $input) {
            $arkondisi = explode("_", $input);
            $kode_gejala_user = $arkondisi[0];
            $nilai_kondisi_user = $arkondisi[1];
            if ($rgejala['kode_gejala'] == $kode_gejala_user) {
              $cf = $rgejala['mb'] * $arbobot[$nilai_kondisi_user];
              $cflama = $cflama + ($cf * (1 - $cflama));
            }
          }
        }
        if ($cflama > 0) {
          $arpenyakit[$rpenyakit['kode_penyakit']] = number_format($cflama, 4);
        }
      }


      arsort($arpenyakit);

      $inpgejala = serialize($argejala);
      $inppenyakit = serialize($arpenyakit);

      $np1 = 0;
      foreach ($arpenyakit as $key1 => $value1) {
        $np1++;
        $idpkt1[$np1] = $key1;
        $vlpkt1[$np1] = $value1;
      }

      mysqli_query($conn, "INSERT INTO hasil(
                  tanggal,
                  gejala,
                  penyakit,
                  hasil_id,
                  hasil_nilai
				  ) 
	        VALUES(
                '$inptanggal',
                '$inpgejala',
                '$inppenyakit',
                '$idpkt1[1]',
                '$vlpkt1[1]'
				)");
      // --------------------- END -------------------------

      echo "<div class='content' >

	<h2 class='text text-primary'>Hasil Diagnosis &nbsp;&nbsp;<button id='print' onClick='window.print();' data-toggle='tooltip' data-placement='right' title='Klik tombol ini untuk mencetak hasil diagnosa'><i class='fa fa-print'></i> Cetak</button> </h2>
	          <hr><table class='table table-bordered '  > 
          <th style='background-color:#ffc0c0' width=8%>No</th>
          <th style='background-color:#ffc0c0' width=10%>Kode</th>
          <th style='background-color:#ffc0c0'>Gejala yang dialami (keluhan)</th>
          <th style='background-color:#ffc0c0'width=20%>Pilihan</th>
          </tr>";
      $ig = 0;
      foreach ($argejala as $key => $value) {
        $kondisi = $value;
        $ig++;
        $gejala = $key;
        $sql4 = mysqli_query($conn, "SELECT * FROM gejala where kode_gejala = '$key'");
        $r4 = mysqli_fetch_array($sql4);
        echo '<tr><td>' . $ig . '</td>';
        echo '<td>G' . str_pad($r4['kode_gejala'], 3, '0', STR_PAD_LEFT) . '</td>';
        echo '<td><span style="color:black"class="hasil text text-primary">' . $r4['nama_gejala'] . "</span></td>";
        echo '<td><span class="kondisipilih" style="color:' . $arcolor[$kondisi] . '" >' . $arkondisitext[$kondisi] . "</span></td></tr>";
      }
      $np = 0;
      foreach ($arpenyakit as $key => $value) {
        $np++;
        $idpkt[$np] = $key;
        $nmpkt[$np] = $arpkt[$key];
        $vlpkt[$np] = $value;
      }
      if ($argpkt[$idpkt[1]]) {
        $gambar = 'gambar/penyakit/' . $argpkt[$idpkt[1]];
      } else {
        $gambar = 'gambar/noimage.png';
      }
      echo "</table><div class='well well-small' ><img class='card-img-top img-bordered-sm' style='float:right; margin-left:15px;' src='" . $gambar . "' height=200><h3>Hasil Diagnosa</h3>";
      $persentase = number_format($vlpkt[1] * 100, 1, ',', '');
      $nilai_cf = str_replace('.', ',', $vlpkt[1]);
      echo "<div class='callout callout-default'>Jenis penyakit yang diderita adalah <b><h3 class='text text-success'>" . $nmpkt[1] . "</b> / " . $persentase . "% (" . $nilai_cf . ")<br></h3>";
      echo "</h4></div></div>
        <div class='box box-warning box-solid'><div class='box-header with-border'><h3 class='box-title'>Saran</h3></div><div class='box-body'><h4>";
      
    } else {
      echo "
	 <h2 class='text text-primary'>Diagnosa Penyakit</h2>  <hr>
	 <div class='alert alert-success alert-dismissible'>
                <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>×</button>
                <h4><i class='icon fa fa-exclamation-triangle'></i>Perhatian !</h4>
                Silahkan memilih gejala sesuai dengan kondisi ayam anda, anda dapat memilih kepastian kondisi ayam dari pasti tidak sampai pasti ya, jika sudah tekan tombol proses (<i class='fa fa-search-plus'></i>)  di bawah untuk melihat hasil.
              </div>
		<form name=text_form method=POST action='diagnosa' >
           <table  class='table table-bordered  '><tbody class='pilihkondisi'>
           <tr >
           <th  style='background-color:#ffc0c0'>No</th>
           <th  style='background-color:#ffc0c0'>Kode</th>
           <th  style='background-color:#ffc0c0'>Gejala</th>
           <th  style='background-color:#ffc0c0'width='20%'>Pilih Kondisi</th>
           </tr>";

      $sql3 = mysqli_query($conn, "SELECT * FROM gejala order by kode_gejala");
      $i = 0;
      while ($r3 = mysqli_fetch_array($sql3)) {
        $i++;
        echo "<tr><td  class=opsi>$i</td>";
        echo "<td  class=opsi>G" . str_pad($r3['kode_gejala'], 3, '0', STR_PAD_LEFT) . "</td>";
        echo "<td class=gejala>$r3[nama_gejala]</td>";
        echo '<td class="opsi"><select name="kondisi[]" id="sl' . $i . '" style="color:#fffff" class="opsikondisi"/><option style="color:#ffffff; background-color:#ffc0cb;" data-id="0" value="0">Pilih jika sesuai</option>';
        $s = "select * from kondisi order by id";
        $q = mysqli_query($conn, $s) or die($s);
        while ($rw = mysqli_fetch_array($q)) {
?>
<option style="color:#ffffff; background-color:#ffc0cb;" data-id="<?php echo $rw['id']; ?>" value="<?php echo $r3['kode_gejala'] . '_' . $rw['id']; ?>"><?php echo $rw['kondisi']; ?></option>
<?php
        }
        echo '</select></td>';
        ?>
        <script type="text/javascript">
          $(document).ready(function() {
            var arcolor = new Array(
              '#ffffff', 
              '#FFE6EC', //  Tidak
              '#FFB6C1', //  Tidak yakin
              '#FF80A4', //  Sedikit yakin
              '#FF4D94', //  Cukup yakin
              '#FF1A75', //  Yakin
              '#CC0055', //  Sangat yakin
            );

            setColor();
            $('.pilihkondisi').on('change', 'tr td select#sl<?php echo $i; ?>', function() {
              setColor();
            });

            function setColor() {
              var selectedItem = $('tr td select#sl<?php echo $i; ?> :selected');
              var color = arcolor[selectedItem.data("id")];
              $('tr td select#sl<?php echo $i; ?>.opsikondisi').css('background-color', color);
              console.log(color);
            }
          });
        </script>
<?php
        echo "</tr>";
      }
      echo "
		  <input  class='float' type=submit data-toggle='tooltip' data-placement='top' title='Klik disini untuk melihat hasil diagnosa' name=submit value='&#xf00e;' style='font-family:Arial, FontAwesome; background-color:#ffc0cb; color:#ffffff;' id='diagnosaBtn'>
          </tbody></table></form>";
    }
    break;
}
?>