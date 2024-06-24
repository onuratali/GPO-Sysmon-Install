# GPO-Sysmon-Install
Sysmon (System Monitor) Dağıtımı ve Yönetimi için Group Policy Objects (GPO) Kullanımı

Bu proje, Active Directory (AD) ortamında bulunan Windows tabanlı bilgisayarların güvenlik izleme yeteneklerini artırmak için Sysmon'u (System Monitor) dağıtmak ve yapılandırmak için Group Policy Objects (GPO) kullanımını hedeflemektedir. Sysmon, bilgisayar sistemlerinde olası tehditleri izlemek ve tespit etmek için gelişmiş bir sistem izleme aracıdır. Bu proje, kurum içi bilgisayarların güvenlik durumunu artırmak amacıyla Sysmon'un etkin bir şekilde dağıtılmasını ve yönetilmesini sağlamayı amaçlamaktadır.

Proje Adımları:

Sysmon'un İndirilmesi ve Hazırlanması:

En son Sysmon sürümü Microsoft Sysinternals web sitesinden indirilir.
Sysmon'un izlenecek olayları ve davranışlarını belirlemek için bir XML konfigürasyon dosyası oluşturulur. Örneğin, hangi işlemlerin izleneceği, hangi ağ bağlantılarının kaydedileceği gibi ayarlar XML dosyasında tanımlanır.
Group Policy Object (GPO) Oluşturma:

GPO, Active Directory üzerinde bilgisayarlar ve kullanıcılar için yönetim politikalarını otomatik olarak uygulamak için kullanılır.
GPO Yönetim Konsolu üzerinden yeni bir GPO oluşturulur ve adı "Sysmon Deployment" olarak belirlenir.
Sysmon'un Dağıtılması ve Yapılandırılması:

Sysmon'un dağıtımı için GPO'da "Software Installation" özelliği kullanılır. Sysmon'un MSI dosyası GPO'ya yüklenir ve hedef bilgisayarlar üzerinde otomatik olarak dağıtılır.
Sysmon yapılandırma dosyası (XML), bir oturum açma scripti veya PowerShell scripti aracılığıyla hedef bilgisayarların C:\Windows dizinine kopyalanır ve Sysmon yapılandırılır.
GPO'nun Uygulanması ve Kontrol Edilmesi:

Oluşturulan GPO, ilgili Organizational Unit (OU) veya tüm domain için etkinleştirilir.
Hedef bilgisayarlar için GPO'nun uygulandığından emin olmak için gpupdate /force komutu kullanılır veya bilgisayarlar yeniden başlatılır.
GPO'nun başarıyla uygulandığını doğrulamak için hedef bilgisayarların Sysmon tarafından izlenen olayları kaydetmesi beklenir.
