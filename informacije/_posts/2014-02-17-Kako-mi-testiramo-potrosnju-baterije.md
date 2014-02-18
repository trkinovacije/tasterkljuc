---
css: custom
title: Kako mi testiramo potrošnju baterije ?
layout: post
category: informacije
tags: mini-kljuc
---

1. <a href="#jedno"> Merenje potrošnje jednog otključavanja pomoću napona na 10&#937;</a>
2. <a href="#ponovljeno">Merenje pomoću ponovljenog zvona - test bed</a>
3. <a href="#slucajno">Merenje pomoću slučajnog ispitivanja - test bed</a>
4. <a href="#prodato">Merenje pomoću prodatih Taster Ključeva</a>

Merenje je izvršeno na fabričko podešenih 5 sekundi trajanje otključavanja. To naravno može da se smanji na jednu sekundu ako ste dovoljno brzi, ili imate bravu koja pamti, pa samim tim produžite vek trajanja baterije.

Korišćena je Maxell Lithium Manganese Dioxide Battery sa kapacitetom <strong>220 <i>mAh</i></strong> koja ide uz uređaj. I ona može da se zameniti za neku sa većim kapacitetom.

Pošto uređaj kada se ne koristi uđe u duboki režim spavanja (deep sleep mode) onda troši samo <strong>0.14   <i>&#181;A</i></strong> (da da mikro ampera) što nam je potvrdio naš [Peaktech 3360](http://www.peaktech.de/productdetail/kategorie/digital---handmultimeter/produkt/p-3360.html). Proverili smo i sa drugim multimetrom mereći napon na redno vezanim 1 <i>K&#937;</i> i dobili smo 0.14 <i>mV</i> (što jeste 0.14<i>&#181;A&#183;</i> 1<i>K</i>). Zbog toga u našim proračunima stoji samo potrošnja tokom prepoznavanja i otključavanja.

<hr class="featurette-divider">
<a name="jedno"></a> 
## Merenje potrošnje jednog otključavanja pomoću napona na 10&#937;

Iskoristili smo naš prelepi Tektronix [TBS1102](http://www.testequipmentdepot.com/tektronix/oscilloscope/tbs1102.htm) da precizno izmerimo napajanje na redno vezanom otporniku 10 <i>&#937;</i>. Kad znamo napon, struja se lako može izračunati, a samim tim i potrošnja za jedno otključavanje vrata. U sledećoj tabeli su prikazani rezultati merenja za [Taster kljuc - mini kljuć](/proizvodi/mini-kljuc).

<p>
<div class="row">
  <div class="col-lg-4">
    <img src="/assets/images/test_bed/fivewire_newbat.BMP">
  </div>
  <div class="col-lg-8">
    <table class="table table-striped special">
      <thead>
        <tr>
          <th>Model</th>
          <th>Stara-nova baterija</th>
          <th>Broj otključavanja<br>220 <i>mAh</i> &#183; 3600<i>s</i> / <i>mAs</i></th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>Dvožični</td>
          <td><a href="/assets/images/test_bed/twowire_oldbat.gnumeric">11</a>-<a href="/assets/images/test_bed/twowire_newbat.gnumeric">16</a><i>&nbsp;mAs</i></td>
          <td>49500</td>
        </tr>
        <tr>
          <td>Petožični</td>
          <td><a href="/assets/images/test_bed/fivewire_oldbat.gnumeric">10</a>-<a href="/assets/images/test_bed/fivewire_newbat.gnumeric">29</a><i>&nbsp;mAs</i></td>
          <td>27300</td>
        </tr>
        <tr>
          <td>Impulsni</td>
          <td><a href="/assets/images/test_bed/impuls_oldbat.gnumeric">10</a>-<a href="/assets/images/test_bed/impuls_newbat.gnumeric">19</a><i>&nbsp;mAs</i></td>
          <td>41600</td>
        </tr>
      </tbody>
    </table>
  </div>
</div>

Na osnovu ove tabele možemo zaključiti da je trajanje baterije nekoliko desetina hiljada otključavanja brave.

Ova merenja smo proverili tako što smo multimetrom merili struju otključavanja. Npr. za petožični nova baterija, posle sekund i po potrošnje oko 1.3 <i>mA</i> (provera tajnog koda), dolaze pet sekundi po 5.4 <i>mA</i> za otključavanje brave što daje ukupno oko 29 <i>mAs</i> za jedno otključavanje brave.

<hr class="featurette-divider">
<a name="ponovljeno"></a> 

## Merenje pomoću ponovljenog zvona - test bed  

Za potrebe ispitivanja trajanja baterije napravili smo sistem koji umesto nas pritiska taster za zvono i posmatra napon na bravi. Na taj način jednostavno pokrenemo automatsko zvono na svakih 15 sekundi i brojimo sate koliko će uređaj da radi.

Kako je petožični model najviše zahtevan, onda smo taj model koristili za test.
Rezultati su pokazali da uređaj može da otključa preko 10 hiljada puta.

Treba naglasiti da se ovo ispitivanje bitno razlikuje od realnih uslova jer baterija ima svojstvo da se oporavlja kada se ne koristi (tj. kada ne mora da otključava vrata).

Takođe, ovde smo merili samo potrošnju otključavanja, a može se desiti da je kod nekog značajna potrošnja provere tj. kada neko zvoni a ne dođe do otključavanja. 

<hr class="featurette-divider">
<a name="slucajno"></a> 
## Merenje pomoću slučajnog ispitivanja - test bed  

Da bi testirali kako potrošnju tako i funkcionalnost, uvideli smo da je najvažniji slučajan test ([monkey testing](http://en.wikipedia.org/wiki/Monkey_test)). Na taj način smo otkrili nekoliko grešaka ([bugs](http://en.wikipedia.org/wiki/Computer_bug)) u našem uređaju i na vreme ih otklonili.

<hr class="featurette-divider">
<a name="prodato"></a> 
## Merenje pomoću prodatih Taster Ključeva

U samom mikrokontroleru postoji brojač koliko puta se on resetovao, probudio i otključao vrata, tako da vrlo lako možemo utvrditi koliko je.


