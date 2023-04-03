Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 515756D4C2E
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 17:41:35 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5EFB83ED16
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 15:41:34 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	by lists.linaro.org (Postfix) with ESMTPS id 4F5A23ED16
	for <greybus-dev@lists.linaro.org>; Mon,  3 Apr 2023 15:41:30 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of ukl@pengutronix.de designates 85.220.165.71 as permitted sender) smtp.mailfrom=ukl@pengutronix.de;
	dmarc=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pjMIC-0004b4-3b; Mon, 03 Apr 2023 17:40:24 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pjMI6-008iaO-0i; Mon, 03 Apr 2023 17:40:18 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pjMI5-00AHwO-5x; Mon, 03 Apr 2023 17:40:17 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Deepak R Varma <drv@mailo.com>,
	Yuan Can <yuancan@huawei.com>,
	Simon Horman <horms@verge.net.au>,
	Sven Van Asbroeck <TheSven73@gmail.com>,
	Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Marc Dietrich <marvin24@gmx.de>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Adrien Thierry <athierry@redhat.com>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Jakob Koschel <jakobkoschel@gmail.com>
Date: Mon,  3 Apr 2023 17:39:50 +0200
Message-Id: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5012; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=QcqVobs2IGjtDB50UkJ1/XzbU0MSF7u4i5A5EQTdJQg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKvM0O0Tc0pjx/M/6GF+i1BCxRCmy/MPnr7RU1 yFBMKjXOfaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCrzNAAKCRCPgPtYfRL+ Tpy2CACy6x0vU06fdXyxll9SO1keGvUJwPKWx+3c3iql31e1Lm+qBWx4HjLGWAH1BCBwe3626DH lDN1BYh6O1PbPw6fq7eefH5DBIAVGnQSOsyyOFUmo5y3kXQn60JKzxX7xSKuHzUxXXkaj6BYFEl dl3VmQyiYF0+g1PGODFTQSeX9kxjPWoD5g9e11a2P8dLs8Iu1lwVEIyHyEyjcsrYsB3Wj23JY5E t8/rn6+663fTt7WDV/oQ0q40Q54RNHtq2Ou/9xwLL/Jm63tGZ6gAnvbnQcFoAji4hrf+apNVsp/ aW4zaDe6809yWD3o9ofDidHCWNev/88M0ILROQDh07UCEMyG
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 4F5A23ED16
X-Spamd-Bar: /
X-Spamd-Result: default: False [-0.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	FORGED_SENDER(0.30)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:25394, ipnet:85.220.128.0/17, country:DE];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FREEMAIL_TO(0.00)[linuxfoundation.org,mailo.com,huawei.com,verge.net.au,gmail.com,kernel.org,collabora.com,microchip.com,bootlin.com,pengutronix.de,linaro.org,baylibre.com,ideasonboard.com,vanguardiasur.com.ar,csie.org,sholland.org,stgolabs.net,gmx.de,broadcom.com,linux.intel.com,redhat.com,i2se.com,raspberrypi.com];
	R_DKIM_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,pengutronix.de,lists.linaro.org,vger.kernel.org,lists.infradead.org,gmail.com,nxp.com,baylibre.com,googlemail.com,lists.launchpad.net,broadcom.com];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	RCPT_COUNT_GT_50(0.00)[56];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	TAGGED_RCPT(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[]
Message-ID-Hash: UGRGGTROK53YUW76AJGVFVS5JHDIPU4J
X-Message-ID-Hash: UGRGGTROK53YUW76AJGVFVS5JHDIPU4J
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-staging@lists.linux.dev, kernel@pengutronix.de, greybus-dev@lists.linaro.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, ac100@lists.launchpad.net, linux-tegra@vger.kernel.org, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-rpi-kernel@lists.infradead.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 00/24] staging: Convert to platform remove callback returning void
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UGRGGTROK53YUW76AJGVFVS5JHDIPU4J/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8sDQoNCnRoaXMgc2VyaWVzIGFkYXB0cyB0aGUgcGxhdGZvcm0gZHJpdmVycyBiZWxvdyBk
cml2ZXJzL3N0YWdpbmcgdG8gdXNlIHRoZQ0KLnJlbW92ZV9uZXcoKSBjYWxsYmFjay4gQ29tcGFy
ZWQgdG8gdGhlIHRyYWRpdGlvbmFsIC5yZW1vdmUoKSBjYWxsYmFjaw0KLnJlbW92ZV9uZXcoKSBy
ZXR1cm5zIG5vIHZhbHVlLiBUaGlzIGlzIGEgZ29vZCB0aGluZyBiZWNhdXNlIHRoZSBkcml2ZXIN
CmNvcmUgZG9lc24ndCAoYW5kIGNhbm5vdCkgY29wZSBmb3IgZXJyb3JzIGR1cmluZyByZW1vdmUu
IFRoZSBvbmx5IGVmZmVjdA0Kb2YgYSBub24temVybyByZXR1cm4gdmFsdWUgaW4gLnJlbW92ZSgp
IGlzIHRoYXQgdGhlIGRyaXZlciBjb3JlIGVtaXRzIGENCndhcm5pbmcuIFRoZSBkZXZpY2UgaXMg
cmVtb3ZlZCBhbnlob3cgYW5kIGFuIGVhcmx5IHJldHVybiBmcm9tIC5yZW1vdmUoKQ0KdXN1YWxs
eSB5aWVsZHMgYSByZXNvdXJjZSBsZWFrLg0KDQpCeSBjaGFuZ2luZyB0aGUgcmVtb3ZlIGNhbGxi
YWNrIHRvIHJldHVybiB2b2lkIGRyaXZlciBhdXRob3JzIGNhbm5vdA0KcmVhc29uYWJseSBhc3N1
bWUgYW55IG1vcmUgdGhhdCB0aGVyZSBpcyBzb21lIGtpbmQgb2YgY2xlYW51cCBsYXRlci4NCg0K
QWxsIGRyaXZlcnMgaW4gc3RhZ2luZyBhbHJlYWR5IHJldHVybiB6ZXJvIGluIHRoZWlyIHJlbW92
ZSBjYWxsYmFjaywgc28NCnRoZXkgY2FuIGJlIHRyaXZpYWxseSBjb252ZXJ0ZWQuDQoNClRoZSBj
aGFuZ2VzIHRvIHRoZSBpbmRpdmlkdWFsIGRyaXZlcnMgYXJlIGFsbCBvcnRob2dvbmFsLiBJZiBJ
IG5lZWQgdG8NCnJlc2VuZCBzb21lIHBhdGNoZXMgYmVjYXVzZSBvZiBzb21lIHJldmlldyBmZWVk
YmFjaywgSSdkIGxpa2UgdG8gb25seQ0Kc2VuZCB0aGUgcGF0Y2hlcyB0aGF0IGFjdHVhbGx5IG5l
ZWRlZCBjaGFuZ2VzLCBzbyBwbGVhc2UgcGljayB1cCB0aGUNCnJlbWFpbmluZyBwYXRjaGVzIHRo
YXQgZG9uJ3QgbmVlZCBjaGFuZ2luZyB0byByZWR1Y2UgdGhlIGFtb3VudCBvZiBtYWlsLg0KDQpC
ZXN0IHJlZ2FyZHMNClV3ZQ0KDQpVd2UgS2xlaW5lLUvDtm5pZyAoMjQpOg0KICBzdGFnaW5nOiBh
eGlzLWZpZm86IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2
b2lkDQogIHN0YWdpbmc6IGVteHhfdWRjOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxs
YmFjayByZXR1cm5pbmcgdm9pZA0KICBzdGFnaW5nOiBmaWVsZGJ1czogYXJjeC1hbnlidXM6IENv
bnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrDQogICAgcmV0dXJuaW5nIHZvaWQNCiAg
c3RhZ2luZzogZ3JleWJ1czogYXJjaGUtYXBiLWN0cmw6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVt
b3ZlIGNhbGxiYWNrDQogICAgcmV0dXJuaW5nIHZvaWQNCiAgc3RhZ2luZzogZ3JleWJ1czogYXJj
aGU6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZw0KICAgIHZv
aWQNCiAgc3RhZ2luZzogbWVkaWE6IGF0bWVsLXNhbWE1ZDItaXNjOiBDb252ZXJ0IHRvIHBsYXRm
b3JtIHJlbW92ZSBjYWxsYmFjaw0KICAgIHJldHVybmluZyB2b2lkDQogIHN0YWdpbmc6IG1lZGlh
OiBhdG1lbC1zYW1hN2c1LWlzYzogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sN
CiAgICByZXR1cm5pbmcgdm9pZA0KICBzdGFnaW5nOiBtZWRpYTogaW14LW1lZGlhLWNzaTogQ29u
dmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sNCiAgICByZXR1cm5pbmcgdm9pZA0KICBz
dGFnaW5nOiBtZWRpYTogaW14LW1lZGlhLWRldjogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUg
Y2FsbGJhY2sNCiAgICByZXR1cm5pbmcgdm9pZA0KICBzdGFnaW5nOiBtZWRpYTogaW14Ni1taXBp
LWNzaTI6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrDQogICAgcmV0dXJuaW5n
IHZvaWQNCiAgc3RhZ2luZzogbWVkaWE6IGlteDhtcS1taXBpLWNzaTI6IENvbnZlcnQgdG8gcGxh
dGZvcm0gcmVtb3ZlIGNhbGxiYWNrDQogICAgcmV0dXJuaW5nIHZvaWQNCiAgc3RhZ2luZzogbWVk
aWE6IG1lc29uOiB2ZGVjOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjaw0KICAg
IHJldHVybmluZyB2b2lkDQogIHN0YWdpbmc6IG1lZGlhOiBvbWFwNGlzczogQ29udmVydCB0byBw
bGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sNCiAgICByZXR1cm5pbmcgdm9pZA0KICBzdGFnaW5nOiBt
ZWRpYTogcmt2ZGVjOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5p
bmcNCiAgICB2b2lkDQogIHN0YWdpbmc6IG1lZGlhOiBzdW54aTogY2VkcnVzOiBDb252ZXJ0IHRv
IHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjaw0KICAgIHJldHVybmluZyB2b2lkDQogIHN0YWdpbmc6
IG1lZGlhOiBzdW42aS1pc3A6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrDQog
ICAgcmV0dXJuaW5nIHZvaWQNCiAgc3RhZ2luZzogbW9zdDogZGltMjogQ29udmVydCB0byBwbGF0
Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nDQogICAgdm9pZA0KICBzdGFnaW5nOiBudmVj
OiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZA0KICBz
dGFnaW5nOiBudmVjOiBudmVjX2tiZDogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJh
Y2sgcmV0dXJuaW5nDQogICAgdm9pZA0KICBzdGFnaW5nOiBudmVjX3Bvd2VyOiBDb252ZXJ0IHRv
IHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcNCiAgICB2b2lkDQogIHN0YWdpbmc6
IG52ZWNfcHMyOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcg
dm9pZA0KICBzdGFnaW5nOiBvY3Rlb246IGV0aGVybmV0OiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJl
bW92ZSBjYWxsYmFjaw0KICAgIHJldHVybmluZyB2b2lkDQogIHN0YWdpbmc6IHZjMDRfc2Vydmlj
ZXM6IGJjbTI4MzUtY2FtZXJhOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZQ0KICAgIGNhbGxi
YWNrIHJldHVybmluZyB2b2lkDQogIHN0YWdpbmc6IHZjMDRfc2VydmljZXM6IHZjaGlxX2FybTog
Q29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sNCiAgICByZXR1cm5pbmcgdm9pZA0K
DQogZHJpdmVycy9zdGFnaW5nL2F4aXMtZmlmby9heGlzLWZpZm8uYyAgICAgICAgICAgICAgICAg
ICAgICAgfCA2ICsrLS0tLQ0KIGRyaXZlcnMvc3RhZ2luZy9lbXh4X3VkYy9lbXh4X3VkYy5jICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgNiArKy0tLS0NCiBkcml2ZXJzL3N0YWdpbmcvZmllbGRi
dXMvYW55YnVzcy9hcmN4LWFueWJ1cy5jICAgICAgICAgICAgICB8IDUgKystLS0NCiBkcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy9hcmNoZS1hcGItY3RybC5jICAgICAgICAgICAgICAgICAgICB8IDYg
KystLS0tDQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXJjaGUtcGxhdGZvcm0uYyAgICAgICAg
ICAgICAgICAgICAgfCA2ICsrLS0tLQ0KIGRyaXZlcnMvc3RhZ2luZy9tZWRpYS9kZXByZWNhdGVk
L2F0bWVsL2F0bWVsLXNhbWE1ZDItaXNjLmMgIHwgNiArKy0tLS0NCiBkcml2ZXJzL3N0YWdpbmcv
bWVkaWEvZGVwcmVjYXRlZC9hdG1lbC9hdG1lbC1zYW1hN2c1LWlzYy5jICB8IDYgKystLS0tDQog
ZHJpdmVycy9zdGFnaW5nL21lZGlhL2lteC9pbXgtbWVkaWEtY3NpLmMgICAgICAgICAgICAgICAg
ICAgfCA2ICsrLS0tLQ0KIGRyaXZlcnMvc3RhZ2luZy9tZWRpYS9pbXgvaW14LW1lZGlhLWRldi5j
ICAgICAgICAgICAgICAgICAgIHwgNiArKy0tLS0NCiBkcml2ZXJzL3N0YWdpbmcvbWVkaWEvaW14
L2lteDYtbWlwaS1jc2kyLmMgICAgICAgICAgICAgICAgICB8IDYgKystLS0tDQogZHJpdmVycy9z
dGFnaW5nL21lZGlhL2lteC9pbXg4bXEtbWlwaS1jc2kyLmMgICAgICAgICAgICAgICAgfCA2ICsr
LS0tLQ0KIGRyaXZlcnMvc3RhZ2luZy9tZWRpYS9tZXNvbi92ZGVjL3ZkZWMuYyAgICAgICAgICAg
ICAgICAgICAgIHwgNiArKy0tLS0NCiBkcml2ZXJzL3N0YWdpbmcvbWVkaWEvb21hcDRpc3MvaXNz
LmMgICAgICAgICAgICAgICAgICAgICAgICB8IDYgKystLS0tDQogZHJpdmVycy9zdGFnaW5nL21l
ZGlhL3JrdmRlYy9ya3ZkZWMuYyAgICAgICAgICAgICAgICAgICAgICAgfCA1ICsrLS0tDQogZHJp
dmVycy9zdGFnaW5nL21lZGlhL3N1bnhpL2NlZHJ1cy9jZWRydXMuYyAgICAgICAgICAgICAgICAg
fCA2ICsrLS0tLQ0KIGRyaXZlcnMvc3RhZ2luZy9tZWRpYS9zdW54aS9zdW42aS1pc3Avc3VuNmlf
aXNwLmMgICAgICAgICAgIHwgNiArKy0tLS0NCiBkcml2ZXJzL3N0YWdpbmcvbW9zdC9kaW0yL2Rp
bTIuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDYgKystLS0tDQogZHJpdmVycy9zdGFn
aW5nL252ZWMvbnZlYy5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA2ICsrLS0t
LQ0KIGRyaXZlcnMvc3RhZ2luZy9udmVjL252ZWNfa2JkLmMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgNiArKy0tLS0NCiBkcml2ZXJzL3N0YWdpbmcvbnZlYy9udmVjX3Bvd2VyLmMgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8IDYgKystLS0tDQogZHJpdmVycy9zdGFnaW5nL252ZWMv
bnZlY19wczIuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCA2ICsrLS0tLQ0KIGRyaXZl
cnMvc3RhZ2luZy9vY3Rlb24vZXRoZXJuZXQuYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
NSArKy0tLQ0KIC4uLi9zdGFnaW5nL3ZjMDRfc2VydmljZXMvYmNtMjgzNS1jYW1lcmEvYmNtMjgz
NS1jYW1lcmEuYyAgIHwgNiArKy0tLS0NCiAuLi4vc3RhZ2luZy92YzA0X3NlcnZpY2VzL2ludGVy
ZmFjZS92Y2hpcV9hcm0vdmNoaXFfYXJtLmMgICB8IDYgKystLS0tDQogMjQgZmlsZXMgY2hhbmdl
ZCwgNDggaW5zZXJ0aW9ucygrKSwgOTMgZGVsZXRpb25zKC0pDQoNCg0KYmFzZS1jb21taXQ6IGZl
MTVjMjZlZTI2ZWZhMTE3NDFhN2I2MzJlOWYyM2IwMWFjYTRjYzYNCi0tIA0KMi4zOS4yDQoNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2
IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2Ny
aWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
