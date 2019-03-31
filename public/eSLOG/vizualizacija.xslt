<?xml version="1.0" encoding="UTF-8"?>
<!-- 
Dokument je v celoti v lasti SETCCE. Kopiranje dokumenta ali delov dokumenta brez soglasja SETCCE ni dovoljeno. Vse pravice pridržane.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:decimal-format name="dec" decimal-separator="," grouping-separator="."/>
	<xsl:key name="globalniPopust" match="PoljubnoBesedilo/Besedilo[Tekst1='GLOBALNI_POPUSTI']" use="Tekst4" />

	<xsl:template match="/IzdaniRacunEnostavni/Racun">
		<xsl:variable name="NASLOV_RACUNA">
			<xsl:call-template name="Parameter">
				<xsl:with-param name="name" select="'NASLOV_RACUNA'"/>
			</xsl:call-template>
		</xsl:variable>
		<xsl:variable name="STEVILKA_RACUNA" select="GlavaRacuna/StevilkaRacuna"/>
		<html>
			<head>
				<title>
					<xsl:value-of select="concat('Dokument [ ', $NASLOV_RACUNA,' ] - št.: ', $STEVILKA_RACUNA)"/>
				</title>
				<style type="text/css">
				    .bold {font-weight: bold;}
					.big {font-size: 12pt; font-family: Tahoma}
					.normal {font-size: 9pt; font-family: Tahoma}
					.bsmall {font-size: 8.5pt; font-family: Tahoma}
					.small {font-size: 7.5pt; font-family: Tahoma}
				</style>
			</head>
			<body class="normal">
				<xsl:variable name="izdajatelj" select="PodatkiPodjetja[NazivNaslovPodjetja/VrstaPartnerja='II']"/>
				<xsl:variable name="izdajatelj_naziv_1" select="concat($izdajatelj/NazivNaslovPodjetja/NazivPartnerja/NazivPartnerja1, $izdajatelj/NazivNaslovPodjetja/NazivPartnerja/NazivPartnerja2)"/>
				<xsl:variable name="izdajatelj_naziv_2" select="concat($izdajatelj/NazivNaslovPodjetja/NazivPartnerja/NazivPartnerja3, $izdajatelj/NazivNaslovPodjetja/NazivPartnerja/NazivPartnerja4)"/>
				<xsl:variable name="izdajatelj_naslov_1" select="concat($izdajatelj/NazivNaslovPodjetja/Ulica/Ulica1, $izdajatelj/NazivNaslovPodjetja/Ulica/Ulica2)"/>
				<xsl:variable name="izdajatelj_naslov_2" select="concat($izdajatelj/NazivNaslovPodjetja/Ulica/Ulica3, $izdajatelj/NazivNaslovPodjetja/Ulica/Ulica4)"/>
				<xsl:variable name="izdajatelj_posta_kraj" select="concat($izdajatelj/NazivNaslovPodjetja/PostnaStevilka, ' ', $izdajatelj/NazivNaslovPodjetja/Kraj)"/>
				<xsl:variable name="izdajatelj_drzava" select="concat($izdajatelj/NazivNaslovPodjetja/KodaDrzave, ' - ', $izdajatelj/NazivNaslovPodjetja/NazivDrzave)"/>
				<xsl:variable name="izdajatelj_davcna" select="$izdajatelj/ReferencniPodatkiPodjetja[VrstaPodatkaPodjetja='VA']/PodatekPodjetja"/>
				<xsl:variable name="izdajatelj_maticna" select="$izdajatelj/ReferencniPodatkiPodjetja[VrstaPodatkaPodjetja='GN']/PodatekPodjetja"/>
				<xsl:variable name="izdajatelj_trr" select="$izdajatelj/FinancniPodatkiPodjetja[1]/BancniRacun/StevilkaBancnegaRacuna"/>
				<xsl:variable name="izdajatelj_banka_1" select="$izdajatelj/FinancniPodatkiPodjetja[1]/BancniRacun/NazivBanke1"/>
				<xsl:variable name="izdajatelj_banka_2" select="$izdajatelj/FinancniPodatkiPodjetja[1]/BancniRacun/NazivBanke2"/>
				<xsl:variable name="izdajatelj_tel" select="$izdajatelj/KontaktiPodjetja/Komunikacije[VrstaKomunikacije='TE']/StevilkaKomunikacije"/>
				<xsl:variable name="izdajatelj_fax" select="$izdajatelj/KontaktiPodjetja/Komunikacije[VrstaKomunikacije='FX']/StevilkaKomunikacije"/>
				<xsl:variable name="izdajatelj_kontaktna_oseba" select="$izdajatelj/KontaktiPodjetja/KontaktnaOseba/ImeOsebe"/>

				<xsl:variable name="narocnik" select="PodatkiPodjetja[NazivNaslovPodjetja/VrstaPartnerja='BY']"/>
				<xsl:variable name="narocnik_naziv_1" select="concat($narocnik/NazivNaslovPodjetja/NazivPartnerja/NazivPartnerja1, $narocnik/NazivNaslovPodjetja/NazivPartnerja/NazivPartnerja2)"/>
				<xsl:variable name="narocnik_naziv_2" select="concat($narocnik/NazivNaslovPodjetja/NazivPartnerja/NazivPartnerja3, $narocnik/NazivNaslovPodjetja/NazivPartnerja/NazivPartnerja4)"/>
				<xsl:variable name="narocnik_naslov_1" select="concat($narocnik/NazivNaslovPodjetja/Ulica/Ulica1, $narocnik/NazivNaslovPodjetja/Ulica/Ulica2)"/>
				<xsl:variable name="narocnik_naslov_2" select="concat($narocnik/NazivNaslovPodjetja/Ulica/Ulica3, $narocnik/NazivNaslovPodjetja/Ulica/Ulica4)"/>
				<xsl:variable name="narocnik_posta_kraj" select="concat($narocnik/NazivNaslovPodjetja/PostnaStevilka, ' ', $narocnik/NazivNaslovPodjetja/Kraj)"/>
				<xsl:variable name="narocnik_drzava" select="concat($narocnik/NazivNaslovPodjetja/KodaDrzave, ' - ', $narocnik/NazivNaslovPodjetja/NazivDrzave)"/>
				<xsl:variable name="narocnik_davcna" select="$narocnik/ReferencniPodatkiPodjetja[VrstaPodatkaPodjetja='VA']/PodatekPodjetja"/>
				<xsl:variable name="narocnik_maticna" select="$narocnik/ReferencniPodatkiPodjetja[VrstaPodatkaPodjetja='GN']/PodatekPodjetja"/>
				<xsl:variable name="narocnik_trr" select="$narocnik/FinancniPodatkiPodjetja[1]/BancniRacun/StevilkaBancnegaRacuna"/>

				<xsl:variable name="BIC_izdajatelj" select="PodatkiPodjetja/NazivNaslovPodjetja[VrstaPartnerja='II']/../FinancniPodatkiPodjetja/BancniRacun/BIC"/>
				<xsl:variable name="BIC_narocnik" select="PodatkiPodjetja/NazivNaslovPodjetja[VrstaPartnerja='BY']/../FinancniPodatkiPodjetja/BancniRacun/BIC"/>
				<xsl:variable name="BIC_prejemnik" select="PodatkiPodjetja/NazivNaslovPodjetja[VrstaPartnerja='IV']/../FinancniPodatkiPodjetja/BancniRacun/BIC"/>

				<xsl:variable name="narocnik_banka_1" select="$narocnik/FinancniPodatkiPodjetja[1]/BancniRacun/NazivBanke1"/>
				<xsl:variable name="narocnik_banka_2" select="$narocnik/FinancniPodatkiPodjetja[1]/BancniRacun/NazivBanke2"/>
				<xsl:variable name="narocnik_email" select="$narocnik/KontaktiPodjetja/Komunikacije[VrstaKomunikacije='EM']/StevilkaKomunikacije"/>
				<xsl:variable name="narocnik_tel" select="$narocnik/KontaktiPodjetja/Komunikacije[VrstaKomunikacije='TE']/StevilkaKomunikacije"/>
				<xsl:variable name="narocnik_fax" select="$narocnik/KontaktiPodjetja/Komunikacije[VrstaKomunikacije='FX']/StevilkaKomunikacije"/>
				<xsl:variable name="narocnik_kontaktna_oseba" select="$narocnik/KontaktiPodjetja/KontaktnaOseba/ImeOsebe"/>
				<xsl:variable name="narocnik_sifra" select="$narocnik/ReferencniPodatkiPodjetja[VrstaPodatkaPodjetja='IT']/PodatekPodjetja"/>

				<xsl:variable name="prejemnik" select="PodatkiPodjetja[NazivNaslovPodjetja/VrstaPartnerja='IV']"/>
				<xsl:variable name="prejemnik_naziv_1" select="concat($prejemnik/NazivNaslovPodjetja/NazivPartnerja/NazivPartnerja1, $prejemnik/NazivNaslovPodjetja/NazivPartnerja/NazivPartnerja2)"/>
				<xsl:variable name="prejemnik_naziv_2" select="concat($prejemnik/NazivNaslovPodjetja/NazivPartnerja/NazivPartnerja3, $prejemnik/NazivNaslovPodjetja/NazivPartnerja/NazivPartnerja4)"/>
				<xsl:variable name="prejemnik_naslov_1" select="concat($prejemnik/NazivNaslovPodjetja/Ulica/Ulica1, $prejemnik/NazivNaslovPodjetja/Ulica/Ulica2)"/>
				<xsl:variable name="prejemnik_naslov_2" select="concat($prejemnik/NazivNaslovPodjetja/Ulica/Ulica3, $prejemnik/NazivNaslovPodjetja/Ulica/Ulica4)"/>
				<xsl:variable name="prejemnik_posta_kraj" select="concat($prejemnik/NazivNaslovPodjetja/PostnaStevilka, ' ', $prejemnik/NazivNaslovPodjetja/Kraj)"/>
				<xsl:variable name="prejemnik_drzava" select="concat($prejemnik/NazivNaslovPodjetja/KodaDrzave, ' - ', $prejemnik/NazivNaslovPodjetja/NazivDrzave)"/>
				<xsl:variable name="prejemnik_davcna" select="$prejemnik/ReferencniPodatkiPodjetja[VrstaPodatkaPodjetja='VA']/PodatekPodjetja"/>
				<xsl:variable name="prejemnik_maticna" select="$prejemnik/ReferencniPodatkiPodjetja[VrstaPodatkaPodjetja='GN']/PodatekPodjetja"/>
				<xsl:variable name="prejemnik_trr" select="$prejemnik/FinancniPodatkiPodjetja[1]/BancniRacun/StevilkaBancnegaRacuna"/>
				<xsl:variable name="prejemnik_banka_1" select="$prejemnik/FinancniPodatkiPodjetja[1]/BancniRacun/NazivBanke1"/>
				<xsl:variable name="prejemnik_banka_2" select="$prejemnik/FinancniPodatkiPodjetja[1]/BancniRacun/NazivBanke2"/>
				<xsl:variable name="prejemnik_tel" select="$prejemnik/KontaktiPodjetja/Komunikacije[VrstaKomunikacije='TE']/StevilkaKomunikacije"/>
				<xsl:variable name="prejemnik_fax" select="$prejemnik/KontaktiPodjetja/Komunikacije[VrstaKomunikacije='FX']/StevilkaKomunikacije"/>
				<xsl:variable name="prejemnik_kontaktna_oseba" select="$prejemnik/KontaktiPodjetja/KontaktnaOseba/ImeOsebe"/>

				<xsl:variable name="FAKTURIST">
					<xsl:call-template name="Parameter">
						<xsl:with-param name="name" select="'FAKTURIST'"/>
					</xsl:call-template>
				</xsl:variable>

				<xsl:variable name="OPIS_OBDOBJA">
					<xsl:call-template name="Parameter">
						<xsl:with-param name="name" select="'OPIS_OBDOBJA'"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="obdobje" select="DatumiRacuna[VrstaDatuma= '263']/DatumRacuna"/>
				<xsl:variable name="obdobje_od">
					<xsl:for-each select="$obdobje">
						<xsl:if test="position() = 1">
							<xsl:call-template name="format_date">
								<xsl:with-param name="date" select="."/>
							</xsl:call-template>
						</xsl:if>
					</xsl:for-each>
				</xsl:variable>
				<xsl:variable name="obdobje_do">
					<xsl:for-each select="$obdobje">
						<xsl:if test="position() = 2">
							<xsl:call-template name="format_date">
								<xsl:with-param name="date" select="."/>
							</xsl:call-template>
						</xsl:if>
					</xsl:for-each>
				</xsl:variable>
				<xsl:variable name="oznaka_racuna">
					<xsl:call-template name="Parameter">
						<xsl:with-param name="name" select="'OZNAKA_RACUNA'"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="GLAVA_TEKST" select="PoljubnoBesedilo/Besedilo[Tekst1 = 'GLAVA_TEKST']"/>
				<xsl:variable name="referencni_dokumenti" select="ReferencniDokumenti"/>
				<xsl:variable name="valuta" select="Valuta/KodaValute"/>
				<xsl:variable name="kraj_izdaje" select="Lokacije[VrstaLokacije='91']/NazivLokacije"/>
				<xsl:variable name="datum_izdaje" select="DatumiRacuna[VrstaDatuma= '137']/DatumRacuna"/>
				<xsl:variable name="datum_storitve" select="DatumiRacuna[VrstaDatuma= '35']/DatumRacuna"/>
				<xsl:variable name="rok_placila" select="PlacilniPogoji[PodatkiORokih/VrstaPogoja = '3']/PlacilniRoki[VrstaDatumaPlacilnegaRoka = '13']/Datum"/>
				<xsl:variable name="sklic" select="PovzetekZneskovRacuna[ZneskiRacuna/VrstaZneska = '9']/SklicZaPlacilo/StevilkaSklica"/>
				<xsl:variable name="NACIN_PLACILA" select="GlavaRacuna/NacinPlacila" />
				<xsl:variable name="obrnjena_davcna_vrednost">
					<xsl:call-template name="Parameter">
						<xsl:with-param name="name" select="'OBRNJENA_DAVCNA_OBVEZNOST'"/>
					</xsl:call-template>
				</xsl:variable>
				<xsl:variable name="STROSKOVNO_MESTO_RACUNA" select="GlavaRacuna/StroskovnoMesto" />

				<table width="800px" align="center" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<table width="100%" cellpadding="0" cellspacing="0">
								<tr>
									<td width="60%">
										<table width="100%" border="0" cellpadding="1" cellspacing="0">
											<tr>
												<td class="normal" width="27%"><b>NAROČNIK</b></td>
												<td width="73%"/>
											</tr>
											<tr>
												<td class="normal"><b>Naziv:</b></td>
												<td class="normal"><xsl:value-of select="$narocnik_naziv_1"/></td>
											</tr>
											<xsl:if test="string-length($narocnik_naziv_2) &gt; 0">
												<tr>
													<td/>
													<td class="normal"><xsl:value-of select="$narocnik_naziv_2"/></td>
												</tr>
											</xsl:if>
											<tr>
												<td class="normal"><b>Naslov:</b></td>
												<td class="normal"><xsl:value-of select="$narocnik_naslov_1"/></td>
											</tr>
											<xsl:if test="string-length($narocnik_naslov_2) &gt; 0">
												<tr>
													<td/>
													<td class="normal"><xsl:value-of select="$narocnik_naslov_2"/></td>
												</tr>
											</xsl:if>
											<tr>
												<td class="normal"><b>Poš. št. in kraj:</b></td>
												<td class="normal"><xsl:value-of select="$narocnik_posta_kraj"/></td>
											</tr>
											<tr>
												<td class="normal"><b>Država:</b></td>
												<td class="normal"><xsl:value-of select="$narocnik_drzava"/></td>
											</tr>
											<tr>
												<td colspan="2" height="5px"/>
											</tr>
											<tr>
												<xsl:choose>
													<xsl:when test="string-length($narocnik_davcna) &gt; 8"><td class="normal"><b>ID za DDV:</b></td></xsl:when>
													<xsl:when test="string-length($narocnik_davcna) &lt; 9"><td class="normal"><b>Davčna št.:</b></td></xsl:when>
												</xsl:choose>
												<td class="normal"><xsl:value-of select="$narocnik_davcna"/></td>
											</tr>
											<tr>
												<td class="normal"><b>Matična št.:</b></td>
												<td class="normal"><xsl:value-of select="$narocnik_maticna"/></td>
											</tr>
											<tr>
												<td class="normal"><b>BIC:</b></td>
												<td class="normal"><xsl:value-of select="$BIC_narocnik" /></td>
											</tr>
											<tr>
												<td class="normal"><b>IBAN:</b></td>
												<td class="normal">
													<xsl:value-of select="concat( substring($narocnik_trr,1,4), ' ',
												    substring($narocnik_trr,5,4), ' ',
												    substring($narocnik_trr,9,4), ' ',
												    substring($narocnik_trr,13,4),' ',
													substring($narocnik_trr,17,3))" />
												</td>
											</tr>
											<tr>
												<td/>
												<td class="normal"><xsl:value-of select="$narocnik_banka_1"/></td>
											</tr>
											<xsl:if test="string-length($narocnik_banka_2) &gt; 0">
												<tr>
													<td/>
													<td class="normal"><xsl:value-of select="$narocnik_banka_2"/></td>
												</tr>
											</xsl:if>
											<tr>
												<td colspan="2" height="5px"/>
											</tr>
											<tr>
												<td class="normal"><b>E-pošta:</b></td>
												<td class="normal"><xsl:value-of select="$narocnik_email"/></td>
											</tr>
											<tr>
												<td class="normal"><b>Tel:</b></td>
												<td class="normal"><xsl:value-of select="$narocnik_tel"/></td>
											</tr>
											<tr>
												<td class="normal"><b>Fax:</b></td>
												<td class="normal"><xsl:value-of select="$narocnik_fax"/></td>
											</tr>
											<tr>
												<td class="normal"><b>Kontaktna oseba:</b></td>
												<td class="normal"><xsl:value-of select="$narocnik_kontaktna_oseba"/></td>
											</tr>
											<tr>
												<td class="normal"><b>Šifra kupca:</b></td>
												<td class="normal"><xsl:value-of select="$narocnik_sifra"/></td>
											</tr>
										</table>
										<br/>
										<table width="100%" cellspacing="1" cellpadding="0">
											<tr>
												<td class="normal" colspan="2"><b>PREJEMNIK</b></td>
											</tr>
											<tr>
												<td width="40%" valign="top">
													<table width="100%" cellpadding="0" cellspacing="0">
														<tr>
															<td class="normal"><b>Naziv:</b></td>
															<td class="normal"><xsl:value-of select="$prejemnik_naziv_1"/></td>
														</tr>
														<xsl:if test="string-length($prejemnik_naziv_2) &gt; 0">
															<tr>
																<td/>
																<td class="normal"><xsl:value-of select="$prejemnik_naziv_2"/></td>
															</tr>
														</xsl:if>
														<tr>
															<td class="normal"><b>Naslov:</b></td>
															<td class="normal"><xsl:value-of select="$prejemnik_naslov_1"/></td>
														</tr>
														<xsl:if test="string-length($prejemnik_naslov_2) &gt; 0">
															<tr>
																<td/>
																<td class="normal"><xsl:value-of select="$prejemnik_naslov_2"/></td>
															</tr>
														</xsl:if>
														<tr>
															<td class="normal"><b>Poš. št. in kraj:</b></td>
															<td class="normal"><xsl:value-of select="$prejemnik_posta_kraj"/></td>
														</tr>
														<tr>
															<td class="normal"><b>Država:</b></td>
															<td class="normal"><xsl:value-of select="$prejemnik_drzava"/></td>
														</tr>
														<tr>
															<td colspan="2" height="5px"/>
														</tr>
														<tr>
															<xsl:choose>
																<xsl:when test="string-length($narocnik_davcna) &gt; 8"><td class="normal"><b>ID za DDV:</b></td></xsl:when>
																<xsl:when test="string-length($narocnik_davcna) &lt; 9"><td class="normal"><b>Davčna št.:</b></td></xsl:when>
															</xsl:choose>
															<td class="normal"><xsl:value-of select="$prejemnik_davcna"/></td>
														</tr>
														<tr>
															<td class="normal"><b>Matična št.:</b></td>
															<td class="normal"><xsl:value-of select="$prejemnik_maticna"/></td>
														</tr>
													</table>
												</td>

												<td width="60%" valign="top">
													<table width="100%" cellpadding="0" cellspacing="0">
														<tr>
															<td class="normal"><b>BIC:</b></td>
															<td class="normal"><xsl:value-of select="$BIC_prejemnik"/></td>
														</tr>
														<tr>
															<td class="normal"><b>IBAN:</b></td>
															<td class="normal">
																<xsl:value-of select="concat( substring($prejemnik_trr,1,4), ' ',
																substring($prejemnik_trr,5,4), ' ',
																substring($prejemnik_trr,9,4), ' ',
																substring($prejemnik_trr,13,4),' ',
																substring($prejemnik_trr,17,3))" />
															</td>
														</tr>
														<tr>
															<td/>
															<td class="normal"><xsl:value-of select="$prejemnik_banka_1"/></td>
														</tr>
														<xsl:if test="string-length($prejemnik_banka_2) &gt; 0">
															<tr>
																<td/>
																<td class="normal"><xsl:value-of select="$prejemnik_banka_2"/></td>
															</tr>
														</xsl:if>
														<tr>
															<td colspan="2" height="5px"/>
														</tr>
														<tr>
															<td class="normal"><b>Tel:</b></td>
															<td class="normal"><xsl:value-of select="$prejemnik_tel"/></td>
														</tr>
														<tr>
															<td class="normal"><b>Fax:</b></td>
															<td class="normal"><xsl:value-of select="$prejemnik_fax"/></td>
														</tr>
														<tr>
															<td class="normal"><b>Kontaktna oseba:</b></td>
															<td class="normal"><xsl:value-of select="$prejemnik_kontaktna_oseba"/></td>
														</tr>
													</table>
												</td>
											</tr>
										</table>
									</td>
									<td width="5%"/>
									<td width="35%" valign="top">
										<table width="100%" border="0" cellpadding="1" cellspacing="0">
											<tr>
												<td colspan="2" align="right" valign="top"><img alt="SETCCE_logo.jpg" src="http://public.setcce.si/eSlogPrirocnik/SETCCE_logo.jpg"/></td>
											</tr>
											<tr>
												<td height="20px"/>
											</tr>
											<tr>
												<td class="normal" width="40%"><b>IZDAJATELJ</b></td>
												<td width="60%"/>
											</tr>
											<tr>
												<td class="normal"><b>Naziv:</b></td>
												<td class="normal"><xsl:value-of select="$izdajatelj_naziv_1"/></td>
											</tr>
											<xsl:if test="string-length($izdajatelj_naziv_2) &gt; 0">
												<tr>
													<td/>
													<td class="normal"><xsl:value-of select="$izdajatelj_naziv_2"/></td>
												</tr>
											</xsl:if>
											<tr>
												<td class="normal"><b>Naslov:</b></td>
												<td class="normal"><xsl:value-of select="$izdajatelj_naslov_1"/></td>
											</tr>
											<xsl:if test="string-length($izdajatelj_naslov_2) &gt; 0">
												<tr>
													<td/>
													<td class="normal"><xsl:value-of select="$izdajatelj_naslov_2"/></td>
												</tr>
											</xsl:if>
											<tr>
												<td class="normal"><b>Poš. št. in kraj:</b></td>
												<td class="normal"><xsl:value-of select="$izdajatelj_posta_kraj"/></td>
											</tr>
											<tr>
												<td class="normal"><b>Država:</b></td>
												<td class="normal"><xsl:value-of select="$izdajatelj_drzava"/></td>
											</tr>
											<tr>
												<td colspan="2" height="5px"/>
											</tr>
											<tr>
												<xsl:choose>
													<xsl:when test="string-length($narocnik_davcna) &gt; 8"><td class="normal"><b>ID za DDV:</b></td></xsl:when>
													<xsl:when test="string-length($narocnik_davcna) &lt; 9"><td class="normal"><b>Davčna št.:</b></td></xsl:when>
												</xsl:choose>
												<td class="normal"><xsl:value-of select="$izdajatelj_davcna"/></td>
											</tr>
											<tr>
												<td class="normal"><b>Matična št.:</b></td>
												<td class="normal"><xsl:value-of select="$izdajatelj_maticna"/></td>
											</tr>
											<tr>
												<td class="normal"><b>BIC:</b></td>
												<td class="normal"><xsl:value-of select="$BIC_izdajatelj"/></td>
											</tr>
											<tr>
												<td class="normal"><b>IBAN:</b></td>
												<td class="normal">
													<xsl:value-of select="concat( substring($izdajatelj_trr,1,4), ' ',
												    substring($izdajatelj_trr,5,4), ' ',
												    substring($izdajatelj_trr,9,4), ' ',
												    substring($izdajatelj_trr,13,4),' ',
													substring($izdajatelj_trr,17,3))" />
												</td>
											</tr>
											<tr>
												<td/>
												<td class="normal"><xsl:value-of select="$izdajatelj_banka_1"/></td>
											</tr>
											<xsl:if test="string-length($izdajatelj_banka_2) &gt; 0">
												<tr>
													<td/>
													<td class="normal"><xsl:value-of select="$izdajatelj_banka_2"/></td>
												</tr>
											</xsl:if>
											<tr>
												<td colspan="2" height="5px"/>
											</tr>
											<tr>
												<td class="normal"><b>Tel:</b></td>
												<td class="normal"><xsl:value-of select="$izdajatelj_tel"/></td>
											</tr>
											<tr>
												<td class="normal"><b>Fax:</b></td>
												<td class="normal"><xsl:value-of select="$izdajatelj_fax"/></td>
											</tr>
											<tr>
												<td class="normal"><b>Kontaktna oseba:</b></td>
												<td class="normal"><xsl:value-of select="$izdajatelj_kontaktna_oseba"/></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td height="50px"/>
					</tr>
					<tr>
						<td>
							<table width="100%" cellpadding="0" cellspacing="0">
								<tr>
									<td colspan="2" class="big" style="border-bottom: 1px solid black;"><b>Številka računa: <xsl:value-of select="$STEVILKA_RACUNA"/></b></td>
								</tr>
								<tr>
									<td width="70%" valign="top">
										<table width="100%" cellpadding="0" cellspacing="0">
											<tr>
												<td height="5px"/>
											</tr>

											<tr>
												<td class="normal"><b>Naslov računa:</b></td>
												<td class="normal"><xsl:value-of select="$NASLOV_RACUNA"/></td>
											</tr>
											<tr>
												<td class="normal"><b>Obdobje opr. storitve:</b></td>
												<td class="normal"><xsl:value-of select="concat($OPIS_OBDOBJA, ' ', $obdobje_od, ' - ', $obdobje_do)"/></td>
											</tr>
											<xsl:if test="$GLAVA_TEKST">
												<tr>
													<td height="5px"/>
												</tr>
												<xsl:for-each select="$GLAVA_TEKST">
													<tr>
														<td class="normal" colspan="2">
															<xsl:call-template name="ConcatBesedilo">
																<xsl:with-param name="besedilo" select="."/>
															</xsl:call-template>
														</td>
													</tr>
												</xsl:for-each>
											</xsl:if>
											<xsl:if test="$referencni_dokumenti">
												<tr>
													<td height="5px"/>
												</tr>
												<tr>
													<td class="normal" valign="top">
														<b>Referenčni dokumenti:</b>
													</td>
													<td class="normal" valign="top">
														<xsl:for-each select="$referencni_dokumenti">
															<xsl:if test="@VrstaDokumenta='ON'">Naročilnica, </xsl:if>
															<xsl:if test="@VrstaDokumenta='CT'">Pogodba, </xsl:if>
															<xsl:if test="@VrstaDokumenta='AAK'">Dobavnica, </xsl:if>
															<xsl:value-of select="StevilkaDokumenta"/> z dne
															<xsl:call-template name="format_date">
																<xsl:with-param name="date" select="DatumDokumenta"/>
															</xsl:call-template>
															<br/>
														</xsl:for-each>
													</td>
												</tr>
											</xsl:if>
										</table>
									</td>
									<td width="30%" valign="top">
										<table width="100%" cellpadding="0" cellspacing="0">
											<tr>
												<td width="40%" class="normal"><b>Valuta:</b></td>
												<td width="60%" class="normal"><xsl:value-of select="$valuta"/></td>
											</tr>
											<tr>
												<td width="40%" class="normal"><b>Kraj izdaje:</b></td>
												<td width="60%" class="normal"><xsl:value-of select="$kraj_izdaje"/></td>
											</tr>
											<tr>
												<td width="40%" class="normal"><b>Datum izdaje:</b></td>
												<td width="60%" class="normal">
													<xsl:call-template name="format_date">
														<xsl:with-param name="date" select="$datum_izdaje"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td width="40%" class="normal"><b>Datum zapadlosti:</b></td>
												<td width="60%" class="normal">
													<xsl:call-template name="format_date">
														<xsl:with-param name="date" select="$rok_placila"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td width="40%" class="normal"><b>Datum storitve:</b></td>
												<td width="60%" class="normal">
													<xsl:call-template name="format_date">
														<xsl:with-param name="date" select="$datum_storitve"/>
													</xsl:call-template>
												</td>
											</tr>
											<tr>
												<td width="40%" class="normal"><b>Sklic:</b></td>
												<td width="60%" class="normal">
													<xsl:value-of select="$sklic"/>
												</td>
											</tr>
											<tr>
												<td width="40%" class="normal"><b>Koda namena:</b></td>
												<td width="60%" class="normal">
													<xsl:value-of  select="GlavaRacuna/KodaNamena"/>
												</td>
											</tr>
											<tr>
												<td width="40%" class="normal" valign="top"><b>Način plačila:</b></td>
												<td width="60%" class="normal">
													<xsl:if test="$NACIN_PLACILA = '0'">Račun je potrebno plačati</xsl:if>
													<xsl:if test="$NACIN_PLACILA = '1'">Račun bo plačan preko direktne obremenitve in ga ni potrebno plačati</xsl:if>
													<xsl:if test="$NACIN_PLACILA = '2'">Račun je bil že plačan</xsl:if>
													<xsl:if test="$NACIN_PLACILA = '3'">Drugo/ni možnosti plačila</xsl:if>
												</td>
											</tr>
											<tr>
												<td width="40%" class="normal"><b>Stroškovno mesto:</b></td>
												<td width="60%" class="normal"><xsl:value-of select="$STROSKOVNO_MESTO_RACUNA"/></td>
											</tr>
											<tr>
												<td width="40%" class="normal"><b>Obrnjena davčna vrednost:</b></td>
												<td width="60%" class="normal">
													<xsl:choose>
														<xsl:when test="$obrnjena_davcna_vrednost='true'">da</xsl:when>
														<xsl:otherwise>ne</xsl:otherwise>
													</xsl:choose>
												</td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td height="30px"/>
					</tr>
					<tr>
						<td>
							<table cellpadding="2" cellspacing="0" style="border: 1px solid black;">
								<tr>
									<td class="normal" valign="top" style="border-right: 1px solid black; border-bottom: 1px solid black;" width="3%"><b>Zap. št.</b></td>
									<td class="normal" valign="top" style="border-right: 1px solid black; border-bottom: 1px solid black;" width="12%"><b>Oznaka</b></td>
									<td class="normal" valign="top" style="border-right: 1px solid black; border-bottom: 1px solid black;" width="15%"><b>Opis</b></td>
									<td class="normal" valign="top" style="border-right: 1px solid black; border-bottom: 1px solid black;" width="7%"><b>Količina</b></td>
									<td class="normal" valign="top" style="border-right: 1px solid black; border-bottom: 1px solid black;" width="8%"><b>Enota mere</b></td>
									<td class="normal" valign="top" style="border-right: 1px solid black; border-bottom: 1px solid black;" width="9%"><b>Cena</b></td>
									<td class="normal" valign="top" style="border-right: 1px solid black; border-bottom: 1px solid black;" width="9%"><b>Vrednost</b></td>
									<td class="normal" valign="top" style="border-right: 1px solid black; border-bottom: 1px solid black;" width="9%"><b>Znesek popusta</b></td>
									<td class="normal" valign="top" style="border-right: 1px solid black; border-bottom: 1px solid black;" width="9%"><b>Davčna stop. (%)</b></td>
									<td class="normal" valign="top" style="border-right: 1px solid black; border-bottom: 1px solid black;" width="9%"><b>DDV</b></td>
									<td class="normal" valign="top" style=" border-bottom: 1px solid black;" width="9%"><b>Osnova za DDV</b></td>
								</tr>
								<tr>
									<td class="normal" valign="top" style="border-right: 1px solid black; border-bottom: 1px solid black;">&#160;</td>
									<td class="normal" valign="top" style="border-right: 1px solid black; border-bottom: 1px solid black;">&#160;</td>
									<td class="normal" valign="top" style="border-right: 1px solid black; border-bottom: 1px solid black;"><b>Obdobje dobave</b></td>
									<td class="normal" valign="top" style="border-right: 1px solid black; border-bottom: 1px solid black;"><b>Str. mesto</b></td>
									<td class="normal" valign="top" style="border-right: 1px solid black; border-bottom: 1px solid black;"><b>Dodaten opis EM</b></td>
									<td class="normal" valign="top" style="border-right: 1px solid black; border-bottom: 1px solid black;">&#160;</td>
									<td class="normal" valign="top" style="border-right: 1px solid black; border-bottom: 1px solid black;">&#160;</td>
									<td class="normal" valign="top" style="border-right: 1px solid black; border-bottom: 1px solid black;"><b>Popust(%)</b></td>
									<td class="normal" valign="top" style="border-right: 1px solid black; border-bottom: 1px solid black;">&#160;</td>
									<td class="normal" valign="top" style="border-right: 1px solid black; border-bottom: 1px solid black;">&#160;</td>
									<td class="normal" valign="top" style="border-bottom: 1px solid black;"><b>Skupaj</b></td>
								</tr>
								<tr>
									<td class="normal" style="border-right: 1px solid black; border-bottom: 1px solid black;">&#160;</td>
									<td colspan="5" class="normal" valign="top" style="border-bottom: 1px solid black; border-right: 1px solid black;"><b>Referenčni dokumenti</b></td>
									<td colspan="5" class="normal" valign="top" style="border-bottom: 1px solid black;"><b>Subjekti</b></td>
								</tr>
								<xsl:for-each select="PostavkeRacuna">
									<xsl:variable name="st_vrstice" select="Postavka/StevilkaVrstice"/>
									<xsl:variable name="koda" select="DodatnaIdentifikacijaArtikla/StevilkaArtiklaDodatna"/>
									<xsl:variable name="opis">
										<xsl:for-each select="OpisiArtiklov[KodaOpisaArtikla]/OpisArtikla">
											<xsl:value-of select="concat(OpisArtikla1, OpisArtikla2)"/>
										</xsl:for-each>
									</xsl:variable>
									<xsl:variable name="kolicina" select="format-number(KolicinaArtikla/Kolicina, '###.###.##0,##', 'dec')"/>
									<xsl:variable name="enota_mere" select="KolicinaArtikla/EnotaMere"/>
									<xsl:variable name="cena" select="format-number(CenaPostavke/Cena, '###.###.##0,00', 'dec')"/>
									<xsl:variable name="vrednost" select="format-number(ZneskiPostavke[VrstaZneskaPostavke='203']/ZnesekPostavke, '###.###.##0,00', 'dec')"/>
									<xsl:variable name="koncna_vrednost" select="format-number(ZneskiPostavke[VrstaZneskaPostavke='38']/ZnesekPostavke, '###.###.##0,00', 'dec')"/>
									<xsl:variable name="popust_znesek">
										<xsl:for-each select="OdstotkiPostavk[VrstaZneskaOdstotka='204']">
											<xsl:if test="position()=1">
												<xsl:value-of select="format-number(ZnesekOdstotka, '###.###.##0,00', 'dec')"/>
											</xsl:if>
										</xsl:for-each>
									</xsl:variable>
									<xsl:variable name="globalni_popust">
										<xsl:for-each select="OdstotkiPostavk[VrstaZneskaOdstotka='204']">
											<xsl:if test="position()=2">
												<xsl:value-of select="format-number(ZnesekOdstotka, '###.###.##0,00', 'dec')"/>
											</xsl:if>
										</xsl:for-each>
									</xsl:variable>
									<xsl:variable name="stopnja_ddv">
										<xsl:choose>
											<xsl:when test="DavkiPostavke/DavkiNaPostavki/OdstotekDavkaPostavke">
												<xsl:value-of select="format-number(DavkiPostavke/DavkiNaPostavki/OdstotekDavkaPostavke, '###.###.##0,##', 'dec')"/>
											</xsl:when>
											<xsl:otherwise>ne obdav.</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<xsl:variable name="osnova_ddv">
										<xsl:if test="DavkiPostavke[DavkiNaPostavki]/ZneskiDavkovPostavke[VrstaZneskaDavkaPostavke='125']/Znesek">
											<xsl:value-of select="format-number(DavkiPostavke/ZneskiDavkovPostavke[VrstaZneskaDavkaPostavke='125']/Znesek, '###.###.##0,00', 'dec')"/>
										</xsl:if>
									</xsl:variable>
									<xsl:variable name="ddv">
										<xsl:if test="DavkiPostavke[DavkiNaPostavki]/ZneskiDavkovPostavke[VrstaZneskaDavkaPostavke='124']/Znesek">
											<xsl:value-of select="format-number(DavkiPostavke/ZneskiDavkovPostavke[VrstaZneskaDavkaPostavke='124']/Znesek, '###.###.##0,00', 'dec')"/>
										</xsl:if>
									</xsl:variable>
									<xsl:variable name="OPIS_ENOTE_MERE">
										<xsl:call-template name="PostavkaParameter">
											<xsl:with-param name="name" select="'OPIS_ENOTE_MERE'"/>
										</xsl:call-template>
									</xsl:variable>
									<xsl:variable name="popust_procent">
										<xsl:if test="OdstotkiPostavk/OdstotekPostavke">
											<xsl:value-of select="concat(format-number(OdstotkiPostavk/OdstotekPostavke, '###.###.##0,##', 'dec'), '%')"/>
										</xsl:if>
									</xsl:variable>
									<xsl:variable name="postavka_navadna" select="OpisiArtiklov[not(KodaOpisaArtikla)]/OpisArtikla[OpisArtikla1 = 'OZNAKA_POSTAVKE']/OpisArtikla2='navadna'"/>
									<xsl:variable name="postavka_opisna" select="OpisiArtiklov[not(KodaOpisaArtikla)]/OpisArtikla[OpisArtikla1 = 'OZNAKA_POSTAVKE']/OpisArtikla2='opisna'"/>
									<xsl:variable name="postavka_obresti" select="OpisiArtiklov[not(KodaOpisaArtikla)]/OpisArtikla[OpisArtikla1 = 'OZNAKA_POSTAVKE']/OpisArtikla2='obresti'"/>
									<xsl:variable name="postavka_soudelezba" select="OpisiArtiklov[not(KodaOpisaArtikla)]/OpisArtikla[OpisArtikla1 = 'OZNAKA_POSTAVKE']/OpisArtikla2='soudelezba'"/>
									<xsl:if test="$postavka_opisna">
										<tr>
											<td style="border-bottom: 1px solid gray;">&#160;</td>
											<td colspan="10" class="normal" style="border-bottom: 1px solid gray;"><b><xsl:value-of select="$opis"/></b></td>
										</tr>
									</xsl:if>
									<xsl:if test="$postavka_navadna or $postavka_soudelezba or $postavka_obresti">
										<tr>
											<td class="normal" valign="top"><xsl:value-of select="$st_vrstice"/></td>
											<td class="normal" valign="top"><xsl:value-of select="$koda"/></td>
											<td class="normal" valign="top"><xsl:value-of select="$opis"/></td>
											<td class="normal" valign="top" align="right"><xsl:value-of select="$kolicina"/></td>
											<td class="normal" valign="top" align="center"><xsl:value-of select="$enota_mere"/></td>
											<td class="normal" valign="top" align="right"><xsl:value-of select="$cena"/></td>
											<td class="normal" valign="top" align="right"><xsl:value-of select="$vrednost"/></td>
											<td class="normal" valign="top" align="right"><xsl:value-of select="$popust_znesek"/></td>
											<td class="normal" valign="top" align="right"><xsl:value-of select="$stopnja_ddv"/></td>
											<td class="normal" valign="top" align="right"><xsl:value-of select="$ddv"/></td>
											<td class="normal" valign="top" align="right"><xsl:value-of select="$osnova_ddv"/></td>
										</tr>
										<tr>
											<td/>
											<td class="normal" valign="top">&#160;</td>
											<td class="normal" valign="top"><xsl:value-of select="ObdobjeDobave"/>&#160;</td>
											<td class="normal" valign="top" align="right">&#160;<xsl:value-of select="StroskovnoMesto"/></td>
											<td class="normal" valign="top" align="center"><xsl:value-of select="$OPIS_ENOTE_MERE"/></td>
											<td/>
											<td/>
											<td class="normal" valign="top" align="right"><xsl:value-of select="$popust_procent"/></td>
											<td/>
											<td />
											<td class="normal" valign="top" align="right"><xsl:value-of select="$koncna_vrednost"/></td>
										</tr>
										<tr>
											<td class="normal" valign="top" style="border-bottom: 1px solid gray;">&#160;</td>
											<td colspan="5" valign="top" style="border-bottom: 1px solid gray;">
											<xsl:choose>
												<xsl:when test="ReferencniDokumentiPostavke">
													<xsl:apply-templates select="ReferencniDokumentiPostavke"/>
												</xsl:when>
												<xsl:otherwise>&#160;</xsl:otherwise>
											</xsl:choose>
											</td>
											<td colspan="5" valign="top" style="border-bottom: 1px solid gray;">
												<xsl:call-template name="SubjektiPostavka" />
											</td>
										</tr>
									</xsl:if>

								</xsl:for-each>
							</table>
						</td>
					</tr>
					<tr>
						<td height="40px"/>
					</tr>
					<tr>
						<td>
							<table width="100%" cellpadding="0" cellspacing="0" border="0">
								<tr>
									<td width="60%">
										<table width="100%" cellpadding="0" cellspacing="0" border="0">
											<tr>
												<td width="22%" class="normal" align="right" style="border-bottom: 1px solid black;"><b>Stopnja DDV</b></td>
												<td width="22%" class="normal" align="right" style="border-bottom: 1px solid black;"><b>Osnova za DDV</b></td>
												<td width="22%" class="normal" align="right" style="border-bottom: 1px solid black;"><b>Vrednost DDV</b></td>
												<td width="12%"/>
											</tr>
											<xsl:for-each select="PovzetekDavkovRacuna">
												<xsl:variable name="pddv_stopnja" select="format-number(DavkiRacuna/OdstotekDavka, '###.###.##0,##', 'dec')"/>
												<xsl:variable name="pddv_osnova" select="format-number(ZneskiDavkov[VrstaZneskaDavka='125']/ZnesekDavka, '###.###.##0,00', 'dec')"/>
												<xsl:variable name="pddv" select="format-number(ZneskiDavkov[VrstaZneskaDavka='124']/ZnesekDavka, '###.###.##0,00', 'dec')"/>
												<xsl:choose>
													<xsl:when test="DavkiRacuna/VrstaDavka">
														<tr>
															<td class="normal" align="right"><xsl:value-of select="$pddv_stopnja"/></td>
															<td class="normal" align="right"><xsl:value-of select="$pddv_osnova"/></td>
															<td class="normal" align="right"><xsl:value-of select="$pddv"/></td>
														</tr>
													</xsl:when>
													<xsl:otherwise>
														<tr>
															<td class="normal" align="right">neobdavčeno</td>
															<td class="normal" align="right"><xsl:value-of select="$pddv_osnova"/></td>
														</tr>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:for-each>
											<tr>
												<td colspan="5" height="15px"/>
											</tr>
											<xsl:for-each select="PoljubnoBesedilo/Besedilo[Tekst1='DAVCNI_TEKST']">
												<tr>
													<td colspan="5" class="normal"><xsl:value-of select="concat(Tekst2, Tekst3, Tekst4, Tekst5)"/></td>
												</tr>
											</xsl:for-each>
											<tr>
												<td colspan="5" height="30px"/>
											</tr>
											<xsl:for-each select="PoljubnoBesedilo/Besedilo[Tekst1='DODATNI_TEKST']">
												<tr>
													<td colspan="5" class="normal"><xsl:value-of select="concat(Tekst2, Tekst3, Tekst4, Tekst5)"/></td>
												</tr>
											</xsl:for-each>

											<tr>
												<td colspan="5" height="15px"/>
											</tr>
											<tr>
												<td class="normal" colspan="5"><b>Fakturist: </b><xsl:value-of select="$FAKTURIST"/></td>
											</tr>
										</table>
									</td>
									<td width="10%"/>
									<td width="30%" valign="top">
										<xsl:variable name="zneski_vrednost" select="PovzetekZneskovRacuna/ZneskiRacuna[VrstaZneska='79']/ZnesekRacuna"/>
										<xsl:variable name="zneski_popust" select="PovzetekZneskovRacuna/ZneskiRacuna[VrstaZneska='53']/ZnesekRacuna"/>
										<xsl:variable name="zneski_osnovaDDV" select="PovzetekZneskovRacuna/ZneskiRacuna[VrstaZneska='125']/ZnesekRacuna"/>
										<xsl:variable name="zneski_vrednostDDV" select="PovzetekZneskovRacuna/ZneskiRacuna[VrstaZneska='176']/ZnesekRacuna"/>
										<xsl:variable name="neobdavceno" select="PovzetekDavkovRacuna[not(DavkiRacuna/VrstaDavka)]/ZneskiDavkov[VrstaZneskaDavka='125']/ZnesekDavka"/>
										<xsl:variable name="zneski_vrednostZDDV" select="PovzetekZneskovRacuna/ZneskiRacuna[VrstaZneska='86']/ZnesekRacuna"/>
										<xsl:variable name="znesek_zamudneObr" select="PovzetekZneskovRacuna/ZneskiRacuna[VrstaZneska='131']/ZnesekRacuna"/>
										<xsl:variable name="znesek_dobropis" select="PovzetekZneskovRacuna/ZneskiRacuna[VrstaZneska='113']/ZnesekRacuna"/>
										<xsl:variable name="znesek_izravnava" select="PovzetekZneskovRacuna/ZneskiRacuna[VrstaZneska='165']/ZnesekRacuna"/>
										<xsl:variable name="znesek_zaPlacilo" select="PovzetekZneskovRacuna/ZneskiRacuna[VrstaZneska='9']/ZnesekRacuna"/>
										<xsl:variable name="globalni_popusti" select="GlobalniPopusti/ZnesekPopusta"/>

										<table width="100%" cellpadding="3" cellspacing="0" border="0">
											<xsl:if test="string-length($zneski_vrednost) &gt; 0">
												<tr>
													<td class="normal"><b>Vrednost postavk</b></td>
													<td class="normal" align="right"><xsl:value-of select="format-number($zneski_vrednost, '###.###.##0,00', 'dec')"/></td>
												</tr>
											</xsl:if>
											<xsl:if test="string-length($zneski_popust) &gt; 0">
												<tr>
													<td class="normal"><b>Vsota popustov</b></td>
													<td class="normal" align="right"><xsl:value-of select="format-number($zneski_popust, '###.###.##0,00', 'dec')"/></td>
												</tr>
											</xsl:if>
											<xsl:if test="string-length($zneski_osnovaDDV) &gt; 0">
												<tr>
													<td class="normal"><b><xsl:value-of select="concat(GlobalniPopusti/OpisPopusta,'(', GlobalniPopusti/TipPopusta, ' - ', GlobalniPopusti/OdstotekPopusta, '%)')"/></b></td>
													<td class="normal" align="right"><xsl:value-of select="format-number($globalni_popusti, '###.###.##0,00', 'dec')"/></td>
												</tr>
											</xsl:if>
											<xsl:if test="string-length($zneski_osnovaDDV) &gt; 0">
												<tr>
													<td class="normal"><b>Osnova za DDV</b></td>
													<td class="normal" align="right"><xsl:value-of select="format-number($zneski_osnovaDDV, '###.###.##0,00', 'dec')"/></td>
												</tr>
											</xsl:if>
											<xsl:if test="string-length($neobdavceno) &gt; 0">
												<tr>
													<td class="normal"><b>Neobdavčeno</b></td>
													<td class="normal" align="right"><xsl:value-of select="format-number($neobdavceno, '###.###.##0,00', 'dec')"/></td>
												</tr>
											</xsl:if>
											<xsl:if test="string-length($zneski_vrednostDDV) &gt; 0">
												<tr>
													<td class="normal"><b>Vsota zneskov DDV</b></td>
													<td class="normal" align="right"><xsl:value-of select="format-number($zneski_vrednostDDV, '###.###.##0,00', 'dec')"/></td>
												</tr>
											</xsl:if>
											<xsl:if test="string-length($zneski_vrednostZDDV) &gt; 0">
												<tr>
													<td class="normal"><b>Vsota s popusti in davki</b></td>
													<td class="normal" align="right"><xsl:value-of select="format-number($zneski_vrednostZDDV, '###.###.##0,00', 'dec')"/></td>
												</tr>
											</xsl:if>
											<xsl:if test="string-length($znesek_zamudneObr) &gt; 0">
												<tr>
													<td class="normal"><b>Zamudne obresti</b></td>
													<td class="normal" align="right"><xsl:value-of select="format-number($znesek_zamudneObr, '###.###.##0,00', 'dec')"/></td>
												</tr>
											</xsl:if>
											<xsl:if test="string-length($znesek_dobropis) &gt; 0">
												<tr>
													<td class="normal"><b>Predplačilo</b></td>
													<td class="normal" align="right"><xsl:value-of select="format-number($znesek_dobropis, '###.###.##0,00', 'dec')"/></td>
												</tr>
											</xsl:if>
											<xsl:if test="string-length($znesek_izravnava) &gt; 0">
												<tr>
													<td class="normal"><b>Izravnava</b></td>
													<td class="normal" align="right"><xsl:value-of select="format-number($znesek_izravnava, '###.###.##0,00', 'dec')"/></td>
												</tr>
											</xsl:if>
											<tr>
												<td class="normal" style="border-top: 1px solid black; border-bottom: 1px solid black;"><b>Za plačilo</b></td>
												<td class="normal" style="border-top: 1px solid black; border-bottom: 1px solid black;" align="right"><xsl:value-of select="format-number($znesek_zaPlacilo, '###.###.##0,00', 'dec')"/></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td height="40px"/>
					</tr>
					<tr>
						<td class="bsmall" align="center">
							<xsl:for-each select="PoljubnoBesedilo/Besedilo[Tekst1='NOGA_TEKST']">
								<xsl:value-of select="concat(Tekst2, Tekst3, Tekst4, Tekst5)"/><br/>
							</xsl:for-each>
						</td>
					</tr>
					<tr>
						<td height="15px"/>
					</tr>
					<tr>
						<td style="border-top: 1px solid gray; color: gray;" class="small" align="center">SETCCE vizualizacija E-SLOG računa, skladna s priročnikom ESLOG 1_6 verzije 2012/1_4, &#169;2012 SETCCE, vse pravice pridržane.</td>
					</tr>
				</table>
			</body>
		</html>
	</xsl:template>

	<xsl:template name="Parameter">
		<xsl:param name="name"/>
		<xsl:for-each select="PoljubnoBesedilo/Besedilo[Tekst1 = $name]">
			<xsl:value-of select="concat(Tekst2, Tekst3, Tekst4, Tekst5)"/>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="PostavkaParameter">
		<xsl:param name="name"/>
		<!--<xsl:if test="$name=ObdobjeDobave">
			<xsl:value-of select="PostavkeRacuna/ObdobjeDobave"/>
		</xsl:if>
		<xsl:if test="$name=StroskovnoMesto">
			<xsl:value-of select="PostavkeRacuna/StroskovnoMesto"/>
		</xsl:if> -->
		<xsl:for-each select="OpisiArtiklov[not(KodaOpisaArtikla)]/OpisArtikla[OpisArtikla1 = $name]">
			<xsl:value-of select="OpisArtikla2"/>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="Besedilo">
		<xsl:param name="besedilo"/>
		<xsl:value-of select="concat($besedilo/Tekst1, $besedilo/Tekst2, $besedilo/Tekst3, $besedilo/Tekst4, $besedilo/Tekst5)"/>
	</xsl:template>

	<xsl:template name="format_date">
		<xsl:param name="date"/>
		<xsl:value-of select="concat(substring($date, 9, 2), '.', substring($date, 6, 2), '.', substring($date, 1, 4))"/>
	</xsl:template>

	<xsl:template name="ConcatBesedilo">
		<xsl:param name="besedilo"/>
		<xsl:value-of select="concat($besedilo/Tekst2, $besedilo/Tekst3, $besedilo/Tekst4, $besedilo/Tekst5)"/>
	</xsl:template>

	<xsl:template match="ReferencniDokumentiPostavke">
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
			<xsl:variable name="tip" select="VrstaDokumentaPostavke"/>
			<xsl:if test="$tip='ON'">
				<tr>
					<td class="normal">
						<xsl:variable name="date" select="DatumDokumenta" />
						<xsl:value-of select="concat('Št. naročilnice: ',StevilkaDokumentaPostavke,' ', concat(substring($date, 9, 2), '.', substring($date, 6, 2), '.', substring($date, 1, 4)))"/>
						<xsl:if test="../OpisiArtiklov/OpisArtikla[OpisArtikla1='DATUM_DOKUMENTA_ON']">
							&#160;&#160;<xsl:value-of select="concat('Datum: ', ../OpisiArtiklov/OpisArtikla[OpisArtikla1='DATUM_DOKUMENTA_ON']/OpisArtikla2)"/>
						</xsl:if>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="$tip='AAK'">
				<tr>
					<td class="normal">
						<xsl:value-of select="concat('Št. dobavnice: ',StevilkaDokumentaPostavke)"/>
						<xsl:if test="../OpisiArtiklov/OpisArtikla[OpisArtikla1='DATUM_DOKUMENTA_AAK']">
							&#160;&#160;<xsl:value-of select="concat('Datum: ', ../OpisiArtiklov/OpisArtikla[OpisArtikla1='DATUM_DOKUMENTA_AAK']/OpisArtikla2)"/>
						</xsl:if>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="$tip='AAB'">
				<tr>
					<td class="normal">
						<xsl:value-of select="concat('Št. predračuna: ',StevilkaDokumentaPostavke)"/>
						<xsl:if test="../OpisiArtiklov/OpisArtikla[OpisArtikla1='DATUM_DOKUMENTA_AAB']">
							&#160;&#160;<xsl:value-of select="concat('Datum: ', ../OpisiArtiklov/OpisArtikla[OpisArtikla1='DATUM_DOKUMENTA_AAB']/OpisArtikla2)"/>
						</xsl:if>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="$tip='VN'">
				<tr>
					<td class="normal">
						<xsl:value-of select="concat('Št. naročilnice dobavitelja: ',StevilkaDokumentaPostavke)"/>
						<xsl:if test="../OpisiArtiklov/OpisArtikla[OpisArtikla1='DATUM_DOKUMENTA_VN']">
							&#160;&#160;<xsl:value-of select="concat('Datum: ', ../OpisiArtiklov/OpisArtikla[OpisArtikla1='DATUM_DOKUMENTA_VN']/OpisArtikla2)"/>
						</xsl:if>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="$tip='DL'">
				<tr>
					<td class="normal">
						<xsl:value-of select="concat('Št. bremepisa: ',StevilkaDokumentaPostavke)"/>
						<xsl:if test="../OpisiArtiklov/OpisArtikla[OpisArtikla1='DATUM_DOKUMENTA_DL']">
							&#160;&#160;<xsl:value-of select="concat('Datum: ', ../OpisiArtiklov/OpisArtikla[OpisArtikla1='DATUM_DOKUMENTA_DL']/OpisArtikla2)"/>
						</xsl:if>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="$tip='CD'">
				<tr>
					<td class="normal">
						<xsl:value-of select="concat('Št. dobropisa: ',StevilkaDokumentaPostavke)"/>
						<xsl:if test="../OpisiArtiklov/OpisArtikla[OpisArtikla1='DATUM_DOKUMENTA_CD']">
							&#160;&#160;<xsl:value-of select="concat('Datum: ', ../OpisiArtiklov/OpisArtikla[OpisArtikla1='DATUM_DOKUMENTA_CD']/OpisArtikla2)"/>
						</xsl:if>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="$tip='IV'">
				<tr>
					<td class="normal">
						<xsl:value-of select="concat('Št. računa: ',StevilkaDokumentaPostavke)"/>
						<xsl:if test="../OpisiArtiklov/OpisArtikla[OpisArtikla1='DATUM_DOKUMENTA_IV']">
							&#160;&#160;<xsl:value-of select="concat('Datum: ', ../OpisiArtiklov/OpisArtikla[OpisArtikla1='DATUM_DOKUMENTA_IV']/OpisArtikla2)"/>
						</xsl:if>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="$tip='CT'">
				<tr>
					<td class="normal">
						<xsl:value-of select="concat('Št. pogodbe: ',StevilkaDokumentaPostavke)"/>
						<xsl:if test="../OpisiArtiklov/OpisArtikla[OpisArtikla1='DATUM_DOKUMENTA_CT']">
							&#160;&#160;<xsl:value-of select="concat('Datum: ', ../OpisiArtiklov/OpisArtikla[OpisArtikla1='DATUM_DOKUMENTA_CT']/OpisArtikla2)"/>
						</xsl:if>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="$tip='DQ'">
				<tr>
					<td class="normal">
						<xsl:value-of select="concat('Št. vračila: ',StevilkaDokumentaPostavke)"/>
						<xsl:if test="../OpisiArtiklov/OpisArtikla[OpisArtikla1='DATUM_DOKUMENTA_DQ']">
							&#160;&#160;<xsl:value-of select="concat('Datum: ', ../OpisiArtiklov/OpisArtikla[OpisArtikla1='DATUM_DOKUMENTA_DQ']/OpisArtikla2)"/>
						</xsl:if>
					</td>
				</tr>
			</xsl:if>
			<xsl:if test="$tip='VAT'">
				<tr>
					<td class="normal">
						<xsl:value-of select="concat('Št. vračila: ',StevilkaDokumentaPostavke)"/>
						<xsl:if test="../OpisiArtiklov/OpisArtikla[OpisArtikla1='DATUM_DOKUMENTA_VAT']">
							&#160;&#160;<xsl:value-of select="concat('Datum: ', ../OpisiArtiklov/OpisArtikla[OpisArtikla1='DATUM_DOKUMENTA_VAT']/OpisArtikla2)"/>
						</xsl:if>
					</td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>

	<xsl:template name="SubjektiPostavka">
		<xsl:variable name="prejemnik" select="OpisiArtiklov/OpisArtikla[OpisArtikla1='SUBJEKT_PREJEMNIK']"/>
		<xsl:variable name="narocnik" select="OpisiArtiklov/OpisArtikla[OpisArtikla1='SUBJECT_NAROCNIK']"/>

		<xsl:choose>
			<xsl:when test="$prejemnik or $narocnik">
				<table cellpadding="0" cellspacing="0" width="100%" border="0">
					<xsl:if test="$prejemnik">
						<tr>
							<td class="normal"><b>Prejemnik: </b>
							<xsl:call-template name="Subjekt">
								<xsl:with-param name="id" select="$prejemnik/OpisArtikla2"/>
							</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
					<xsl:if test="$narocnik">
						<tr>
							<td class="normal"><b>Naročnik: </b>
							<xsl:call-template name="Subjekt">
								<xsl:with-param name="id" select="$narocnik/OpisArtikla2"/>
							</xsl:call-template>
							</td>
						</tr>
					</xsl:if>
				</table>
			</xsl:when>
			<xsl:otherwise>&#160;</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<xsl:template name="Subjekt">
		<xsl:param name="id" />
		<xsl:for-each select="../PoljubnoBesedilo/Besedilo[Tekst1=$id]">
			<xsl:if test="Tekst2='IME'">
				<xsl:value-of select="concat($id, ' ',Tekst3, ', ')"/>
			</xsl:if>
			<xsl:if test="Tekst2='NASLOV'">
				<xsl:value-of select="Tekst3"/>
			</xsl:if>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="text()"/>
</xsl:stylesheet>