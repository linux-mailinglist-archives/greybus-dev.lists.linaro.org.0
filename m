Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 718E475440A
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Jul 2023 22:56:59 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8402C3E970
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Jul 2023 20:56:58 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	by lists.linaro.org (Postfix) with ESMTPS id B1EDF3E970
	for <greybus-dev@lists.linaro.org>; Fri, 14 Jul 2023 20:56:52 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of ukl@pengutronix.de designates 85.220.165.71 as permitted sender) smtp.mailfrom=ukl@pengutronix.de;
	dmarc=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qKPq6-000842-LE; Fri, 14 Jul 2023 22:56:34 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qKPq3-00EQSG-90; Fri, 14 Jul 2023 22:56:31 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qKPq2-004u3i-Cn; Fri, 14 Jul 2023 22:56:30 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Benson Leung <bleung@chromium.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Michael Walle <michael@walle.cc>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 14 Jul 2023 22:56:13 +0200
Message-Id: <20230714205623.2496590-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2799; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=V7W84rybwTdl40fJ1/AnlC1GGwwH+0UF4315YjbNZQU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBksbZmu/FZ2fPKgYn+/w94O57gxudeeMLxEF38z Ka6/i36EPaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZLG2ZgAKCRCPgPtYfRL+ Tr4aB/4kqY/a6BiMImBSLY61OyPOnkuRIsinCl91rdovh7+kgX2bxm4NOx2HpmLCkpbLgvTTGfe pVoVy7stf8h8nsV1bDVdAvTTRwse8oJGC/KcNH/sHxM3suaq6DIGhGo1Nb32+md2vc1LlWLslH2 mszcZlFV4BmYbl1jQUVOQ8KxfllFgtJPyHa/nvdjgeu2YzuxgkbzF/M2GD5dVEhcFao9uRXgbBy JgeRdj3szzC/ywFnL+GeqYi7Zi0gJ+OPi6SPnmUpUbfh1BKgTJJbF7+vSqoiSXx5vHLr3j7azgv tTi4ObF/obQigO4ODWvuMSwUJ01I3X/+sHgjtV0FaFfolv/W
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
X-Spamd-Result: default: False [-1.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_IN_DNSWL_HI(-1.00)[2a0a:edc0:0:900:1d::77:received,2a0a:edc0:0:c01:1d::a2:received];
	MID_CONTAINS_FROM(1.00)[];
	FORGED_SENDER(0.30)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	R_SPF_ALLOW(-0.20)[+mx:c];
	RCVD_IN_DNSWL_LOW(-0.10)[85.220.165.71:from];
	MIME_GOOD(-0.10)[text/plain];
	R_DKIM_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:25394, ipnet:85.220.128.0/17, country:DE];
	FREEMAIL_TO(0.00)[gmail.com,microchip.com,bootlin.com,broadcom.com,chromium.org,sntech.de,dabbelt.com,sifive.com,walle.cc,kernel.org,linuxfoundation.org];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	TAGGED_RCPT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[25];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ARC_NA(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: B1EDF3E970
X-Spamd-Bar: -
Message-ID-Hash: QISLZNJWV23R5LQ62AVDO4V54YFHQRU7
X-Message-ID-Hash: QISLZNJWV23R5LQ62AVDO4V54YFHQRU7
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-pwm@vger.kernel.org, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 00/10] pwm: Constistenly name pwm_chip variables "chip"
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/QISLZNJWV23R5LQ62AVDO4V54YFHQRU7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

d2hpbGUgd29ya2luZyBvbiBhbiBleHRlbnNpb24gZm9yIHRoZSBwd20gZnJhbWV3b3JrLCBJIG5v
dGljZWQgdGhhdCBzb21lDQpkcml2ZXJzIGFuZCBldmVuIHRoZSBjb3JlIG9ubHkgbmVhcmx5IGNv
bnNpc3RlbnRseSBuYW1lZCBhbGwgdmFyaWFibGVzDQphbmQgc3RydWN0IG1lbWJlcnMgaG9sZGlu
ZyBhIHBvaW50ZXIgdG8gYSBzdHJ1Y3QgcHdtX2NoaXAgImNoaXAiOg0KDQokIGdpdCBncmVwIC1Q
aG8gJ3N0cnVjdCBwd21fY2hpcCBcKipbYS16MC05X10rKCpubGE6W1woYS16MC05X10pJyB2Ni41
LXJjMSB8IHNvcnQgfCB1bmlxIC1jIHwgc29ydCAtbg0KICAgICAgMSBzdHJ1Y3QgcHdtX2NoaXAg
KnB3bQ0KICAgICAgMSBzdHJ1Y3QgcHdtX2NoaXAgcHdtDQogICAgICAxIHN0cnVjdCBwd21fY2hp
cCBwd21fY2hpcA0KICAgICAgMiBzdHJ1Y3QgcHdtX2NoaXAgKl9jaGlwDQogICAgICA0IHN0cnVj
dCBwd21fY2hpcCAqYw0KICAgICAgOCBzdHJ1Y3QgcHdtX2NoaXAgKnBjDQogICAgIDU3IHN0cnVj
dCBwd21fY2hpcCBjaGlwDQogICAgMzU4IHN0cnVjdCBwd21fY2hpcCAqY2hpcA0KDQpXaXRoIHRo
aXMgc2VyaWVzIGFwcGxpZWQgdGhlc2UgYXJlIGFsbCBjYWxsZWQgImNoaXAiIHdpdGggb25lIGV4
Y2VwdGlvbjoNClRoZSBsZWQgZHJpdmVyIGRyaXZlcnMvbGVkcy9yZ2IvbGVkcy1xY29tLWxwZy5j
IHVzZXMgInB3bSIuIE1heWJlDQoicHdtY2hpcCIgd291bGQgYmUgYSBiZXR0ZXIgbmFtZSwgYnV0
IEknbSBub3Qgc3VyZSB0aGF0IHVzaW5nICJjaGlwIiB3YXMNCmFuIGltcHJvdmVtZW50IHRoZXJl
IGFzIHRoaXMgaXNuJ3QgYSBwdXJlIHB3bSBkcml2ZXIuIEknbSBub3QgdG91Y2hpbmcNCnRoYXQg
b25lLg0KDQpUaGUgZmlyc3Qgb2ZmZW5kZXJzIEkgZm91bmQgd2VyZSB0aGUgY29yZSBhbmQgdGhl
IGF0bWVsLWhsY2RjIGRyaXZlci4NCkFmdGVyIEkgZm91bmQgdGhlc2UgSSBvcHRpbWlzdGljYWxs
eSBhc3N1bWVkIHRoZXNlIHdlcmUgdGhlIG9ubHkgb25lcw0Kd2l0aCB0aGUgdW51c3VhbCBuYW1l
cyBhbmQgc2VuZCBwYXRjaGVzIGZvciB0aGVzZSBvdXQgaW5kaXZpZHVhbGx5DQpiZWZvcmUgY2hl
Y2tpbmcgc3lzdGVtYXRpY2FsbHkuDQoNClRoZSBhdG1lbC1obGNkYyBwYXRjaCBpcyBpbmNsdWRl
ZCBoZXJlIHVuY2hhbmdlZCwgdGhlIGNvcmUgcGF0Y2ggbm93DQphbHNvIGFkYXB0ZWQgdGhlIGRl
Y2xhcmF0aW9uIG9mIHRoZSBjaGFuZ2VkIGZ1bmN0aW9ucyBpbiA8bGludXgvcHdtLmg+Lg0KSSBt
YXJrZWQgdGhlc2UgdHdvIGFzICJzdXBlcnNlZGVkIiBpbiBwYXRjaHdvcmsgYWxyZWFkeS4NCg0K
QWxsIHBhdGNoZXMgaW4gdGhpcyBzZXJpZXMgYXJlIHBhaXJ3aXNlIGluZGVwZW5kZW50IG9mIGVh
Y2ggb3RoZXIuIEkNCmRvbid0IGtub3cgaWYgdGhlIHN0YWdpbmcgcGF0Y2ggc2hvdWxkIGJldHRl
ciBnbyBpbiB2aWEgdGhlIGdyZXlidXMgdHJlZQ0Kb3IgdmlhIHB3bS4gQm90aCBpcyBwb3NzaWJs
ZSB3aXRob3V0IG5lZWRpbmcgY29vcmRpbmF0aW9uLg0KDQpCZXN0IHJlZ2FyZHMNClV3ZQ0KDQoN
ClV3ZSBLbGVpbmUtS8O2bmlnICgxMCk6DQogIHB3bTogVXNlIGEgY29uc2lzdGVudCBuYW1lIGZv
ciBwd21fY2hpcCBwb2ludGVycyBpbiB0aGUgY29yZQ0KICBwd206IGF0bWVsLWhsY2RjOiBVc2Ug
Y29uc2lzdGVudCB2YXJpYWJsZSBuYW1pbmcNCiAgcHdtOiBiY20ta29uYTogQ29uc2lzdGVubHkg
bmFtZSBwd21fY2hpcCB2YXJpYWJsZXMgImNoaXAiDQogIHB3bTogY3JjOiBDb25zaXN0ZW5seSBu
YW1lIHB3bV9jaGlwIHZhcmlhYmxlcyAiY2hpcCINCiAgcHdtOiBjcm9zLWVjOiBDb25zaXN0ZW5s
eSBuYW1lIHB3bV9jaGlwIHZhcmlhYmxlcyAiY2hpcCINCiAgcHdtOiBscDM5NDM6IENvbnNpc3Rl
bmx5IG5hbWUgcHdtX2NoaXAgdmFyaWFibGVzICJjaGlwIg0KICBwd206IHJvY2tjaGlwOiBDb25z
aXN0ZW5seSBuYW1lIHB3bV9jaGlwIHZhcmlhYmxlcyAiY2hpcCINCiAgcHdtOiBzaWZpdmU6IENv
bnNpc3Rlbmx5IG5hbWUgcHdtX2NoaXAgdmFyaWFibGVzICJjaGlwIg0KICBwd206IHNsMjhjcGxk
OiBDb25zaXN0ZW5seSBuYW1lIHB3bV9jaGlwIHZhcmlhYmxlcyAiY2hpcCINCiAgc3RhZ2luZzog
Z3JleWJ1czogcHdtOiBDb25zaXN0ZW5seSBuYW1lIHB3bV9jaGlwIHZhcmlhYmxlcyAiY2hpcCIN
Cg0KIGRyaXZlcnMvcHdtL2NvcmUuYyAgICAgICAgICAgIHwgMjggKysrKysrKy0tLS0tLS0tDQog
ZHJpdmVycy9wd20vcHdtLWF0bWVsLWhsY2RjLmMgfCA2NCArKysrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tLS0tLS0tLQ0KIGRyaXZlcnMvcHdtL3B3bS1iY20ta29uYS5jICAgIHwgIDQgKy0tDQog
ZHJpdmVycy9wd20vcHdtLWNyYy5jICAgICAgICAgfCAgNCArLS0NCiBkcml2ZXJzL3B3bS9wd20t
Y3Jvcy1lYy5jICAgICB8IDEwICsrKy0tLQ0KIGRyaXZlcnMvcHdtL3B3bS1scDM5NDMuYyAgICAg
IHwgIDQgKy0tDQogZHJpdmVycy9wd20vcHdtLXJvY2tjaGlwLmMgICAgfCAgNCArLS0NCiBkcml2
ZXJzL3B3bS9wd20tc2lmaXZlLmMgICAgICB8ICA0ICstLQ0KIGRyaXZlcnMvcHdtL3B3bS1zbDI4
Y3BsZC5jICAgIHwgMTAgKysrLS0tDQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvcHdtLmMgfCAx
MiArKystLS0tDQogaW5jbHVkZS9saW51eC9wd20uaCAgICAgICAgICAgfCAgNiArKy0tDQogMTEg
ZmlsZXMgY2hhbmdlZCwgNzUgaW5zZXJ0aW9ucygrKSwgNzUgZGVsZXRpb25zKC0pDQoNCmJhc2Ut
Y29tbWl0OiAwNmMyYWZiODYyZjlkYThkYzVlZmE0YjYwNzZhMGU0OGMzZmJhYWE1DQotLSANCjIu
MzkuMg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpn
cmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpU
byB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxp
bmFyby5vcmcK
