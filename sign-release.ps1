$cert = New-SelfSignedCertificate -CertStoreLocation Cert:\CurrentUser\My -Type CodeSigningCert -Subject "dupeguru Autobuild"
Get-ChildItem -Path Cert:\CurrentUser\My | ? Subject -EQ "CN=dupeguru Autobuild"

Move-Item -Force -Path $cert.PSPath -Destination "Cert:\CurrentUser\Root"

Set-AuthenticodeSignature -FilePath dist\dupeguru-win64\dupeguru-win64.exe
Set-AuthenticodeSignature -FilePath dist\dupeguru_win64_*.exe
