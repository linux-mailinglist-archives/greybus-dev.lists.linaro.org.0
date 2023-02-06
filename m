Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4D368C13D
	for <lists+greybus-dev@lfdr.de>; Mon,  6 Feb 2023 16:24:59 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 779B1413F3
	for <lists+greybus-dev@lfdr.de>; Mon,  6 Feb 2023 15:24:58 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lists.linaro.org (Postfix) with ESMTPS id 90C533EA2B
	for <greybus-dev@lists.linaro.org>; Mon,  6 Feb 2023 15:24:52 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=SENYgnak;
	spf=pass (lists.linaro.org: domain of benjamin.tissoires@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=benjamin.tissoires@redhat.com;
	dmarc=pass (policy=none) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675697092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UeRsUwXraH00cd2sE5Kq7ZYAcSvC5OMPd9fEpRmgyQk=;
	b=SENYgnakRJhx/uNe3a8pMjJAVC7mnf0NqW59TnQRnupUIGn01AVsYTSqhH8lhT3PvbWc0y
	tfqjdvEofjMBjK/b+Ns056kOON8Pr2zW7MEIf5v1Q6AdC1f1GSEsG3jSk7ogJ3eDyp/0YF
	PNUt2KUC8qEqUjsf/jDhoypBO+Kwne8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-352-RJztv-YbNHGzSkzF7vckjg-1; Mon, 06 Feb 2023 10:24:51 -0500
X-MC-Unique: RJztv-YbNHGzSkzF7vckjg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A01A1885627;
	Mon,  6 Feb 2023 15:24:49 +0000 (UTC)
Received: from plouf.local (ovpn-192-160.brq.redhat.com [10.40.192.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A5D9FC15BA0;
	Mon,  6 Feb 2023 15:24:45 +0000 (UTC)
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
To: Basavaraj Natikar <basavaraj.natikar@amd.com>,
 Jiri Kosina <jikos@kernel.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>,
 =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
In-Reply-To: <20230130-hid-const-ll-driver-v1-0-3fc282b3b1d0@weissschuh.net>
References: <20230130-hid-const-ll-driver-v1-0-3fc282b3b1d0@weissschuh.net>
Message-Id: <167569708530.2863874.629972838322099394.b4-ty@redhat.com>
Date: Mon, 06 Feb 2023 16:24:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 90C533EA2B
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-6.00 / 15.00];
	DWL_DNSWL_HI(-3.50)[redhat.com:dkim];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,none];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:170.10.133.0/24];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,kernel.org,microsoft.com,riseup.net,linux.intel.com,gmail.com,redhat.com,linuxfoundation.org,weissschuh.net];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:30031, ipnet:170.10.132.0/23, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[redhat.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[170.10.133.124:from]
X-Rspamd-Action: no action
Message-ID-Hash: LLRRD26DR5H6LE4NKO4PW5TZ7RELJ2PW
X-Message-ID-Hash: LLRRD26DR5H6LE4NKO4PW5TZ7RELJ2PW
X-MailFrom: benjamin.tissoires@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 0/9] HID: Constify lowlevel HID drivers
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LLRRD26DR5H6LE4NKO4PW5TZ7RELJ2PW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Transfer-Encoding: base64

T24gTW9uLCAzMCBKYW4gMjAyMyAwMzo1OTozNiArMDAwMCwgVGhvbWFzIFdlacOfc2NodWggd3Jv
dGU6DQo+IFNpbmNlIDUyZDIyNTM0NjkwNCAoIkhJRDogTWFrZSBsb3dsZXZlbCBkcml2ZXIgc3Ry
dWN0cyBjb25zdCIpIHRoZQ0KPiBsb3dsZXZlbCBISUQgZHJpdmVycyBhcmUgb25seSBleHBvc2Vk
IGFzIGNvbnN0Lg0KPiANCj4gVGFrZSBhZHZhbnRhZ2Ugb2YgdGhpcyB0byBjb25zdGlmeSB0aGUg
dW5kZXJseWluZyBzdHJ1Y3R1cmVzLCB0b28uDQo+IA0KPiANCg0KQXBwbGllZCB0byBoaWQvaGlk
LmdpdCAoZm9yLTYuMy9oaWQtY29yZSksIHRoYW5rcyENCg0KWzEvOV0gSElEOiBhbWRfc2ZoOiBD
b25zdGlmeSBsb3dsZXZlbCBISUQgZHJpdmVyDQogICAgICBodHRwczovL2dpdC5rZXJuZWwub3Jn
L2hpZC9oaWQvYy82NWI3MDE1YmZlMTYNClsyLzldIEhJRDogaHlwZXJ2OiBDb25zdGlmeSBsb3ds
ZXZlbCBISUQgZHJpdmVyDQogICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2hpZC9oaWQvYy9k
MzgyMTNhOTExYzUNClszLzldIEhJRDogbG9naXRlY2gtZGo6IENvbnN0aWZ5IGxvd2xldmVsIEhJ
RCBkcml2ZXINCiAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvaGlkL2hpZC9jLzY2MmVlZThk
NDZkZg0KWzQvOV0gSElEOiBzdGVhbTogQ29uc3RpZnkgbG93bGV2ZWwgSElEIGRyaXZlcg0KICAg
ICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9oaWQvaGlkL2MvZGRiNjc5MmYwZWYyDQpbNS85XSBI
SUQ6IGludGVsLWlzaC1oaWQ6IENvbnN0aWZ5IGxvd2xldmVsIEhJRCBkcml2ZXINCiAgICAgIGh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvaGlkL2hpZC9jLzMzNTJjM2UwYmY5Yg0KWzYvOV0gSElEOiBz
dXJmYWNlLWhpZDogQ29uc3RpZnkgbG93bGV2ZWwgSElEIGRyaXZlcg0KICAgICAgaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9oaWQvaGlkL2MvZGQzNTBhZmMxNzU3DQpbNy85XSBwbGF0Zm9ybS94ODY6
IGFzdXMtdGYxMDNjLWRvY2s6IENvbnN0aWZ5IGxvd2xldmVsIEhJRCBkcml2ZXINCiAgICAgIGh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvaGlkL2hpZC9jLzYzNTA5YjE0OWYxYg0KWzgvOV0gcGxhdGZv
cm0veDg2OiBhc3VzLXRmMTAzYy1kb2NrOiBDb25zdGlmeSB0b3Byb3cga2V5bWFwDQogICAgICBo
dHRwczovL2dpdC5rZXJuZWwub3JnL2hpZC9oaWQvYy83ODNjMzM5NGI0OTMNCls5LzldIHN0YWdp
bmc6IGdyZXlidXM6IGhpZDogQ29uc3RpZnkgbG93bGV2ZWwgSElEIGRyaXZlcg0KICAgICAgaHR0
cHM6Ly9naXQua2VybmVsLm9yZy9oaWQvaGlkL2MvZmYxN2JiODc2MDE0DQoNCkNoZWVycywNCi0t
IA0KQmVuamFtaW4gVGlzc29pcmVzIDxiZW5qYW1pbi50aXNzb2lyZXNAcmVkaGF0LmNvbT4NCg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1k
ZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJz
Y3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3Jn
Cg==
