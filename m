Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFFF6813B1
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Jan 2023 15:46:21 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B5BA43F334
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Jan 2023 14:46:20 +0000 (UTC)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	by lists.linaro.org (Postfix) with ESMTPS id 17D14443FF
	for <greybus-dev@lists.linaro.org>; Mon, 30 Jan 2023 03:59:51 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=weissschuh.net header.s=mail header.b=QOokcRGe;
	spf=pass (lists.linaro.org: domain of linux@weissschuh.net designates 159.69.126.157 as permitted sender) smtp.mailfrom=linux@weissschuh.net;
	dmarc=none
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
	s=mail; t=1675051189;
	bh=BpfSdgQmWN7q99yWHa1NYztfRxaFIEEu1ai2aAeAuso=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QOokcRGe0+cEYV30EE7K9Tnus237x+2wRUdExZ68BeHv4mLeOm3rRO/IKzDmTGzkM
	 N5+cQhRULWGurL58OImk52Z/ioe1QyjTB1ObN8ZL0jiNAOXpPZ35+0hrPD7olM4umo
	 zAPhldvlVvB06EQ+hjis8ev0A3BokINldBcPeM4g=
Date: Mon, 30 Jan 2023 03:59:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20230130-hid-const-ll-driver-v1-8-3fc282b3b1d0@weissschuh.net>
References: <20230130-hid-const-ll-driver-v1-0-3fc282b3b1d0@weissschuh.net>
In-Reply-To: <20230130-hid-const-ll-driver-v1-0-3fc282b3b1d0@weissschuh.net>
To: Basavaraj Natikar <basavaraj.natikar@amd.com>,
 Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>,
 =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1675051185; l=815;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=BpfSdgQmWN7q99yWHa1NYztfRxaFIEEu1ai2aAeAuso=;
 b=S7ImS9NhnHkKy6L+nBosZuDJHdCEwxhmiAtNrw4E79jpSJgNI9SvNJVzb/JDpH6vuWcg5dnPXhMY
 sGhjwhWsBdgV22P2TJw9zNgSknRBpwnGxVZetNJivjYgVfn1yHod
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 17D14443FF
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_ZERO(0.00)[0];
	FREEMAIL_TO(0.00)[amd.com,kernel.org,redhat.com,microsoft.com,riseup.net,linux.intel.com,gmail.com,linuxfoundation.org];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[weissschuh.net];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[]
X-Rspamd-Action: no action
X-MailFrom: linux@weissschuh.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: LVVDMPUBJT533XCY2PZHPWTU6GYWHRL3
X-Message-ID-Hash: LVVDMPUBJT533XCY2PZHPWTU6GYWHRL3
X-Mailman-Approved-At: Mon, 30 Jan 2023 14:45:28 +0000
CC: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 8/9] platform/x86: asus-tf103c-dock: Constify toprow keymap
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LVVDMPUBJT533XCY2PZHPWTU6GYWHRL3/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Transfer-Encoding: base64

VGhpcyBzdHJ1Y3R1cmUgaXMgbmV2ZXIgbW9kaWZpZWQsIG1ha2UgaXQgY29uc3QuDQoNClNpZ25l
ZC1vZmYtYnk6IFRob21hcyBXZWnDn3NjaHVoIDxsaW51eEB3ZWlzc3NjaHVoLm5ldD4NCi0tLQ0K
IGRyaXZlcnMvcGxhdGZvcm0veDg2L2FzdXMtdGYxMDNjLWRvY2suYyB8IDIgKy0NCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvcGxhdGZvcm0veDg2L2FzdXMtdGYxMDNjLWRvY2suYyBiL2RyaXZlcnMvcGxhdGZvcm0v
eDg2L2FzdXMtdGYxMDNjLWRvY2suYw0KaW5kZXggODRjNDVlOGY1MWFkLi5hZWIxMTM4NDY0ZGYg
MTAwNjQ0DQotLS0gYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9hc3VzLXRmMTAzYy1kb2NrLmMNCisr
KyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2FzdXMtdGYxMDNjLWRvY2suYw0KQEAgLTI1OSw3ICsy
NTksNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGhpZF9sbF9kcml2ZXIgdGYxMDNjX2RvY2tfaGlk
X2xsX2RyaXZlciA9IHsNCiAJLnJhd19yZXF1ZXN0ID0gdGYxMDNjX2RvY2tfaGlkX3Jhd19yZXF1
ZXN0LA0KIH07DQogDQotc3RhdGljIGludCB0ZjEwM2NfZG9ja190b3Byb3dfY29kZXNbMTNdWzJd
ID0gew0KK3N0YXRpYyBjb25zdCBpbnQgdGYxMDNjX2RvY2tfdG9wcm93X2NvZGVzWzEzXVsyXSA9
IHsNCiAJLyogTm9ybWFsLCAgICAgICAgICAgIEFsdEdyIHByZXNzZWQgKi8NCiAJeyBLRVlfUE9X
RVIsICAgICAgICAgIEtFWV9GMSB9LA0KIAl7IEtFWV9SRktJTEwsICAgICAgICAgS0VZX0YyIH0s
DQoNCi0tIA0KMi4zOS4xDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5s
aW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVh
dmVAbGlzdHMubGluYXJvLm9yZwo=
